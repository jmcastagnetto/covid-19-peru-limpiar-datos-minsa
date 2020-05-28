**Última actualización**: 2020-05-28 22:21:06 UTC

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

**2020-05-28**

-   Hay nuevos datasets de positivos y fallecimientos, ahora ambos en
    formato CSV, pero no en UTF-8:
    -   [“Casos positivos por COVID-19 - \[Ministerio de Salud -
        MINSA\]”](https://www.datosabiertos.gob.pe/dataset/casos-positivos-por-covid-19-ministerio-de-salud-minsa)
    -   [“Fallecidos por COVID-19 - \[Ministerio de Salud -
        MINSA\]”](https://www.datosabiertos.gob.pe/dataset/fallecidos-por-covid-19-ministerio-de-salud-minsa)

Información relevante
---------------------

Fuentes de datos:

-   <a href="https://www.datosabiertos.gob.pe/dataset/casos-positivos-por-covid-19-ministerio-de-salud-minsa" class="uri">https://www.datosabiertos.gob.pe/dataset/casos-positivos-por-covid-19-ministerio-de-salud-minsa</a>
-   <a href="https://www.datosabiertos.gob.pe/dataset/fallecidos-por-covid-19-ministerio-de-salud-minsa" class="uri">https://www.datosabiertos.gob.pe/dataset/fallecidos-por-covid-19-ministerio-de-salud-minsa</a>

Luego del primer paso de limpieza de datos:

    summary(casos)

         uuid                departamento              provincia    
     Length:135905      LIMA       :84994   LIMA            :79989  
     Class :character   CALLAO     : 9495   CALLAO          : 9391  
     Mode  :character   LAMBAYEQUE : 6732   CHICLAYO        : 4526  
                        PIURA      : 6039   EN INVESTIGACIÓN: 4497  
                        LORETO     : 3816   MAYNAS          : 3018  
                        LA LIBERTAD: 3523   CORONEL PORTILLO: 2931  
                        (Other)    :21306   (Other)         :31553  
                       distrito     metododx          edad               sexo      
     LIMA                  : 9237   PCR: 34581   Min.   :  0.00   Femenino :50462  
     SAN JUAN DE LURIGANCHO: 6742   PR :101324   1st Qu.: 30.00   Masculino:83263  
     CALLAO                : 5678                Median : 41.00   NA's     : 2180  
     SAN MARTIN DE PORRES  : 5091                Mean   : 42.65                    
     JESUS MARIA           : 4713                3rd Qu.: 54.00                    
     EN INVESTIGACIÓN      : 4497                Max.   :106.00                    
     (Other)               :99947                NA's   :1928                      
     fecha_resultado     
     Min.   :2020-03-06  
     1st Qu.:2020-04-27  
     Median :2020-05-08  
     Mean   :2020-05-06  
     3rd Qu.:2020-05-19  
     Max.   :2020-05-26  
     NA's   :5003        

    summary(fallecimientos)

         uuid           fecha_fallecimiento  edad_declarada         sexo     
     Length:3983        Min.   :2020-03-19   Min.   : 0.00   Femenino :1124  
     Class :character   1st Qu.:2020-04-21   1st Qu.:56.00   Masculino:2859  
     Mode  :character   Median :2020-05-02   Median :66.00                   
                        Mean   :2020-04-30   Mean   :65.26                   
                        3rd Qu.:2020-05-10   3rd Qu.:75.00                   
                        Max.   :2020-05-26   Max.   :99.00                   
                                                                             
       fecha_nac              departamento     provincia   
     Min.   :1915-06-19   LIMA      :1407   LIMA    : 964  
     1st Qu.:1944-09-29   LAMBAYEQUE: 602   PIURA   : 276  
     Median :1953-10-31   PIURA     : 481   CHICLAYO: 208  
     Mean   :1954-09-20   LORETO    : 288   CALLAO  : 126  
     3rd Qu.:1963-08-30   CALLAO    : 281   CHINCHA : 109  
     Max.   :2020-02-08   ANCASH    : 237   (Other) : 962  
     NA's   :748          (Other)   : 687   NA's    :1338  
                     distrito         edad       
     CALLAO              : 167   Min.   :  0.17  
     CHICLAYO            : 136   1st Qu.: 56.67  
     SAN MARTIN DE PORRES: 120   Median : 66.51  
     CHIMBOTE            : 119   Mean   : 65.60  
     LIMA                : 113   3rd Qu.: 75.60  
     (Other)             :2523   Max.   :104.86  
     NA's                : 805   NA's   :748     

    summary(reconstruido)

      uuid_caso              departamento     provincia   
     Length:6028        LIMA       :3994   LIMA    :3958  
     Class :character   PIURA      : 534   CHICLAYO: 456  
     Mode  :character   LAMBAYEQUE : 517   CALLAO  : 391  
                        CALLAO     : 391   PIURA   : 368  
                        ICA        : 169   TRUJILLO: 157  
                        LA LIBERTAD: 166   SULLANA : 113  
                        (Other)    : 257   (Other) : 585  
                       distrito    metododx        edad               sexo     
     LIMA                  : 943   PCR:2259   Min.   :  1.00   Femenino :1025  
     SAN JUAN DE LURIGANCHO: 737   PR :3769   1st Qu.: 51.00   Masculino:5003  
     SAN MARTIN DE PORRES  : 520              Median : 59.00                   
     CHICLAYO              : 405              Mean   : 58.55                   
     CALLAO                : 365              3rd Qu.: 67.00                   
     COMAS                 : 287              Max.   :100.00                   
     (Other)               :2771                                               
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento  edad_declarada 
     Min.   :2020-03-07   Length:6028        Min.   :2020-03-19   Min.   : 2.00  
     1st Qu.:2020-04-11   Class :character   1st Qu.:2020-04-25   1st Qu.:51.00  
     Median :2020-04-20   Mode  :character   Median :2020-05-01   Median :58.00  
     Mean   :2020-04-19                      Mean   :2020-05-01   Mean   :58.15  
     3rd Qu.:2020-04-28                      3rd Qu.:2020-05-08   3rd Qu.:67.00  
     Max.   :2020-05-25                      Max.   :2020-05-26   Max.   :99.00  
                                                                                 
       fecha_nac          coincidencias  
     Min.   :1920-04-18   Min.   :1.000  
     1st Qu.:1952-12-23   1st Qu.:1.000  
     Median :1961-05-28   Median :1.000  
     Mean   :1961-10-02   Mean   :1.514  
     3rd Qu.:1969-03-18   3rd Qu.:2.000  
     Max.   :2019-09-02   Max.   :5.000  
                                         

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 3874 casos reconstruídos.

Los archivos “limpios” son:

-   datos/DATOSABIERTOS\_SISCOVID-utf8-limpio.csv.gz
-   datos/FALLECIDOS\_CDC-utf8-limpio.csv.gz

Y algunos reconstruidos con los anteriores:

-   datos/casos\_fallecimientos\_reconstruccion\_posible.csv.gz
-   datos/timeseries-casos.csv.gz
-   datos/timeseries-casos-lugares.csv.gz
-   datos/timeseries-fallecimientos.csv.gz
-   datos/timeseries-fallecimientos-lugares.csv.gz
