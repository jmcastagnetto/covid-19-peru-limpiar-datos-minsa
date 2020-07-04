library(tidyverse)

sinadef <- readRDS("datos/sinadef.rds") %>%
  janitor::clean_names() %>%
  group_by(departamento, provincia, distrito) %>%
  tally(name = "n_sinadef")

gadm <- readRDS("datos/peru-distritos-geo.rds") %>%
  ungroup() %>%
  rename(
    departamento = NAME_1,
    provincia = NAME_2,
    distrito = NAME_3
  ) %>%
  select(-geometry) %>%
  group_by(departamento, provincia, distrito) %>%
  tally()

comp <- sinadef %>%
  full_join(
    gadm
  )
