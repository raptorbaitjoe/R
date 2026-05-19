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
