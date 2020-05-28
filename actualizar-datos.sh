#! /bin/bash -x

# descargar archivos
wget https://www.datosabiertos.gob.pe/node/6447/download -O datos/originales/positivos_covid.csv
wget https://www.datosabiertos.gob.pe/node/6460/download -O datos/originales/fallecidos_covid.csv

# Pre-proceso de los datos de casos
iconv  -f ISO_8859-1 -t UTF-8  datos/originales/positivos_covid.csv > datos/positivos_covid-utf8.csv

# Pre-proceso de los datos de fallecidos
iconv -f ISO_8859-1 -t UTF-8 datos/originales/fallecidos_covid.csv > datos/fallecidos_covid-utf8.csv
#gzip -9f datos/FALLECIDOS_*.csv

# Limpieza inicial
Rscript 01-limpieza-inicial.R

# Reconstruir timeseries
Rscript 02-reconstruir-timeseries.R

# Regenerar el README
Rscript build-readme.R

# cacular y guardar los sha256 de los archivos de datos
sha256sum -b datos/* datos/originales/* > sha256sum-archivos-datos.txt
