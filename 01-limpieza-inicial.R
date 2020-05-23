library(tidyverse)

casos_raw <- read_csv("datos/DATOSABIERTOS_SISCOVID-utf8.csv.gz",
                    col_types = cols(.default = col_character()))

casos_clean <- casos_raw %>%
  mutate(
    FECHA_NACIMIENTO = str_replace_all(FECHA_NACIMIENTO,
                                       fixed("/"), "-"),
    f_tmp = lubridate::ymd(FECHA_NACIMIENTO),
    f_tmp = if_else(is.na(f_tmp),
                    lubridate::dmy(FECHA_NACIMIENTO),
                    f_tmp),
    FECHA_NACIMIENTO = f_tmp,
    FECHA_PRUEBA = str_replace_all(FECHA_PRUEBA,
                                       fixed("/"), "-"),
    f_tmp = lubridate::ymd(FECHA_PRUEBA),
    f_tmp = if_else(is.na(f_tmp),
                    lubridate::dmy(FECHA_PRUEBA),
                    f_tmp),
    FECHA_PRUEBA_CONV = f_tmp,
    SEXO = str_to_title(SEXO)
  ) %>%
  select(-f_tmp) %>%
  mutate_at(
    vars(SEXO, DEPARTAMENTO, PROVINCIA, DISTRITO, TIPO_PRUEBA),
    factor
  ) %>%
  janitor::clean_names() %>%
  mutate(
    fecha_prueba_antes_primer_caso = (fecha_prueba_conv < lubridate::ymd("2020-03-06"))
  )

save(
  casos_raw, casos_clean,
  file = "datos/DATOSABIERTOS_SISCOVID.Rdata"
)

# write_csv(
#   casos_clean,
#   path = "datos/DATOSABIERTOS_SISCOVID-utf8-limpio.csv.gz"
# )
