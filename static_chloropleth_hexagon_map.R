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
unzip_dir <- tempdir()
unzip(zip_path, exdir = unzip_dir)

# Find the .shp file (in case the zip has multiple files)
shp_file <- list.files(unzip_dir, pattern = "\\.shp$", full.names = TRUE)[1]

# Read the shapefile
england_sf <- st_read(shp_file)

unzip(file.path(temp_dir, "england_shapefile.zip"), exdir = temp_dir)

england_sf <- st_read(unzip_dir, quiet = TRUE) %>%
  st_transform(4326) # WGS84 for mapping





england_simple <- ms_simplify(england_sf, keep = 0.05)

hex_grid <- st_make_grid(england_simple, cellsize = 0.2, square = FALSE) %>%
  st_as_sf() %>%
  st_filter(england_simple)


# Add dummy values
set.seed(42)
hex_grid$val <- runif(nrow(hex_grid), 0, 100)

map <- ggplot() +
  geom_sf(data = england_sf, fill = "grey90", color = "white") +  # base map
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
