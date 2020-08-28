#! /bin/bash -x

# descargar archivos
wget https://www.datosabiertos.gob.pe/node/6447/download -O datos/originales/positivos_covid.csv
wget https://www.datosabiertos.gob.pe/node/6460/download -O datos/originales/fallecidos_covid.csv

# para ver si los archivos descargados han cambiado

sha1sum --status -c sha1sum-orig.txt

if [ $? -eq 0 ]
then
	echo "Datos no han cambiado"
	rm datos/originales/*.csv
else
	sha1sum datos/originales/*.csv > sha1sum-orig.txt
	# Pre-proceso de los datos de casos
	iconv  -f ISO_8859-1 -t UTF-8  datos/originales/positivos_covid.csv > datos/positivos_covid-utf8.csv

	# Pre-proceso de los datos de fallecidos
	iconv -f ISO_8859-1 -t UTF-8 datos/originales/fallecidos_covid.csv > datos/fallecidos_covid-utf8.csv

	# Limpieza inicial
	Rscript 01-limpieza-inicial.R

	# Reconstruir timeseries
	Rscript 02-reconstruir-timeseries.R

	# Regenerar el README
	Rscript build-readme.R

	gzip -9f datos/*.csv 
	gzip -9f datos/originales/*.csv

	# cacular y guardar los sha256 de los archivos de datos
	sha256sum -b datos/*.csv.gz datos/originales/*.csv.gz > sha256sum-archivos-datos.txt
fi
