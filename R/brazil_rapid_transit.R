#' Download Brazil's rapid transit corridors and stops
#'
#' Downloads Brazil's rapid transit corridors and stops made available by ITDP
#' Brasil at
#' [Mobilidados](https://mobilidados.org.br/map-of-rapid-transit-in-brazil).
#'
#' @return A list with two entries: one sf with the transit stops, and another
#' one with the transit corridors.
#'
#' @export
brazil_rapid_transit <- function() {
  # download corridors and stops from ITDP Brasil map as a '.kml' file

  data_url <- "https://www.google.com/maps/d/kml?force_kml=1&mid=1cLzr27liGdMkBLij1agB0cdNumgVYpn3"
  tmpf <- tempfile(pattern = "brail_rapid_transit", fileext = ".kmz")
  utils::download.file(data_url, tmpf)

  # convert to sf - read all layers and bind them together

  layer_names <- sf::st_layers(tmpf)$name
  point_layers <- layer_names[grepl("Estacoes$", layer_names)]
  line_layers <- layer_names[grepl("Corredores$", layer_names)]
  layer_groups <- list(point_layers, line_layers)

  rapid_transit_sf <- lapply(
    layer_groups,
    function(i) read_layers(i, tmpf)
  )
  names(rapid_transit_sf) <- c("estacoes", "corredores")

  rapid_transit_sf
}

read_layers <- function(layer_names, file) {
  layers_sf <- lapply(layer_names, function(i) to_sf(i, file))
  layers_sf <- data.table::rbindlist(layers_sf)
  layers_sf <- sf::st_as_sf(layers_sf)
}

to_sf <- function(layer_name, file) {
  cols_to_drop <- c(
    "timestamp",
    "begin",
    "end",
    "altitudeMode",
    "tessellate",
    "extrude",
    "visibility",
    "drawOrder",
    "icon",
    "Name",
    "description"
  )

  layer <- data.table::setDT(
    sf::st_read(file, layer = layer_name, quiet = TRUE)
  )
  layer[, eval(cols_to_drop) := NULL]

  data.table::setnames(
    layer,
    old = names(layer),
    new = c(
      "modo",
      "cidade",
      "corredor",
      "estacao",
      "tipo",
      "situacao",
      "ano",
      "tma",
      "tma_info",
      "geometry"
    )
  )
}
