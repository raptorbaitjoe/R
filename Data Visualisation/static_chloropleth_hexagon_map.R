install.packages(c("sf", "ggmap", "ggplot2", "dplyr", "viridis", "rmapshaper"))

library(sf)
library(ggmap)
library(ggplot2)
library(dplyr)
library(viridis)
library(rmapshaper)



# Load local shapefile

zip_path <- "C:/Users/Joseph/Downloads/Countries_December_2024_Boundaries_UK_BFC_6983126662299524946.zip"

# Unzip to a temp directory (or choose your own)
unzip_dir <- tempdir()                       # set path for unzip location
utils::unzip(zip_path, exdir = unzip_dir)    # unzip function - take from zip path, place in unzip path

# Find the .shp file (in case the zip has multiple files)
shp_file <- base::list.files(unzip_dir, pattern = "\\.shp$", full.names = TRUE)[1]

# Read the shapefile
england_shapefile <- sf::st_read(shp_file) %>%
  filter(CTRY24CD == "E92000001") %>%     # Filter to just England
  st_transform(4326)                      # WGS84 for mapping



england_simple <- ms_simplify(england_shapefile, keep = 0.05)

remove(england_shapefile)

hex_grid <- st_make_grid(england_simple, cellsize = 0.3, square = FALSE) %>%
  st_as_sf() %>%
  st_filter(england_simple)


# Add dummy values
set.seed(42)
hex_grid$val <- runif(nrow(hex_grid), 0, 100)

map <- ggplot() +
  geom_sf(data = england_shapefile, fill = "grey90", color = "white") +  # base map
  geom_sf(data = hex_grid, aes(fill = val), color = "white", size = 0.1, alpha = 0.8) +
  scale_fill_viridis_c(name = "Value", option = "plasma") +
  coord_sf(crs = st_crs(4326)) +
  theme_minimal() +
  labs(
    title = "Hexagon Choropleth Map over England",
    caption = "Based on local shapefile"
  ) +
  theme(
    legend.position = "right",
    axis.text = element_blank(),
    axis.ticks = element_blank()
  )

map
