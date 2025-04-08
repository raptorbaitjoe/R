####                    Load Packages and filepaths                         ####
usePackage <- function(p)
{ if (!is.element(p, installed.packages()[,1]))
  install.packsges(p, dep = TRUE)
  require(p, character.only = TRUE) }

usePackage("dplyr")
usePackage("sf")
usePackage("ggmap")
usePackage("ggplot2")
usePackage("viridis")
usePackage("rmapshaper")

zip_path <- "C:/Users/Joseph/Downloads/Countries_December_2024_Boundaries_UK_BFC_6983126662299524946.zip"
                                                                                # define zip location
unzip_dir <- tempdir()                                                          # set path for unzip location


####                    Load and filter shapefile                           ####

utils::unzip(zip_path, exdir = unzip_dir)    # unzip function - take from zip path, place in unzip path


shp_file <- base::list.files(unzip_dir, pattern = "\\.shp$", full.names = TRUE)[1] # Find the .shp file (in case the zip has multiple files)

england_shapefile <- sf::st_read(shp_file) %>%                                  # Read the shapefile
                     dplyr::filter(CTRY24CD == "E92000001") %>%                 # Filter to just England
                     sf::st_transform(4326)                                     # WGS84 for mapping


england_simple <- mapshaper::ms_simplify(england_shapefile, keep = 0.05)        # Simplify the geometry

####                    Create and populate hex grid                        ####

hex_grid <- sf::st_make_grid(england_simple, cellsize = 0.3, square = FALSE) %>%   # Create hex grid of shapefile's bounding box
  sf::st_as_sf() %>%                                                               # Convert hex grid to shapefile
  sf::st_filter(england_simple)                                                    # Spatial filter - returns only hexes that insterest england_simple


set.seed(42)                                                                    # Set the random seed                  
hex_grid$val <- runif(nrow(hex_grid), 0, 100)                                   # Creates value column and populates with random numbers


####                    Create map                                          ####

map <- ggplot() +
  geom_sf(data = england_shapefile, fill = "grey90", color = "black") +                 # Load england_shapefile as basemap 
  geom_sf(data = hex_grid, aes(fill = val), color = "white", size = 0.1, alpha = 0.8) + # load hex grid and set visuals
  scale_fill_viridis_c(name = "Value", option = "plasma") +                             # set colour scale for hex grid to viridis
  coord_sf(crs = st_crs(4326)) +                                                        # set the coordinate system (4326 = WGS84)
  theme_minimal() +                                                                     # Theme
  labs(                                                                                 # Labels
    title = "Hexagon Choropleth Map over England",
    caption = "Based on local shapefile"
  ) +
  theme(                                                                                # Legend & axes
    legend.position = "right",
    axis.text = element_blank(),
    axis.ticks = element_blank()
  )

map                                                                             # Print map
