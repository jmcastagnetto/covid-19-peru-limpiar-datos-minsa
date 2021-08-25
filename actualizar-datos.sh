#! /bin/bash -x

# Usar el tamaño en los HTTP headers no funciona consistentemente
# regresando a usar el sha1sum

#prev_pos=`cat positivos-size.txt`
#curr_pos=`curl --silent --insecure --head https://cloud.minsa.gob.pe/s/Y8w3wHsEdYQSZRp/download | grep -FI content-length | cut -d ' ' -f2`
#prev_fal=`cat fallecidos-size.txt`
#curr_fal=`curl --silent --insecure --head  https://cloud.minsa.gob.pe/s/Md37cjXmjT9qYSa/download | grep -FI content-length | cut -d ' ' -f2`

# descargar archivos - antiguos URLs
#curl --silent --insecure --parallel https://cloud.minsa.gob.pe/s/Y8w3wHsEdYQSZRp/download --output datos/originales/positivos_covid.csv
#curl --silent --insecure --parallel https://cloud.minsa.gob.pe/s/xJ2LQ3QyRW38Pe5/download --output datos/originales/fallecidos_covid.csv

# URLs actuales
# positivos
aria2c -q -c -x8 -d datos/originales --force-save -o positivos_covid.csv --file-allocation=falloc https://cloud.minsa.gob.pe/s/AC2adyLkHCKjmfm/download
# fallecidos
aria2c -q -c -x8 -d datos/originales --force-save -o fallecidos_covid.csv --file-allocation=falloc https://cloud.minsa.gob.pe/s/xJ2LQ3QyRW38Pe5/download

# para ver si los archivos descargados han cambiado
sha1sum --status -c sha1sum-orig.txt

#if [ curr_pos == prev_pos ] && [ curr_fal == prev_fal ]
if [ $? -eq 0 ]
then
	echo "Datos no han cambiado"
	rm datos/originales/*.csv
else
	#echo $curr_pos > positivos-size.txt
	#echo $curr_fal > fallecidos-size.txt
	sha1sum datos/originales/*.csv > sha1sum-orig.txt
	# líneas usadas si el cambio de tamaño es confiable
    #curl --silent --insecure --parallel https://cloud.minsa.gob.pe/s/Y8w3wHsEdYQSZRp/download --output datos/originales/positivos_covid.csv
    #curl --silent --insecure --parallel https://cloud.minsa.gob.pe/s/Md37cjXmjT9qYSa/download --output datos/originales/fallecidos_covid.csv

	# archivos ahora parece que a veces vienen en UTF-8 con BOM
	# lo cual es innecesario, asi que se necesita remover el BOM
#	sed -i 's/\xef\xbb\xbf//' datos/originales/positivos_covid.csv
#	sed -i 's/\xef\xbb\xbf//' datos/originales/fallecidos_covid.csv

	# Pre-proceso de los datos de casos (ahora vienen en UTF-8)
#	iconv  -f ISO_8859-1 -t UTF-8  datos/originales/positivos_covid.csv > datos/positivos_covid-utf8.csv

	# Pre-proceso de los datos de fallecidos (ahora vienen en UTF-8)
#	iconv -f ISO_8859-1 -t UTF-8 datos/originales/fallecidos_covid.csv > datos/fallecidos_covid-utf8.csv

	# Limpieza inicial
	Rscript 01-limpieza-inicial.R
	# Casos - Fallecimientos
	Rscript 02-reconstruir-casos-fallecidos.R
	# Reconstruir timeseries
	Rscript 03-reconstruir-timeseries.R

	# Regenerar el README
	Rscript build-readme.R

	#xz -T 3 -9e -f datos/*.csv
	xz -T 3 -9e -f datos/originales/*.csv

	# cacular y guardar los sha256 de los archivos de datos
	sha256sum -b datos/*.csv.xz datos/originales/*.csv.xz > sha256sum-archivos-datos.txt

	now=`date -I`
	git commit -a -m "Actualizado el $now"
	HOME=/home/jesus git push origin main
fi
