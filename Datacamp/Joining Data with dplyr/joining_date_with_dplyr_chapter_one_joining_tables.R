# dplyr::inner_join()
# 

# sets %>%
#   inner_join(themes, by = c("theme_id", "id"))
# "theme_id" in sets, base dataset for join

# sets %>%
#   inner_join(themes, by = c("theme_id", "id"), suffix = c("_set", "_theme"))
# add suffixes where column names are the same across datasets

# sets %>%
#   inner_join(themes, by = c("theme_id", "id"), suffix = c("_set", "_theme")) %>%
#   count(name_theme, sort = TRUE)
