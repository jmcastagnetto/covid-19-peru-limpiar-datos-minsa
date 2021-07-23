library(tidyverse)
library(vroom)

# casos -------------------------------------------------------------------

casos <- vroom(
#  "datos/originales/positivos_covid.csv",
  "datos/positivos_covid-utf8.csv",
  col_types = cols(
      FECHA_CORTE = col_date(format = "%Y%m%d"),
      UUID = col_character(),
      DEPARTAMENTO = col_character(),
      PROVINCIA = col_character(),
      DISTRITO = col_character(),
      METODODX = col_character(),
      EDAD = col_integer(),
      SEXO = col_character(),
      FECHA_RESULTADO = col_date(format = "%Y%m%d")
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

vroom_write(
  casos,
  delim = ",",
  file = "datos/positivos_covid-utf8-limpio.csv"
)

# limpiar archivos extra
#file.remove("datos/positivos_covid-utf8.csv")

# fallecimientos ----------------------------------------------------------

fallecimientos <- vroom(
  #"datos/originales/fallecidos_covid.csv",
  "datos/fallecidos_covid-utf8.csv",
  col_types = cols(
    FECHA_CORTE = col_date(format = "%Y%m%d"),
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
    EDAD = EDAD_DECLARADA
  ) %>%
  mutate(
    SEXO = str_to_title(SEXO),
    CLASIFICACION_DEF = str_replace_all(
      CLASIFICACION_DEF,
      c(
        "logic" = "lógic",
        "clinico" = "clínico"
      )
    )
  ) %>%
  mutate_at(
    vars(SEXO, CLASIFICACION_DEF,
         UBIGEO, DEPARTAMENTO,
         PROVINCIA, DISTRITO),
    factor
  ) %>%
  janitor::clean_names()

vroom_write(
  fallecimientos,
  delim = ",",
  file = "datos/fallecidos_covid-utf8-limpio.csv"
)

fid <- unique(fallecimientos$uuid)
pid <- unique(casos$uuid)

sum(fid %in% pid)

# limpiar archivos extra
#file.remove("datos/fallecidos_covid-utf8.csv")

# unir datos --------------------------------------------------------------

reconstruido <- casos %>%
  full_join(
    fallecimientos,
    by = c("sexo", "departamento", "provincia", "distrito", "edad")
  ) %>%
  filter(!is.na(uuid.y) &
           fecha_resultado < fecha_fallecimiento) %>%
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
  ) %>%
  filter(!is.na(fecha_fallecimiento) & coincidencias <= 3)

vroom_write(
  reconstruido,
  delim = ",",
  file = "datos/casos_fallecimientos_reconstruccion_posible.csv"
)

save(
  casos, fallecimientos, reconstruido,
  file = "datos/datos_abiertos_minsa_covid-19_peru.Rdata"
)


