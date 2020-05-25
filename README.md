**Última actualización**: 2020-05-25 23:41:39 UTC

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
     Length:119959      LIMA       :75716   LIMA            :71588  
     Class :character   CALLAO     : 8558   CALLAO          : 8452  
     Mode  :character   LAMBAYEQUE : 6075   CHICLAYO        : 4087  
                        PIURA      : 4219   EN INVESTIGACIÓN: 3241  
                        LORETO     : 3391   CORONEL PORTILLO: 2736  
                        LA LIBERTAD: 3023   MAYNAS          : 2708  
                        (Other)    :18977   (Other)         :27147  
                       distrito     metododx         edad               sexo      
     LIMA                  : 8509   PCR:32127   Min.   :  0.00   Femenino :45863  
     SAN JUAN DE LURIGANCHO: 5838   PR :87832   1st Qu.: 30.00   Masculino:70713  
     CALLAO                : 5201               Median : 41.00   NA's     : 3383  
     SAN MARTIN DE PORRES  : 4341               Mean   : 42.79                    
     LA VICTORIA           : 4092               3rd Qu.: 54.00                    
     JESUS MARIA           : 4089               Max.   :106.00                    
     (Other)               :87889               NA's   :2539                      
     fecha_resultado     
     Min.   :2020-03-06  
     1st Qu.:2020-04-25  
     Median :2020-05-06  
     Mean   :2020-05-04  
     3rd Qu.:2020-05-15  
     Max.   :2020-05-23  
     NA's   :4451        

    summary(fallecimientos)

         uuid           fecha_fallecimiento         sexo        fecha_nac         
     Length:3456        Min.   :2020-03-19   Femenino : 978   Min.   :1915-06-19  
     Class :character   1st Qu.:2020-04-19   Masculino:2478   1st Qu.:1944-08-30  
     Mode  :character   Median :2020-04-30                    Median :1953-11-24  
                        Mean   :2020-04-28                    Mean   :1954-10-02  
                        3rd Qu.:2020-05-07                    3rd Qu.:1963-09-11  
                        Max.   :2020-05-23                    Max.   :2020-02-08  
                                                              NA's   :539         
         departamento     provincia                    distrito         edad       
     LIMA      :1235   NULL    :1007   NULL                : 640   Min.   :  0.17  
     LAMBAYEQUE: 566   LIMA    : 872   CHICLAYO            : 128   1st Qu.: 56.62  
     PIURA     : 429   PIURA   : 253   CALLAO              : 108   Median : 66.42  
     LORETO    : 276   CHICLAYO: 208   SAN MARTIN DE PORRES: 108   Mean   : 65.57  
     ANCASH    : 209   CALLAO  : 126   CHIMBOTE            :  95   3rd Qu.: 75.63  
     CALLAO    : 194   (Other) : 919   (Other)             :2306   Max.   :104.86  
     (Other)   : 547   NA's    :  71   NA's                :  71   NA's   :539     

    summary(reconstruido)

      uuid_caso             departamento     provincia   
     Length:5139        LIMA      :3368   LIMA    :3332  
     Class :character   LAMBAYEQUE: 513   CHICLAYO: 451  
     Mode  :character   PIURA     : 451   CALLAO  : 390  
                        CALLAO    : 390   PIURA   : 321  
                        ICA       : 111   SANTA   :  96  
                        ANCASH    : 104   SULLANA :  87  
                        (Other)   : 202   (Other) : 462  
                       distrito    metododx        edad              sexo     
     LIMA                  : 810   PCR:1996   Min.   :  1.0   Femenino : 959  
     SAN JUAN DE LURIGANCHO: 507   PR :3143   1st Qu.: 52.0   Masculino:4180  
     SAN MARTIN DE PORRES  : 507              Median : 59.0                   
     CHICLAYO              : 401              Mean   : 59.3                   
     CALLAO                : 363              3rd Qu.: 67.0                   
     COMAS                 : 288              Max.   :100.0                   
     (Other)               :2263                                              
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:5139        Min.   :2020-03-19  
     1st Qu.:2020-04-11   Class :character   1st Qu.:2020-04-24  
     Median :2020-04-19   Mode  :character   Median :2020-04-30  
     Mean   :2020-04-18                      Mean   :2020-04-28  
     3rd Qu.:2020-04-26                      3rd Qu.:2020-05-05  
     Max.   :2020-05-19                      Max.   :2020-05-22  
                                                                 
       fecha_nac          coincidencias  
     Min.   :1920-04-18   Min.   :1.000  
     1st Qu.:1952-11-03   1st Qu.:1.000  
     Median :1961-01-12   Median :1.000  
     Mean   :1960-12-27   Mean   :1.513  
     3rd Qu.:1968-01-02   3rd Qu.:2.000  
     Max.   :2019-09-02   Max.   :5.000  
                                         

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 3232 casos reconstruídos.

Los archivos “limpios” son:

-   datos/DATOSABIERTOS\_SISCOVID-utf8-limpio.csv.gz
-   datos/FALLECIDOS\_CDC-utf8-limpio.csv.gz

Y algunos reconstruidos con los anteriores:

-   datos/casos\_fallecimientos\_reconstruccion\_posible.csv.gz
-   datos/timeseries-casos.csv.gz
-   datos/timeseries-casos-lugares.csv.gz
-   datos/timeseries-fallecimientos.csv.gz
-   datos/timeseries-fallecimientos-lugares.csv.gz
