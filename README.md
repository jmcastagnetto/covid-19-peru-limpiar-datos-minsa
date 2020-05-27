**Última actualización**: 2020-05-27 00:07:46 UTC

Notas
-----

**2020-05-22**

-   La limpieza de datos no está completa aún, hay fechas de tomas de
    prueba que parecen ser incorrectas, y que al convertir dan fechas
    inconsistentes con el primer caso reportado (2020-03-06).
-   En al menos un caso, la fecha de toma de pruebas es copia de la
    fecha de nacimiento.
-   He agregado una columna `fecha_prueba_antes_primer_caso` para marcar
    esos registros. Son 126 registros que tienen este problema.

**2020-05-23**

-   Los datos han cambiado de formato, ya no incluyen la fecha de
    nacimiento, sino la edad en años.
-   El campo de fecha que se tiene ahora ya no es `FECHA_PRUEBA` sino
    `FECHA_RESULTADO`
-   El campo de tipo de prueba (antes `TIPO_PRUEBA`) se llama ahora
    `METODODX`
-   Hay 4,543 registros sin fecha de resultado conocida
-   Ya no hay incosistencias en los formatos de fecha, todos los
    registros con valores son de la forma “DD/MM/YYYY”
-   Tampoco hay errores como fechas anteriores al primer caso reportado
    oficialmente.
-   Usando edad, departamento, provincia y distrito se han podidor
    reconstruir unos 2,933 registros de casos con fallecimientos

Información relevante
---------------------

Fuentes de datos:

-   <a href="https://www.datosabiertos.gob.pe/dataset/casos-positivos-por-covid-19-ministerio-de-salud-minsa" class="uri">https://www.datosabiertos.gob.pe/dataset/casos-positivos-por-covid-19-ministerio-de-salud-minsa</a>
-   <a href="https://www.datosabiertos.gob.pe/dataset/fallecidos-por-covid-19-ministerio-de-salud-minsa" class="uri">https://www.datosabiertos.gob.pe/dataset/fallecidos-por-covid-19-ministerio-de-salud-minsa</a>

Preproceso con iconv:

    $ unzip -p DATOSABIERTOS_SISCOVID.zip | iconv  -f ISO_8859-1 -t UTF-8 - > DATOSABIERTOS_SISCOVID-utf8.csv
    $ gzip -9 DATOSABIERTOS_SISCOVID-utf8.csv

Luego del primer paso de limpieza de datos:

    summary(casos)

         uuid                departamento              provincia    
     Length:123979      LIMA       :77486   LIMA            :72901  
     Class :character   CALLAO     : 8726   CALLAO          : 8617  
     Mode  :character   LAMBAYEQUE : 6217   EN INVESTIGACIÓN: 4783  
                        PIURA      : 5457   CHICLAYO        : 4178  
                        LORETO     : 3524   MAYNAS          : 2834  
                        LA LIBERTAD: 3178   CORONEL PORTILLO: 2800  
                        (Other)    :19391   (Other)         :27866  
                       distrito     metododx         edad               sexo      
     LIMA                  : 8594   PCR:33136   Min.   :  0.00   Femenino :35479  
     SAN JUAN DE LURIGANCHO: 6050   PR :90843   1st Qu.: 30.00   Masculino:84370  
     CALLAO                : 5247               Median : 41.00   NA's     : 4130  
     EN INVESTIGACIÓN      : 4783               Mean   : 42.78                    
     SAN MARTIN DE PORRES  : 4424               3rd Qu.: 54.00                    
     JESUS MARIA           : 4219               Max.   :106.00                    
     (Other)               :90662               NA's   :2499                      
     fecha_resultado     
     Min.   :2020-03-06  
     1st Qu.:2020-04-26  
     Median :2020-05-06  
     Mean   :2020-05-04  
     3rd Qu.:2020-05-16  
     Max.   :2020-05-24  
     NA's   :4814        

    summary(fallecimientos)

         uuid           fecha_fallecimiento  edad_declarada         sexo     
     Length:3629        Min.   :2020-03-19   Min.   : 0.00   Femenino :1033  
     Class :character   1st Qu.:2020-04-20   1st Qu.:56.00   Masculino:2596  
     Mode  :character   Median :2020-05-01   Median :66.00                   
                        Mean   :2020-04-28   Mean   :65.28                   
                        3rd Qu.:2020-05-08   3rd Qu.:75.00                   
                        Max.   :2020-05-24   Max.   :99.00                   
                                                                             
       fecha_nac              departamento     provincia   
     Min.   :1915-06-19   LIMA      :1313   LIMA    : 872  
     1st Qu.:1944-08-12   LAMBAYEQUE: 565   PIURA   : 253  
     Median :1953-09-28   PIURA     : 429   CHICLAYO: 208  
     Mean   :1954-09-05   LORETO    : 280   CALLAO  : 126  
     3rd Qu.:1963-09-07   CALLAO    : 248   CHINCHA : 102  
     Max.   :2020-02-08   ANCASH    : 209   (Other) : 851  
     NA's   :614          (Other)   : 585   NA's    :1217  
                     distrito         edad       
     CALLAO              : 148   Min.   :  0.17  
     CHICLAYO            : 128   1st Qu.: 56.66  
     SAN MARTIN DE PORRES: 115   Median : 66.58  
     CHIMBOTE            :  95   Mean   : 65.64  
     CASTILLA            :  92   3rd Qu.: 75.72  
     (Other)             :2270   Max.   :104.86  
     NA's                : 781   NA's   :614     

    summary(reconstruido)

      uuid_caso             departamento     provincia   
     Length:5507        LIMA      :3635   LIMA    :3599  
     Class :character   LAMBAYEQUE: 531   CHICLAYO: 464  
     Mode  :character   PIURA     : 468   CALLAO  : 404  
                        CALLAO    : 404   PIURA   : 332  
                        ICA       : 149   CHINCHA : 106  
                        ANCASH    : 108   SANTA   :  99  
                        (Other)   : 212   (Other) : 503  
                       distrito    metododx        edad               sexo     
     LIMA                  : 885   PCR:2111   Min.   :  1.00   Femenino : 703  
     SAN MARTIN DE PORRES  : 572   PR :3396   1st Qu.: 52.00   Masculino:4804  
     SAN JUAN DE LURIGANCHO: 519              Median : 59.00                   
     CHICLAYO              : 409              Mean   : 59.05                   
     CALLAO                : 374              3rd Qu.: 67.00                   
     COMAS                 : 323              Max.   :100.00                   
     (Other)               :2425                                               
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento  edad_declarada 
     Min.   :2020-03-07   Length:5507        Min.   :2020-03-19   Min.   : 2.00  
     1st Qu.:2020-04-11   Class :character   1st Qu.:2020-04-24   1st Qu.:52.00  
     Median :2020-04-19   Mode  :character   Median :2020-04-30   Median :59.00  
     Mean   :2020-04-18                      Mean   :2020-04-28   Mean   :58.67  
     3rd Qu.:2020-04-26                      3rd Qu.:2020-05-05   3rd Qu.:67.00  
     Max.   :2020-05-20                      Max.   :2020-05-24   Max.   :99.00  
                                                                                 
       fecha_nac          coincidencias  
     Min.   :1920-04-18   Min.   :1.000  
     1st Qu.:1952-12-23   1st Qu.:1.000  
     Median :1961-05-01   Median :1.000  
     Mean   :1961-03-29   Mean   :1.513  
     3rd Qu.:1968-03-19   3rd Qu.:2.000  
     Max.   :2019-09-02   Max.   :5.000  
                                         

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 3470 casos reconstruídos.

Los archivos “limpios” son:

-   datos/DATOSABIERTOS\_SISCOVID-utf8-limpio.csv.gz
-   datos/FALLECIDOS\_CDC-utf8-limpio.csv.gz

Y algunos reconstruidos con los anteriores:

-   datos/casos\_fallecimientos\_reconstruccion\_posible.csv.gz
-   datos/timeseries-casos.csv.gz
-   datos/timeseries-casos-lugares.csv.gz
-   datos/timeseries-fallecimientos.csv.gz
-   datos/timeseries-fallecimientos-lugares.csv.gz
