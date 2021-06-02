library(tidyverse)

load("datos/datos_abiertos_minsa_covid-19_peru.Rdata")

timeseries_casos <- casos %>%
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

timeseries_casos_departamento <- casos %>%
  arrange(departamento, fecha_resultado) %>%
  group_by(departamento, fecha_resultado) %>%
  tally() %>%
  mutate(
    n_acum = cumsum(n)
  ) %>%
  add_column(
    pais = "Peru",
    iso3c = "PER",
    .before = 1
  ) %>%
  complete(
    fecha_resultado = seq.Date(
      min(casos$fecha_resultado, na.rm = TRUE),
      max(casos$fecha_resultado, na.rm = TRUE),
      by = "day"),
    nesting(pais, iso3c, departamento)
  ) %>%
  group_by(pais, iso3c, departamento) %>%
  fill(n, n_acum) %>%
  arrange(departamento, fecha_resultado) %>%
  filter(!is.na(n) & !is.na(n_acum)) %>%
  distinct()

timeseries_fallecimientos <- fallecimientos %>%
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

timeseries_fallecimientos_departamento <- fallecimientos %>%
  arrange(departamento, fecha_fallecimiento) %>%
  group_by(departamento, fecha_fallecimiento) %>%
  tally() %>%
  mutate(
    n_acum = cumsum(n)
  ) %>%
  add_column(
    pais = "Peru",
    iso3c = "PER",
    .before = 1
  ) %>%
  complete(
    fecha_fallecimiento = seq.Date(
      min(fallecimientos$fecha_fallecimiento, na.rm = TRUE),
      max(fallecimientos$fecha_fallecimiento, na.rm = TRUE),
      by = "day"),
    nesting(pais, iso3c, departamento)
  ) %>%
  group_by(pais, iso3c, departamento) %>%
  fill(n, n_acum) %>%
  arrange(departamento, fecha_fallecimiento) %>%
  filter(!is.na(n) & !is.na(n_acum)) %>%
  distinct()

write_csv(
 timeseries_casos,
 file = "datos/timeseries-casos.csv.gz"
)

write_csv(
  timeseries_casos_departamento,
  file = "datos/timeseries-casos-departamento.csv.gz"
)

write_csv(
  timeseries_fallecimientos,
  file = "datos/timeseries-fallecimientos.csv.gz"
)

write_csv(
  timeseries_fallecimientos_departamento,
  file = "datos/timeseries-fallecimientos-departamento.csv.gz"
)
