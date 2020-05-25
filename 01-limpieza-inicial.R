library(tidyverse)


# casos -------------------------------------------------------------------

casos <- read_csv(
  "datos/DATOSABIERTOS_SISCOVID-utf8.csv",
  col_types = cols(
      UUID = col_character(),
      DEPARTAMENTO = col_character(),
      PROVINCIA = col_character(),
      DISTRITO = col_character(),
      METODODX = col_character(),
      EDAD = col_integer(),
      SEXO = col_character(),
      FECHA_RESULTADO = col_date(format = "%d/%m/%Y")
    ),
    na = c("", "NA", "NULL")
  ) %>%
  mutate(
    SEXO = str_to_title(SEXO)
  ) %>%
  mutate_at(
    vars(SEXO, DEPARTAMENTO, PROVINCIA, DISTRITO, METODODX),
    factor
  ) %>%
  janitor::clean_names()

write_csv(
  casos,
  path = "datos/DATOSABIERTOS_SISCOVID-utf8-limpio.csv"
)

# limpiar archivos extra
file.remove("datos/DATOSABIERTOS_SISCOVID-utf8.csv")

# fallecimientos ----------------------------------------------------------

fallecimientos <- read_csv(
  "datos/FALLECIDOS_CDC-utf8.csv",
  col_types = cols(
    UUID = col_character(),
    FECHA_FALLECIMIENTO = col_date(format = "%d/%m/%Y"),
    SEXO = col_character(),
    FECHA_NAC = col_date(format = "%d/%m/%Y"),
    DEPARTAMENTO = col_character(),
    PROVINCIA = col_character(),
    DISTRITO = col_character()
  )
) %>%
  mutate(
    SEXO = str_to_title(SEXO),
    EDAD = round(lubridate::interval(FECHA_NAC, FECHA_FALLECIMIENTO) / lubridate::years(), 2)
  ) %>%
  mutate_at(
    vars(SEXO, DEPARTAMENTO, PROVINCIA, DISTRITO),
    factor
  ) %>%
  janitor::clean_names()

write_csv(
  fallecimientos,
  path = "datos/FALLECIDOS_CDC-utf8-limpio.csv"
)

# limpiar archivos extra
file.remove("datos/FALLECIDOS_CDC-utf8.csv")

# unir datos --------------------------------------------------------------

reconstruido <- casos %>%
  full_join(
    fallecimientos %>%
      mutate(
        edad = round(edad, 0)
      ),
    by = c("sexo", "departamento", "provincia", "distrito", "edad")
  ) %>%
  filter(!is.na(uuid.y) &
           fecha_resultado < fecha_fallecimiento &
           fecha_nac < fecha_resultado) %>%
  distinct() %>%
  rename(
    uuid_caso = uuid.x,
    uuid_fallecimiento = uuid.y
  ) %>%
  arrange(uuid_caso)

reconstruido <- reconstruido %>%
  left_join(
    reconstruido %>%
      group_by(uuid_caso) %>%
      tally() %>%
      rename(
        coincidencias = n
      ),
    by = "uuid_caso"
  )

write_csv(
  reconstruido,
  path = "datos/casos_fallecimientos_reconstruccion_posible.csv"
)

save(
  casos, fallecimientos, reconstruido,
  file = "datos/datos_abiertos_minsa_covid-19_peru.Rdata"
)


