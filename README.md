[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-08-09 03:51:28 UTC

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

**2020-06-23**

-   Hay datos que tienen como fecha de el 2020-12-06, cuando podría
    parecer que es 2020-06-12, esto se ha corregido en los datos limpios
    en el repo, mas no el original.

**2020-07-28**

-   Luego de varios días sin actualización (al menos 3 días), los datos
    abiertos han sido actualizados.
-   Las fechas en los registros ha cambiado del formato DD/MM/YYY (y
    algunos MM/DD/YYYY) a YYYYMMDD

Información relevante
---------------------

Fuentes de datos:

-   <a href="https://www.datosabiertos.gob.pe/dataset/casos-positivos-por-covid-19-ministerio-de-salud-minsa" class="uri">https://www.datosabiertos.gob.pe/dataset/casos-positivos-por-covid-19-ministerio-de-salud-minsa</a>
-   <a href="https://www.datosabiertos.gob.pe/dataset/fallecidos-por-covid-19-ministerio-de-salud-minsa" class="uri">https://www.datosabiertos.gob.pe/dataset/fallecidos-por-covid-19-ministerio-de-salud-minsa</a>

Luego del primer paso de limpieza de datos:

         uuid                departamento               provincia     
     Length:463875      LIMA       :217966   LIMA            :208701  
     Class :character   CALLAO     : 22594   CALLAO          : 21423  
     Mode  :character   PIURA      : 22184   EN INVESTIGACIÓN: 21209  
                        LIMA REGION: 19190   AREQUIPA        : 16223  
                        LAMBAYEQUE : 18341   CHICLAYO        : 12285  
                        AREQUIPA   : 18190   TRUJILLO        : 12226  
                        (Other)    :145410   (Other)         :171808  
                       distrito      metododx          edad      
     EN INVESTIGACIÓN      : 21209   PCR:120969   Min.   :  0.0  
     SAN JUAN DE LURIGANCHO: 20809   PR :342906   1st Qu.: 31.0  
     LIMA                  : 18130                Median : 42.0  
     SAN MARTIN DE PORRES  : 14577                Mean   : 43.3  
     COMAS                 : 12785                3rd Qu.: 55.0  
     CALLAO                : 11923                Max.   :120.0  
     (Other)               :364442                NA's   :49     
            sexo        fecha_resultado     
     Femenino :206039   Min.   :2020-03-06  
     Masculino:257836   1st Qu.:2020-05-20  
                        Median :2020-06-13  
                        Mean   :2020-06-14  
                        3rd Qu.:2020-07-16  
                        Max.   :2020-08-06  
                                            

         uuid           fecha_fallecimiento       edad               sexo      
     Length:20649       Min.   :2020-03-18   Min.   :  0.00   Femenino : 6034  
     Class :character   1st Qu.:2020-05-12   1st Qu.: 57.00   Masculino:14615  
     Mode  :character   Median :2020-06-11   Median : 66.00                    
                        Mean   :2020-06-09   Mean   : 65.63                    
                        3rd Qu.:2020-07-08   3rd Qu.: 75.00                    
                        Max.   :2020-08-06   Max.   :107.00                    
                                                                               
       fecha_nac               departamento     provincia   
     Min.   :1912-12-15   LIMA       :9716   LIMA    :8482  
     1st Qu.:1944-07-19   LA LIBERTAD:1412   TRUJILLO:1012  
     Median :1953-08-23   PIURA      :1306   CALLAO  : 919  
     Mean   :1954-05-07   LAMBAYEQUE :1251   AREQUIPA: 801  
     3rd Qu.:1962-12-10   CALLAO     :1080   CHICLAYO: 704  
     Max.   :2020-02-12   ICA        : 951   (Other) :7453  
     NA's   :1994         (Other)    :4933   NA's    :1278  
                       distrito       edad_calc     
     SAN JUAN DE LURIGANCHO: 1017   Min.   :  0.17  
     LIMA                  :  722   1st Qu.: 57.48  
     CALLAO                :  619   Median : 66.79  
     SAN MARTIN DE PORRES  :  600   Mean   : 66.09  
     VILLA EL SALVADOR     :  580   3rd Qu.: 75.89  
     (Other)               :16363   Max.   :107.53  
     NA's                  :  748   NA's   :1994    

      uuid_caso              departamento       provincia     
     Length:285926      LIMA       :225935   LIMA    :225935  
     Class :character   CALLAO     : 20326   CALLAO  : 20326  
     Mode  :character   LA LIBERTAD:  8077   TRUJILLO:  7747  
                        LAMBAYEQUE :  5975   CHICLAYO:  5593  
                        ANCASH     :  5510   SANTA   :  5163  
                        PIURA      :  5273   AREQUIPA:  3221  
                        (Other)    : 14830   (Other) : 17941  
                       distrito      metododx          edad      
     SAN JUAN DE LURIGANCHO: 58503   PCR: 86309   Min.   :  0.0  
     LIMA                  : 27582   PR :199617   1st Qu.: 50.0  
     SAN MARTIN DE PORRES  : 24058                Median : 58.0  
     COMAS                 : 19802                Mean   : 57.8  
     CALLAO                : 17234                3rd Qu.: 66.0  
     VILLA EL SALVADOR     : 15155                Max.   :101.0  
     (Other)               :123592                               
            sexo        fecha_resultado      uuid_fallecimiento
     Femenino : 56484   Min.   :2020-03-07   Length:285926     
     Masculino:229442   1st Qu.:2020-04-30   Class :character  
                        Median :2020-05-20   Mode  :character  
                        Mean   :2020-05-19                     
                        3rd Qu.:2020-06-05                     
                        Max.   :2020-08-02                     
                                                               
     fecha_fallecimiento    fecha_nac            edad_calc      coincidencias   
     Min.   :2020-03-19   Min.   :1919-01-11   Min.   :  0.26   Min.   : 1.000  
     1st Qu.:2020-06-10   1st Qu.:1954-01-08   1st Qu.: 50.40   1st Qu.: 2.000  
     Median :2020-06-27   Median :1961-11-22   Median : 58.60   Median : 4.000  
     Mean   :2020-06-25   Mean   :1962-03-04   Mean   : 58.31   Mean   : 5.422  
     3rd Qu.:2020-07-17   3rd Qu.:1970-01-22   3rd Qu.: 66.52   3rd Qu.: 7.000  
     Max.   :2020-08-03   Max.   :2020-02-12   Max.   :101.48   Max.   :26.000  
                                                                                

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 50218 casos reconstruídos.

    [1] "es_PE.utf8"

![“Positivos por día. MINSA”](plots/positivos-por-dia-minsa.png)

![“Positivos acumulados. MINSA”](plots/positivos-acumulados-minsa.png)

![“Positivos por día y por Departamento.
MINSA”](plots/positivos-diarios-por-departamento-minsa.png)

![“Fallecimientos por día.
MINSA”](plots/fallecimientos-por-dia-minsa.png)

![“Fallecimientos acumulados.
MINSA”](plots/fallecimientos-acumulados-minsa.png)

![“Fallecimientos por día y por Departamento.
MINSA”](plots/fallecimientos-diarios-por-departamento-minsa.png)

![“Distribución de tiempos desde detección a fallecimiento, por número
de registros
coincidentes”](plots/deteccion-fallecimiento-por-coincidentes.png)

Los archivos “limpios” son:

-   [datos/fallecidos\_covid-utf8-limpio.csv](datos/fallecidos_covid-utf8-limpio.csv)
-   [datos/positivos\_covid-utf8-limpio.csv](datos/positivos_covid-utf8-limpio.csv)

Y algunos reconstruidos a partir de los anteriores:

-   [datos/casos\_fallecimientos\_reconstruccion\_posible.csv](datos/casos_fallecimientos_reconstruccion_posible.csv)
-   [datos/timeseries-casos.csv](datos/timeseries-casos.csv)
-   [datos/timeseries-casos-lugares.csv](datos/timeseries-casos-lugares.csv)
-   [datos/timeseries-fallecimientos.csv](datos/timeseries-fallecimientos.csv)
-   [datos/timeseries-fallecimientos-lugares.csv](datos/timeseries-fallecimientos-lugares.csv)
