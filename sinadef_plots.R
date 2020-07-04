library(tidyverse)
library(sf)
library(patchwork)

ts_sinadef_covid <- readRDS("datos/ts-sinadef-distrito.rds")

peru_geo <- readRDS("datos/peru-distritos-geo.rds")

callao <- ts_sinadef_covid %>%
  filter(
    departamento == "CALLAO" &
      provincia == "CALLAO" &
      distrito == "CALLAO"
  )

p1 <- ggplot(callao, aes(x = fecha, y = n_dia)) +
  geom_line() + ggtitle("CALLAO/CALLAO/CALLAO")
p2 <- ggplot(callao, aes(x = fecha, y = n_ts)) +
  geom_line() + ggtitle("CALLAO/CALLAO/CALLAO")
p3 <- ggplot(callao, aes(x = fecha, y = n_acum)) +
  geom_line() + ggtitle("CALLAO/CALLAO/CALLAO")

p1 + p2 + p3

aqp <- ts_sinadef_covid %>%
  filter(departamento == "AREQUIPA" &
           provincia == "AREQUIPA" &
           distrito == "AREQUIPA")

p1 <- ggplot(aqp, aes(x = fecha, y = n_dia)) +
  geom_line() + ggtitle("AREQUIPA/AREQUIPA/AREQUIPA")
p2 <- ggplot(aqp, aes(x = fecha, y = n_ts)) +
  geom_line() + ggtitle("AREQUIPA/AREQUIPA/AREQUIPA")
p3 <- ggplot(aqp, aes(x = fecha, y = n_acum)) +
  geom_line() + ggtitle("AREQUIPA/AREQUIPA/AREQUIPA")

p1 + p2 + p3

bagua <- ts_sinadef_covid %>%
  filter(departamento == "AMAZONAS" &
           provincia == "BAGUA" &
           distrito == "BAGUA")

p1 <- ggplot(bagua, aes(x = fecha, y = n_dia)) +
  geom_line() + ggtitle("AMAZONAS/BAGUA/BAGUA")
p2 <- ggplot(bagua, aes(x = fecha, y = n_ts)) +
  geom_line() + ggtitle("AMAZONAS/BAGUA/BAGUA")
p3 <- ggplot(bagua, aes(x = fecha, y = n_acum)) +
  geom_line() + ggtitle("AMAZONAS/BAGUA/BAGUA")

p1 + p2 + p3

# mapa


abr1 <- ts_sinadef_covid %>%
  filter(fecha == "2020-04-01")

may1 <- ts_sinadef_covid %>%
  filter(fecha == "2020-05-01")

jun1 <- ts_sinadef_covid %>%
  filter(fecha == "2020-06-01")

jul1 <- ts_sinadef_covid %>%
  filter(fecha == "2020-07-01")



peru_df <- peru_geo %>%
  left_join(
    jul1,
    by = c("NAME_1" = "departamento",
           "NAME_2" = "provincia",
           "NAME_3" = "distrito")
  ) %>%
  filter(!is.na(n_dia))

ggplot() +
  geom_sf(data = peru_geo,
          size = .1, color = "grey80") +
  geom_sf(data = peru_df,
          aes(fill = n_dia, color = n_dia),
          size = .1) +
  scale_fill_viridis_c(direction = -1) +
  scale_color_viridis_c(direction = -1)



peru_df <- peru_geo %>%
  left_join(
    jul1,
    by = c("NAME_1" = "departamento",
           "NAME_2" = "provincia",
           "NAME_3" = "distrito")
  ) %>%
  filter(!is.na(n_dia))

ggplot() +
  geom_sf(data = peru_geo,
          size = .1, color = "grey80") +
  geom_sf(data = peru_df,
          aes(fill = n_dia, color = n_dia),
          size = .1) +
  scale_fill_viridis_c(direction = -1) +
  scale_color_viridis_c(direction = -1)
