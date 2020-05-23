#! /bin/bash -x

# descargar archivos
wget -N https://www.datosabiertos.gob.pe/sites/default/files/DATOSABIERTOS_SISCOVID.zip -O datos/DATOSABIERTOS_SISCOVID.zip 
wget -N https://www.datosabiertos.gob.pe/sites/default/files/FALLECIDOS_CDC.csv -O datos/FALLECIDOS_CDC.csv

# Pre-proceso de los datos de casos
unzip -p datos/DATOSABIERTOS_SISCOVID.zip | iconv  -f ISO_8859-1 -t UTF-8 - > datos/DATOSABIERTOS_SISCOVID-utf8.csv
gzip -9f datos/DATOSABIERTOS_SISCOVID-utf8.csv

# Pre-proceso de los datos de fallecidos
iconv -f ISO_8859-1 -t UTF-8 datos/FALLECIDOS_CDC.csv > datos/FALLECIDOS_CDC-utf8.csv
gzip -9f datos/FALLECIDOS_*.csv

# Limpieza inicial
Rscript 01-limpieza-inicial.R

# Reconstruir timeseries
Rscript 02-reconstruir-timeseries.R

# Regenerar el README
Rscript build-readme.R
