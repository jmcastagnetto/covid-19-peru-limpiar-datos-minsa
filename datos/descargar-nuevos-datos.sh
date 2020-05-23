#! /bin/bash -x

# descargar archivos
wget -N https://www.datosabiertos.gob.pe/sites/default/files/DATOSABIERTOS_SISCOVID.zip
wget -N https://www.datosabiertos.gob.pe/sites/default/files/FALLECIDOS_CDC.csv

# Pre-proceso de los datos de casos
unzip -p DATOSABIERTOS_SISCOVID.zip | iconv  -f ISO_8859-1 -t UTF-8 - > DATOSABIERTOS_SISCOVID-utf8.csv
gzip -9f DATOSABIERTOS_SISCOVID-utf8.csv

# Pre-proceso de los datos de fallecidos
iconv -f ISO_8859-1 -t UTF-8 FALLECIDOS_CDC.csv > FALLECIDOS_CDC-utf8.csv
gzip -9f FALLECIDOS_*.csv
