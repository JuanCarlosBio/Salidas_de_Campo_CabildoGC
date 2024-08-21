library(tidyverse)
library(sf)
library(leaflet)
library(leaflet.extras)
library(htmlwidgets)

tracks <- read_sf("track_results/senderos_salidas_campo.shp") %>%
  mutate(date = str_replace(date, "track_data", ""))

map <- leaflet() |>
  setView(-15.6, 27.95, zoom = 10.5) |>
  addProviderTiles("Esri.WorldImagery") |>
  addPolylines(
    data = tracks, 
    color = "#FF5733",  
    weight = 4,         
    opacity = 1,        
    popup = ~paste0(
      "ID: ", ID, "<br>",
      "Fecha de Salida de campo: ", date
    )
  );map

saveWidget(map, file = "index.html")
