## Notas 

**2020-05-22**

- La limpieza de datos no está completa aún, hay fechas de tomas de prueba que parecen ser incorrectas, y que al convertir dan fechas inconsistentes con el primer caso reportado (2020-03-06). 
- En al menos un caso, la fecha de toma de pruebas es copia de la fecha de nacimiento. 
- He agregado una columna `fecha_prueba_antes_primer_caso` para marcar esos registros. Son 126 registros que tienen este problema.

**2020-05-23**

- Los datos han cambiado de formato, ya no incluyen la fecha de nacimiento, sino la edad en años.
- El campo de fecha que se tiene ahora ya no es `FECHA_PRUEBA` sino `FECHA_RESULTADO`
- El campo de tipo de prueba (antes `TIPO_PRUEBA`) se llama ahora `METODODX`
- Hay 4,543 registros sin fecha de resultado conocida
- Ya no hay incosistencias en los formatos de fecha, todos los registros con valores son de la forma "DD/MM/YYYY"
- Tampoco hay errores como fechas anteriores al primer caso reportado oficialmente.
- Usando edad, departamento, provincia y distrito se han podidor reconstruir unos 2,933 registros de casos con fallecimientos


## Información relevante

Fuente de datos:
https://www.datosabiertos.gob.pe/dataset/casos-positivos-por-covid-19-ministerio-de-salud-minsa

Descargado: 2020-05-21, 23:05 (PET)

Preproceso con iconv:

```
$ unzip -p DATOSABIERTOS_SISCOVID.zip | iconv  -f ISO_8859-1 -t UTF-8 - > DATOSABIERTOS_SISCOVID-utf8.csv
$ gzip -9 DATOSABIERTOS_SISCOVID-utf8.csv
```

Luego del primer paso de limpieza de datos:

```
> summary(casos_clean)
     uuid                departamento  
 Length:108769      LIMA       :68018  
 Class :character   CALLAO     : 7685  
 Mode  :character   LAMBAYEQUE : 5581  
                    PIURA      : 3496  
                    LORETO     : 3166  
                    LA LIBERTAD: 2542  
                    (Other)    :18281  
            provincia    
 LIMA            :65507  
 CALLAO          : 7597  
 EN INVESTIGACIÓN: 5572  
 CHICLAYO        : 3750  
 MAYNAS          : 2522  
 CORONEL PORTILLO: 2338  
 (Other)         :21483  
                   distrito     metododx   
 LIMA                  : 7712   PCR:30351  
 EN INVESTIGACIÓN      : 5572   PR :78418  
 SAN JUAN DE LURIGANCHO: 5247              
 CALLAO                : 4649              
 SAN MARTIN DE PORRES  : 3901              
 LA VICTORIA           : 3786              
 (Other)               :77902              
      edad              sexo       fecha_resultado     
 Min.   :  0.0   Femenino :36881   Min.   :2020-03-06  
 1st Qu.: 30.0   Masculino:51949   1st Qu.:2020-04-24  
 Median : 42.0   NA's     :19939   Median :2020-05-04  
 Mean   : 42.9                     Mean   :2020-05-02  
 3rd Qu.: 54.0                     3rd Qu.:2020-05-13  
 Max.   :106.0                     Max.   :2020-05-20  
 NA's   :2068                      NA's   :4543 
```

Los archivos "limpios" son:

- DATOSABIERTOS_SISCOVID.Rdata
- DATOSABIERTOS_SISCOVID-utf8-limpio.csv.gz
