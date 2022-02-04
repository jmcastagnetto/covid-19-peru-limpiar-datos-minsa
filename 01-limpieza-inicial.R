suppressPackageStartupMessages(library(tidyverse))
library(vroom)

# casos -------------------------------------------------------------------

casos <- vroom(
  "datos/originales/positivos_covid.csv",
  col_types = cols(
      FECHA_CORTE = col_date(format = "%Y%m%d"),
      id_persona = col_character(),
      DEPARTAMENTO = col_character(),
      PROVINCIA = col_character(),
      DISTRITO = col_character(),
      METODODX = col_character(),
      EDAD = col_integer(),
      SEXO = col_character(),
      FECHA_RESULTADO = col_date(format = "%Y%m%d"),
      UBIGEO = col_character()
    ),
    na = c("", "NA", "NULL")
  ) %>%
  mutate(
    SEXO = str_to_title(SEXO),
    rango_edad_veintiles = cut(
      EDAD,
      c(seq(0, 80, 20), 130),
      include.lowest = TRUE,
      right = FALSE,
      labels = c("0-19",
                 "20-39",
                 "40-59",
                 "60-79",
                 "80+"),
      ordered_result = TRUE
    ),
    rango_edad_deciles = cut(
      EDAD,
      c(seq(0, 80, 10), 130),
      include.lowest = TRUE,
      right = FALSE,
      labels = c("0-9",
                 "10-19",
                 "20-29",
                 "30-39",
                 "40-49",
                 "50-59",
                 "60-69",
                 "70-79",
                 "80+"),
      ordered_result = TRUE
    ),
    rango_edad_quintiles = cut(
      EDAD,
      c(seq(0, 80, 5), 130),
      include.lowest = TRUE,
      right = FALSE,
      labels = c(
        "0-4",
        "5-9",
        "10-14",
        "15-19",
        "20-24",
        "25-29",
        "30-34",
        "35-39",
        "40-44",
        "45-49",
        "50-54",
        "55-59",
        "60-64",
        "65-69",
        "70-74",
        "75-79",
        "80+"
      ),
      ordered_result = TRUE
    ),
    rango_edad_owid = cut(
      EDAD,
      c(0, 18, 25, 50, 60, 70, 80, 130),
      include.lowest = TRUE,
      right = FALSE,
      labels = c("0-17",
                 "18-24",
                 "25-49",
                 "50-59",
                 "60-69",
                 "70-79",
                 "80+"),
      ordered_result = TRUE
    ),
    rango_edad_veintiles = fct_explicit_na(rango_edad_veintiles, "Desconocido"),
    rango_edad_deciles = fct_explicit_na(rango_edad_deciles, "Desconocido"),
    rango_edad_quintiles = fct_explicit_na(rango_edad_quintiles, "Desconocido"),
    rango_edad_owid = fct_explicit_na(rango_edad_owid, "(Missing)"),
    SEXO = replace_na(SEXO, "No registrado"),
    epi_week = lubridate::epiweek(FECHA_RESULTADO),
    epi_year = lubridate::epiyear(FECHA_RESULTADO)
  ) %>%
  mutate_at(
    vars(SEXO, DEPARTAMENTO, PROVINCIA, DISTRITO, METODODX, UBIGEO),
    factor
  ) %>%
  janitor::clean_names()

vroom_write(
  casos,
  delim = ",",
  file = "datos/positivos_covid_aumentado.csv.xz"
)

saveRDS(
  casos,
  file = "datos/positivos_covid_aumentado.rds",
  compress = "xz"
)

# fallecidos ----------------------------------------------------------

fallecidos <- vroom(
  "datos/originales/fallecidos_covid.csv",
  col_types = cols(
    FECHA_CORTE = col_date(format = "%Y%m%d"),
    #id_persona = col_character(),
    UUID = col_character(),
    FECHA_FALLECIMIENTO = col_date(format = "%Y%m%d"),
    EDAD_DECLARADA = col_number(),
    SEXO = col_character(),
    CLASIFICACION_DEF = col_character(),
    UBIGEO = col_character(),
    DEPARTAMENTO = col_character(),
    PROVINCIA = col_character(),
    DISTRITO = col_character()
  )
) %>%
  rename(
    EDAD = EDAD_DECLARADA,
    id_persona = UUID
  ) %>%
  mutate(
    SEXO = str_to_title(SEXO),
    CLASIFICACION_DEF = str_replace_all(
      CLASIFICACION_DEF,
      c(
        "logic" = "lógic",
        "clinico" = "clínico"
      )
    ),
    rango_edad_veintiles = cut(
      EDAD,
      c(seq(0, 80, 20), 130),
      include.lowest = TRUE,
      right = FALSE,
      labels = c("0-19",
                 "20-39",
                 "40-59",
                 "60-79",
                 "80+"),
      ordered_result = TRUE
    ),
    rango_edad_deciles = cut(
      EDAD,
      c(seq(0, 80, 10), 130),
      include.lowest = TRUE,
      right = FALSE,
      labels = c("0-9",
                 "10-19",
                 "20-29",
                 "30-39",
                 "40-49",
                 "50-59",
                 "60-69",
                 "70-79",
                 "80+"),
      ordered_result = TRUE
    ),
    rango_edad_quintiles = cut(
      EDAD,
      c(seq(0, 80, 5), 130),
      include.lowest = TRUE,
      right = FALSE,
      labels = c(
        "0-4",
        "5-9",
        "10-14",
        "15-19",
        "20-24",
        "25-29",
        "30-34",
        "35-39",
        "40-44",
        "45-49",
        "50-54",
        "55-59",
        "60-64",
        "65-69",
        "70-74",
        "75-79",
        "80+"
      ),
      ordered_result = TRUE
    ),
    rango_edad_owid = cut(
      EDAD,
      c(0, 18, 25, 50, 60, 70, 80, 130),
      include.lowest = TRUE,
      right = FALSE,
      labels = c("0-17",
                 "18-24",
                 "25-49",
                 "50-59",
                 "60-69",
                 "70-79",
                 "80+"),
      ordered_result = TRUE
    ),
    rango_edad_veintiles = fct_explicit_na(rango_edad_veintiles, "Desconocido"),
    rango_edad_deciles = fct_explicit_na(rango_edad_deciles, "Desconocido"),
    rango_edad_quintiles = fct_explicit_na(rango_edad_quintiles, "Desconocido"),
    rango_edad_owid = fct_explicit_na(rango_edad_owid, "(Missing)"),
    SEXO = replace_na(SEXO, "No registrado"),
    epi_week = lubridate::epiweek(FECHA_FALLECIMIENTO),
    epi_year = lubridate::epiyear(FECHA_FALLECIMIENTO)
  ) %>%
  mutate_at(
    vars(SEXO, CLASIFICACION_DEF,
         UBIGEO, DEPARTAMENTO,
         PROVINCIA, DISTRITO),
    factor
  ) %>%
  janitor::clean_names()

vroom_write(
  fallecidos,
  delim = ",",
  file = "datos/fallecidos_covid_aumentado.csv.xz"
)

saveRDS(
  fallecidos,
  file = "datos/fallecidos_covid_aumentado.rds",
  compress = "xz"
)
