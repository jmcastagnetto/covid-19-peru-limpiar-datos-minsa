library(tidyverse)

casos_raw <- read_csv("datos/DATOSABIERTOS_SISCOVID-utf8.csv.gz",
                    col_types = cols(.default = col_character()))

casos_clean <- casos_raw %>%
  mutate(
    EDAD = as.integer(EDAD),
    FECHA_RESULTADO = lubridate::dmy(FECHA_RESULTADO),
    SEXO = str_to_title(SEXO)
  ) %>%
  mutate_at(
    vars(SEXO, DEPARTAMENTO, PROVINCIA, DISTRITO, METODODX),
    factor
  ) %>%
  janitor::clean_names()

save(
  casos_raw, casos_clean,
  file = "datos/DATOSABIERTOS_SISCOVID.Rdata"
)

write_csv(
   casos_clean,
   path = "datos/DATOSABIERTOS_SISCOVID-utf8-limpio.csv.gz"
)
