[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-06-16 01:40:56 UTC

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

**2020-05-31**

-   Nuevo cambio de formato en los datos de fallecimientos: en 749 de
    registros no se consigna la fecha de nacimiento, pero se ha agregado
    una columna `EDAD_DECLARADA`.
-   He modificado el código para compensar por estos cambios.
-   También, **todos los 141 fallecimientos asignados al 2020-05-29
    están designados como de sexo `INDETERMINADO`**.

**2020-06-12**

-   Al menos a partir de ayer, ya aparecen nuevamente los valores
    definidos para el sexo en los datos.

Información relevante
---------------------

Fuentes de datos:

-   <a href="https://www.datosabiertos.gob.pe/dataset/casos-positivos-por-covid-19-ministerio-de-salud-minsa" class="uri">https://www.datosabiertos.gob.pe/dataset/casos-positivos-por-covid-19-ministerio-de-salud-minsa</a>
-   <a href="https://www.datosabiertos.gob.pe/dataset/fallecidos-por-covid-19-ministerio-de-salud-minsa" class="uri">https://www.datosabiertos.gob.pe/dataset/fallecidos-por-covid-19-ministerio-de-salud-minsa</a>

Luego del primer paso de limpieza de datos:

    summary(casos)

         uuid                departamento               provincia     
     Length:229736      LIMA       :132186   LIMA            :124038  
     Class :character   CALLAO     : 15807   CALLAO          : 14995  
     Mode  :character   PIURA      : 13799   CHICLAYO        :  7574  
                        LAMBAYEQUE : 11276   PIURA           :  6670  
                        LORETO     :  7629   EN INVESTIGACIÓN:  6597  
                        LA LIBERTAD:  7239   CORONEL PORTILLO:  5875  
                        (Other)    : 41800   (Other)         : 63987  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 11966   PCR: 53957   Min.   :  0.00  
     LIMA                  : 11430   PR :175779   1st Qu.: 30.00  
     SAN MARTIN DE PORRES  :  9222                Median : 42.00  
     CALLAO                :  8998                Mean   : 42.99  
     COMAS                 :  6983                3rd Qu.: 54.00  
     ATE                   :  6619                Max.   :120.00  
     (Other)               :174518                NA's   :1529    
            sexo        fecha_resultado     
     Femenino : 93713   Min.   :2020-03-06  
     Masculino:133220   1st Qu.:2020-05-04  
     NA's     :  2803   Median :2020-05-20  
                        Mean   :2020-05-16  
                        3rd Qu.:2020-05-30  
                        Max.   :2020-06-13  
                        NA's   :1339        

    summary(fallecimientos)

         uuid           fecha_fallecimiento       edad               sexo     
     Length:6688        Min.   :2020-03-19   Min.   :  0.00   Femenino :1938  
     Class :character   1st Qu.:2020-04-29   1st Qu.: 56.00   Masculino:4750  
     Mode  :character   Median :2020-05-14   Median : 66.00                   
                        Mean   :2020-05-14   Mean   : 65.17                   
                        3rd Qu.:2020-06-03   3rd Qu.: 75.00                   
                        Max.   :2020-06-13   Max.   :100.00                   
                                                                              
       fecha_nac              departamento     provincia   
     Min.   :1915-06-19   LIMA      :2988   LIMA    :2434  
     1st Qu.:1944-11-26   LAMBAYEQUE: 663   PIURA   : 344  
     Median :1953-12-24   PIURA     : 623   CALLAO  : 297  
     Mean   :1954-10-16   CALLAO    : 452   CHICLAYO: 251  
     3rd Qu.:1963-06-29   ANCASH    : 371   TRUJILLO: 233  
     Max.   :2020-02-08   ICA       : 346   (Other) :1791  
     NA's   :748          (Other)   :1245   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 283   Min.   :  0.17  
     CALLAO                : 244   1st Qu.: 56.88  
     SAN MARTIN DE PORRES  : 235   Median : 66.38  
     LIMA                  : 224   Mean   : 65.58  
     CHIMBOTE              : 198   3rd Qu.: 75.43  
     (Other)               :4699   Max.   :104.86  
     NA's                  : 805   NA's   :748     

    summary(reconstruido)

      uuid_caso              departamento      provincia    
     Length:61307       LIMA       :49264   LIMA    :48863  
     Class :character   CALLAO     : 4903   CALLAO  : 4903  
     Mode  :character   PIURA      : 1954   SANTA   : 1375  
                        ANCASH     : 1401   PIURA   : 1230  
                        LAMBAYEQUE : 1133   TRUJILLO: 1045  
                        LA LIBERTAD: 1086   CHICLAYO: 1012  
                        (Other)    : 1566   (Other) : 2879  
                       distrito     metododx         edad               sexo      
     SAN JUAN DE LURIGANCHO:12153   PCR:17546   Min.   :  0.00   Femenino :11739  
     LIMA                  : 6391   PR :43761   1st Qu.: 49.00   Masculino:49568  
     SAN MARTIN DE PORRES  : 6151               Median : 57.00                    
     COMAS                 : 4346               Mean   : 57.28                    
     CALLAO                : 3895               3rd Qu.: 66.00                    
     VILLA EL SALVADOR     : 3008               Max.   :100.00                    
     (Other)               :25363                                                 
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:61307       Min.   :2020-03-19  
     1st Qu.:2020-04-26   Class :character   1st Qu.:2020-05-30  
     Median :2020-05-12   Mode  :character   Median :2020-06-05  
     Mean   :2020-05-09                      Mean   :2020-06-01  
     3rd Qu.:2020-05-25                      3rd Qu.:2020-06-10  
     Max.   :2020-06-12                      Max.   :2020-06-13  
                                                                 
       fecha_nac            edad_calc      coincidencias   
     Min.   :1919-12-01   Min.   :  0.57   Min.   : 1.000  
     1st Qu.:1954-05-09   1st Qu.: 49.97   1st Qu.: 1.000  
     Median :1962-08-15   Median : 57.80   Median : 2.000  
     Mean   :1962-08-07   Mean   : 57.82   Mean   : 2.298  
     3rd Qu.:1970-06-15   3rd Qu.: 66.08   3rd Qu.: 3.000  
     Max.   :2019-11-10   Max.   :100.51   Max.   :10.000  
                                                           

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 24539 casos reconstruídos.

    ## [1] "es_PE.utf8"

![“Positivos por día. MINSA”](positivos-por-dia-minsa.png)

![“Positivos acumulados. MINSA”](positivos-acumulados-minsa.png)

![“Fallecimientos por día. MINSA”](fallecimientos-por-dia-minsa.png)

![“Fallecimientos acumulados.
MINSA”](fallecimientos-acumulados-minsa.png)

![“Distribución de tiempos desde detección a fallecimiento, por número
de registros
coincidentes”](deteccion-fallecimiento-por-coincidentes.png)

Los archivos “limpios” son:

-   [datos/fallecidos\_covid-utf8-limpio.csv](datos/fallecidos_covid-utf8-limpio.csv)
-   [datos/positivos\_covid-utf8-limpio.csv](datos/positivos_covid-utf8-limpio.csv)

Y algunos reconstruidos a partir de los anteriores:

-   [datos/casos\_fallecimientos\_reconstruccion\_posible.csv](datos/casos_fallecimientos_reconstruccion_posible.csv)
-   [datos/timeseries-casos.csv](datos/timeseries-casos.csv)
-   [datos/timeseries-casos-lugares.csv](datos/timeseries-casos-lugares.csv)
-   [datos/timeseries-fallecimientos.csv](datos/timeseries-fallecimientos.csv)
-   [datos/timeseries-fallecimientos-lugares.csv](datos/timeseries-fallecimientos-lugares.csv)
