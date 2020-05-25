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
  )

timeseries_casos_lugares <- casos %>%
  arrange(fecha_resultado, departamento, provincia, distrito) %>%
  group_by(fecha_resultado, departamento, provincia, distrito) %>%
  tally() %>%
  mutate(
    n_acum = cumsum(n)
  ) %>%
  add_column(
    pais = "Peru",
    iso3c = "PER",
    .before = 1
  )

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
  )

timeseries_fallecimientos_lugares <- fallecimientos %>%
  arrange(fecha_fallecimiento, departamento, provincia, distrito) %>%
  group_by(fecha_fallecimiento, departamento, provincia, distrito) %>%
  tally() %>%
  mutate(
    n_acum = cumsum(n)
  ) %>%
  add_column(
    pais = "Peru",
    iso3c = "PER",
    .before = 1
  )

write_csv(
 timeseries_casos,
 path = "datos/timeseries-casos.csv"
)

write_csv(
  timeseries_casos_lugares,
  path = "datos/timeseries-casos-lugares.csv"
)

write_csv(
  timeseries_fallecimientos,
  path = "datos/timeseries-fallecimientos.csv"
)

write_csv(
  timeseries_fallecimientos_lugares,
  path = "datos/timeseries-fallecimientos-lugares.csv"
)
