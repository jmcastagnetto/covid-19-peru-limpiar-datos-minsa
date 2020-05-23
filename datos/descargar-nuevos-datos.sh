#! /bin/bash -x
wget -N https://www.datosabiertos.gob.pe/sites/default/files/DATOSABIERTOS_SISCOVID.zip

unzip -p DATOSABIERTOS_SISCOVID.zip | iconv  -f ISO_8859-1 -t UTF-8 - > DATOSABIERTOS_SISCOVID-utf8.csv
gzip -9f DATOSABIERTOS_SISCOVID-utf8.csv
