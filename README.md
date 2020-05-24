**Última actualización**: 2020-05-24 01:24:59 UTC

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
     Length:108769      LIMA       :68018   LIMA            :65507  
     Class :character   CALLAO     : 7685   CALLAO          : 7597  
     Mode  :character   LAMBAYEQUE : 5581   EN INVESTIGACIÓN: 5572  
                        PIURA      : 3496   CHICLAYO        : 3750  
                        LORETO     : 3166   MAYNAS          : 2522  
                        LA LIBERTAD: 2542   CORONEL PORTILLO: 2338  
                        (Other)    :18281   (Other)         :21483  
                       distrito     metododx         edad              sexo      
     LIMA                  : 7712   PCR:30351   Min.   :  0.0   Femenino :36881  
     EN INVESTIGACIÓN      : 5572   PR :78418   1st Qu.: 30.0   Masculino:51949  
     SAN JUAN DE LURIGANCHO: 5247               Median : 42.0   NA's     :19939  
     CALLAO                : 4649               Mean   : 42.9                    
     SAN MARTIN DE PORRES  : 3901               3rd Qu.: 54.0                    
     LA VICTORIA           : 3786               Max.   :106.0                    
     (Other)               :77902               NA's   :2068                     
     fecha_resultado     
     Min.   :2020-03-06  
     1st Qu.:2020-04-24  
     Median :2020-05-04  
     Mean   :2020-05-02  
     3rd Qu.:2020-05-13  
     Max.   :2020-05-20  
     NA's   :4543        

    summary(fallecimientos)

         uuid           fecha_fallecimiento         sexo        fecha_nac         
     Length:3244        Min.   :2020-03-19   Femenino : 914   Min.   :1915-06-19  
     Class :character   1st Qu.:2020-04-19   Masculino:2330   1st Qu.:1944-07-11  
     Mode  :character   Median :2020-04-29                    Median :1953-11-24  
                        Mean   :2020-04-27                    Mean   :1954-09-30  
                        3rd Qu.:2020-05-06                    3rd Qu.:1963-10-31  
                        Max.   :2020-05-21                    Max.   :2020-02-08  
                                                              NA's   :523         
         departamento     provincia                   distrito         edad       
     LIMA      :1164   NULL    :927   NULL                : 625   Min.   :  0.17  
     LAMBAYEQUE: 516   LIMA    :801   CHICLAYO            : 113   1st Qu.: 56.49  
     PIURA     : 409   PIURA   :243   CALLAO              : 106   Median : 66.39  
     LORETO    : 264   CHICLAYO:208   SAN MARTIN DE PORRES:  90   Mean   : 65.57  
     ANCASH    : 196   CALLAO  :124   CASTILLA            :  89   3rd Qu.: 75.80  
     CALLAO    : 192   (Other) :870   (Other)             :2150   Max.   :104.86  
     (Other)   : 503   NA's    : 71   NA's                :  71   NA's   :523     

    summary(reconstruido)

      uuid_caso             departamento             provincia   
     Length:4505        LIMA      :2904   LIMA            :2904  
     Class :character   LAMBAYEQUE: 495   CHICLAYO        : 435  
     Mode  :character   PIURA     : 397   CALLAO          : 327  
                        CALLAO    : 327   PIURA           : 300  
                        ANCASH    : 104   SANTA           :  96  
                        ICA       :  78   CORONEL PORTILLO:  70  
                        (Other)   : 200   (Other)         : 373  
                       distrito    metododx        edad               sexo     
     LIMA                  : 761   PCR:1850   Min.   :  2.00   Femenino : 844  
     SAN JUAN DE LURIGANCHO: 481   PR :2655   1st Qu.: 52.00   Masculino:3661  
     CHICLAYO              : 386              Median : 60.00                   
     SAN MARTIN DE PORRES  : 317              Mean   : 59.62                   
     CALLAO                : 300              3rd Qu.: 68.00                   
     LA VICTORIA           : 215              Max.   :100.00                   
     (Other)               :2045                                               
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:4505        Min.   :2020-03-19  
     1st Qu.:2020-04-10   Class :character   1st Qu.:2020-04-23  
     Median :2020-04-18   Mode  :character   Median :2020-04-29  
     Mean   :2020-04-17                      Mean   :2020-04-27  
     3rd Qu.:2020-04-25                      3rd Qu.:2020-05-04  
     Max.   :2020-05-19                      Max.   :2020-05-20  
                                                                 
       fecha_nac          coincidencias  
     Min.   :1920-04-18   Min.   :1.000  
     1st Qu.:1952-06-02   1st Qu.:1.000  
     Median :1960-07-16   Median :1.000  
     Mean   :1960-09-01   Mean   :1.477  
     3rd Qu.:1967-12-01   3rd Qu.:2.000  
     Max.   :2018-03-08   Max.   :5.000  
                                         

Los archivos “limpios” son:

-   datos/DATOSABIERTOS\_SISCOVID-utf8-limpio.csv.gz
-   datos/FALLECIDOS\_CDC-utf8-limpio.csv.gz

Y algunos reconstruidos con los anteriores:

-   datos/casos\_fallecimientos\_reconstruccion\_posible.csv.gz
-   datos/timeseries-casos.csv.gz
-   datos/timeseries-casos-lugares.csv.gz
-   datos/timeseries-fallecimientos.csv.gz
-   datos/timeseries-fallecimientos-lugares.csv.gz
