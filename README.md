[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-06-19 23:29:10 UTC

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
     Length:244388      LIMA       :139869   LIMA            :130330  
     Class :character   CALLAO     : 16458   CALLAO          : 15600  
     Mode  :character   PIURA      : 14659   CHICLAYO        :  7963  
                        LAMBAYEQUE : 11883   EN INVESTIGACIÓN:  7900  
                        LORETO     :  7953   PIURA           :  7010  
                        LA LIBERTAD:  7839   CORONEL PORTILLO:  6164  
                        (Other)    : 45727   (Other)         : 69421  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 12615   PCR: 58473   Min.   :  0.00  
     LIMA                  : 11969   PR :185915   1st Qu.: 30.00  
     SAN MARTIN DE PORRES  :  9683                Median : 42.00  
     CALLAO                :  9257                Mean   : 43.07  
     EN INVESTIGACIÓN      :  7900                3rd Qu.: 55.00  
     COMAS                 :  7380                Max.   :120.00  
     (Other)               :185584                NA's   :1544    
            sexo        fecha_resultado     
     Femenino :100339   Min.   :2020-03-06  
     Masculino:141243   1st Qu.:2020-05-05  
     NA's     :  2806   Median :2020-05-21  
                        Mean   :2020-05-18  
                        3rd Qu.:2020-06-02  
                        Max.   :2020-12-06  
                        NA's   :1339        

    summary(fallecimientos)

         uuid           fecha_fallecimiento       edad               sexo     
     Length:7461        Min.   :2020-03-19   Min.   :  0.00   Femenino :2173  
     Class :character   1st Qu.:2020-05-01   1st Qu.: 57.00   Masculino:5288  
     Mode  :character   Median :2020-05-20   Median : 66.00                   
                        Mean   :2020-05-18   Mean   : 65.27                   
                        3rd Qu.:2020-06-08   3rd Qu.: 75.00                   
                        Max.   :2020-06-17   Max.   :101.00                   
                                                                              
       fecha_nac               departamento     provincia   
     Min.   :1915-06-19   LIMA       :3390   LIMA    :2800  
     1st Qu.:1944-11-03   LAMBAYEQUE : 688   PIURA   : 364  
     Median :1953-12-05   PIURA      : 661   CALLAO  : 351  
     Mean   :1954-09-06   CALLAO     : 506   TRUJILLO: 288  
     3rd Qu.:1963-05-18   LA LIBERTAD: 400   CHICLAYO: 267  
     Max.   :2020-02-08   ANCASH     : 397   (Other) :2053  
     NA's   :748          (Other)    :1419   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 326   Min.   :  0.17  
     CALLAO                : 276   1st Qu.: 57.02  
     SAN MARTIN DE PORRES  : 268   Median : 66.47  
     LIMA                  : 248   Mean   : 65.70  
     COMAS                 : 217   3rd Qu.: 75.52  
     (Other)               :5321   Max.   :104.86  
     NA's                  : 805   NA's   :748     

    summary(reconstruido)

      uuid_caso              departamento      provincia    
     Length:77843       LIMA       :62354   LIMA    :61834  
     Class :character   CALLAO     : 6830   CALLAO  : 6830  
     Mode  :character   PIURA      : 2148   SANTA   : 1579  
                        ANCASH     : 1618   PIURA   : 1361  
                        LA LIBERTAD: 1416   TRUJILLO: 1355  
                        LAMBAYEQUE : 1366   CHICLAYO: 1221  
                        (Other)    : 2111   (Other) : 3663  
                       distrito     metododx         edad               sexo      
     SAN JUAN DE LURIGANCHO:15131   PCR:22339   Min.   :  0.00   Femenino :14825  
     LIMA                  : 7997   PR :55504   1st Qu.: 50.00   Masculino:63018  
     SAN MARTIN DE PORRES  : 7988               Median : 58.00                    
     CALLAO                : 5636               Mean   : 57.51                    
     COMAS                 : 5277               3rd Qu.: 66.00                    
     VILLA EL SALVADOR     : 4182               Max.   :100.00                    
     (Other)               :31632                                                 
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:77843       Min.   :2020-03-19  
     1st Qu.:2020-04-27   Class :character   1st Qu.:2020-06-01  
     Median :2020-05-13   Mode  :character   Median :2020-06-08  
     Mean   :2020-05-11                      Mean   :2020-06-04  
     3rd Qu.:2020-05-26                      3rd Qu.:2020-06-13  
     Max.   :2020-06-16                      Max.   :2020-06-17  
                                                                 
       fecha_nac            edad_calc      coincidencias  
     Min.   :1919-12-01   Min.   :  0.57   Min.   : 1.00  
     1st Qu.:1954-03-29   1st Qu.: 50.09   1st Qu.: 1.00  
     Median :1962-04-01   Median : 58.16   Median : 2.00  
     Mean   :1962-05-24   Mean   : 58.03   Mean   : 2.55  
     3rd Qu.:1970-05-02   3rd Qu.: 66.20   3rd Qu.: 3.00  
     Max.   :2019-11-10   Max.   :100.51   Max.   :11.00  
                                                          

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 27927 casos reconstruídos.

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
