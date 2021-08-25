suppressPackageStartupMessages(library(tidyverse))

fallecidos <- readRDS("datos/fallecidos_covid_aumentado.rds") %>%
  rename_with(~paste0("fallecido_", .x)) %>%
  rename(id_persona = fallecido_id_persona) %>%
  relocate(id_persona, .before = 1) %>%
  mutate(
    id_persona = as.integer(id_persona)
  ) %>%
  arrange(id_persona)

casos <- readRDS("datos/positivos_covid_aumentado.rds") %>%
  filter(id_persona %in% fallecidos$id_persona) %>%
  rename_with(~paste0("positivo_", .x)) %>%
  rename(id_persona = positivo_id_persona) %>%
  relocate(id_persona, .before = 1) %>%
  mutate(
    id_persona = as.integer(id_persona)
  ) %>%
  filter(!is.na(id_persona)) %>%
  arrange(id_persona)

reconstruido <- casos %>%
  inner_join(
    fallecidos,
    by = "id_persona"
  )


write_csv(
  reconstruido,
  file = "datos/positivos_fallecidos_reconstruccion.csv.xz"
)

saveRDS(
  reconstruido,
  file = "datos/positivos_fallecidos_reconstruccion.rds",
  compress = "xz"
)


