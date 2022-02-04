suppressPackageStartupMessages(library(tidyverse))

positivos <-  readRDS("datos/positivos_covid_aumentado.rds")
fallecidos <- readRDS("datos/fallecidos_covid_aumentado.rds")

timeseries_positivos <- positivos %>%
  arrange(fecha_resultado) %>%
  group_by(fecha_resultado) %>%
  tally() %>%
  mutate(
    n_acum = cumsum(n)
  ) %>%
  add_column(
    pais = "Peru",
    iso3c = "PER",
    .before = 1
  ) %>% # completar huecos en ts
  complete(
    fecha_resultado = seq.Date(min(fecha_resultado, na.rm = TRUE),
                               max(fecha_resultado, na.rm = TRUE),
                               by = "day"),
    nesting(pais, iso3c)
  ) %>%
  group_by(pais, iso3c) %>%
  fill(n, n_acum)

timeseries_positivos_departamento <- positivos %>%
  arrange(departamento, fecha_resultado) %>%
  group_by(departamento, fecha_resultado) %>%
  tally() %>%
  mutate(
    n_acum = cumsum(n)
  ) %>%
  group_by(departamento) %>%
  complete(
    fecha_resultado = seq.Date(
      min(positivos$fecha_resultado, na.rm = TRUE),
      max(positivos$fecha_resultado, na.rm = TRUE),
      by = "day")
  ) %>%
  add_column(
  pais = "Peru",
  iso3c = "PER",
  .before = 1
  ) %>%
  group_by(pais, iso3c, departamento) %>%
  fill(n, n_acum) %>%
  arrange(departamento, fecha_resultado) %>%
  filter(!is.na(n) & !is.na(n_acum)) %>%
  filter(!is.na(fecha_resultado)) %>%
  distinct() %>%
  ungroup()

timeseries_fallecidos <- fallecidos %>%
  arrange(fecha_fallecimiento) %>%
  group_by(fecha_fallecimiento) %>%
  tally() %>%
  mutate(
    n_acum = cumsum(n)
  ) %>%
  add_column(
    pais = "Peru",
    iso3c = "PER",
    .before = 1
  ) %>% # completar huecos en ts
  complete(
    fecha_fallecimiento = seq.Date(
      min(fecha_fallecimiento, na.rm = TRUE),
      max(fecha_fallecimiento, na.rm = TRUE),
      by = "day"),
    nesting(pais, iso3c)
  ) %>%
  group_by(pais, iso3c) %>%
  fill(n, n_acum)

timeseries_fallecidos_departamento <- fallecidos %>%
  arrange(departamento, fecha_fallecimiento) %>%
  group_by(departamento, fecha_fallecimiento) %>%
  tally() %>%
  mutate(
    n_acum = cumsum(n)
  ) %>%
  group_by(departamento) %>%
  complete(
    fecha_fallecimiento = seq.Date(
      min(fallecidos$fecha_fallecimiento, na.rm = TRUE),
      max(fallecidos$fecha_fallecimiento, na.rm = TRUE),
      by = "day")
  ) %>%
  add_column(
    pais = "Peru",
    iso3c = "PER",
    .before = 1
  ) %>%
  group_by(pais, iso3c, departamento) %>%
  fill(n, n_acum) %>%
  arrange(departamento, fecha_fallecimiento) %>%
  filter(!is.na(n) & !is.na(n_acum)) %>%
  filter(!is.na(fecha_fallecimiento)) %>%
  distinct() %>%
  ungroup()

write_csv(
 timeseries_positivos,
 file = "datos/timeseries_positivos.csv"
)

write_csv(
  timeseries_positivos_departamento,
  file = "datos/timeseries_positivos_departamento.csv"
)

write_csv(
  timeseries_fallecidos,
  file = "datos/timeseries_fallecidos.csv"
)

write_csv(
  timeseries_fallecidos_departamento,
  file = "datos/timeseries_fallecidos_departamento.csv"
)
