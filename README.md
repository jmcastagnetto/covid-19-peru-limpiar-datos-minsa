**Última actualización**: 2020-05-27 23:23:24 UTC

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
     Length:3788        Min.   :2020-03-19   Min.   : 0.00   Femenino :1075  
     Class :character   1st Qu.:2020-04-21   1st Qu.:56.00   Masculino:2713  
     Mode  :character   Median :2020-05-01   Median :66.00                   
                        Mean   :2020-04-29   Mean   :65.34                   
                        3rd Qu.:2020-05-09   3rd Qu.:75.00                   
                        Max.   :2020-05-25   Max.   :99.00                   
                                                                             
       fecha_nac              departamento     provincia   
     Min.   :1915-06-19   LIMA      :1359   LIMA    : 923  
     1st Qu.:1944-07-28   LAMBAYEQUE: 571   PIURA   : 255  
     Median :1953-09-23   PIURA     : 441   CHICLAYO: 208  
     Mean   :1954-08-25   LORETO    : 288   CALLAO  : 126  
     3rd Qu.:1963-09-07   CALLAO    : 248   CHINCHA : 102  
     Max.   :2020-02-08   ANCASH    : 223   (Other) : 923  
     NA's   :669          (Other)   : 658   NA's    :1251  
                     distrito         edad       
     CALLAO              : 148   Min.   :  0.17  
     CHICLAYO            : 128   1st Qu.: 56.66  
     SAN MARTIN DE PORRES: 118   Median : 66.62  
     LIMA                : 107   Mean   : 65.67  
     CHIMBOTE            : 106   3rd Qu.: 75.78  
     (Other)             :2380   Max.   :104.86  
     NA's                : 801   NA's   :669     

    summary(reconstruido)

      uuid_caso              departamento     provincia   
     Length:5849        LIMA       :3859   LIMA    :3823  
     Class :character   LAMBAYEQUE : 531   CHICLAYO: 464  
     Mode  :character   PIURA      : 473   CALLAO  : 404  
                        CALLAO     : 404   PIURA   : 336  
                        LA LIBERTAD: 174   TRUJILLO: 164  
                        ICA        : 149   CHINCHA : 106  
                        (Other)    : 259   (Other) : 552  
                       distrito    metododx        edad               sexo     
     LIMA                  : 955   PCR:2220   Min.   :  1.00   Femenino : 728  
     SAN MARTIN DE PORRES  : 590   PR :3629   1st Qu.: 52.00   Masculino:5121  
     SAN JUAN DE LURIGANCHO: 576              Median : 59.00                   
     CHICLAYO              : 409              Mean   : 59.01                   
     CALLAO                : 374              3rd Qu.: 68.00                   
     COMAS                 : 323              Max.   :100.00                   
     (Other)               :2622                                               
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento  edad_declarada 
     Min.   :2020-03-07   Length:5849        Min.   :2020-03-19   Min.   : 2.00  
     1st Qu.:2020-04-11   Class :character   1st Qu.:2020-04-24   1st Qu.:52.00  
     Median :2020-04-20   Mode  :character   Median :2020-05-01   Median :59.00  
     Mean   :2020-04-18                      Mean   :2020-04-29   Mean   :58.61  
     3rd Qu.:2020-04-27                      3rd Qu.:2020-05-06   3rd Qu.:67.00  
     Max.   :2020-05-22                      Max.   :2020-05-24   Max.   :99.00  
                                                                                 
       fecha_nac          coincidencias  
     Min.   :1920-04-18   Min.   :1.000  
     1st Qu.:1952-07-10   1st Qu.:1.000  
     Median :1961-04-10   Median :1.000  
     Mean   :1961-04-16   Mean   :1.525  
     3rd Qu.:1968-02-17   3rd Qu.:2.000  
     Max.   :2019-09-02   Max.   :5.000  
                                         

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 3712 casos reconstruídos.

Los archivos “limpios” son:

-   datos/DATOSABIERTOS\_SISCOVID-utf8-limpio.csv.gz
-   datos/FALLECIDOS\_CDC-utf8-limpio.csv.gz

Y algunos reconstruidos con los anteriores:

-   datos/casos\_fallecimientos\_reconstruccion\_posible.csv.gz
-   datos/timeseries-casos.csv.gz
-   datos/timeseries-casos-lugares.csv.gz
-   datos/timeseries-fallecimientos.csv.gz
-   datos/timeseries-fallecimientos-lugares.csv.gz
