## Drawing Polygons

# Add a point layer with color mapped to ward
ggplot(ward_sales, aes(lon, lat)) +
  geom_point(aes(color = ward))

# Add a point layer with color mapped to group
ggplot(ward_sales, aes(lon, lat)) +
    geom_point(aes(color = group))

# Add a path layer with group mapped to group
ggplot(ward_sales, aes(lon, lat)) +
    geom_path(aes(group = group))

# Add a polygon layer with fill mapped to ward, and group to group
ggplot(ward_sales, aes(lon, lat)) +
    geom_polygon(aes(fill = ward, group = group))

## Chloropleth Map

# Fix the polygon cropping
ggmap(corvallis_map_bw, 
      base_layer = ggplot(ward_sales, aes(lon, lat)),
      extent = "normal", maprange = FALSE) +
  geom_polygon(aes(group = group, fill = ward))

# Repeat, but map fill to num_sales
ggmap(corvallis_map_bw, 
      base_layer = ggplot(ward_sales, aes(lon, lat)),
      extent = "normal", maprange = FALSE) +
  geom_polygon(aes(group = group, fill = num_sales))

# Repeat again, but map fill to avg_price
ggmap(corvallis_map_bw, 
      base_layer = ggplot(ward_sales, aes(lon, lat)),
      extent = "normal", maprange = FALSE) +
  geom_polygon(aes(group = group, fill = avg_price), alpha = 0.8)

## Raster data as a heatmap

# Add a geom_point() layer
ggplot(preds, aes(lon, lat)) +
  geom_point()

# Add a tile layer with fill mapped to predicted_price
ggplot(preds, aes(lon, lat)) +
    geom_tile(aes(fill = predicted_price))

# Use ggmap() instead of ggplot()
ggmap(corvallis_map_bw) +
  geom_tile(aes(lon, lat, fill = predicted_price), 
            data = preds, alpha = 0.8)
