[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-08-04 16:18:47 UTC

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
     Length:433100      LIMA       :206559   LIMA            :198351  
     Class :character   CALLAO     : 21708   CALLAO          : 20575  
     Mode  :character   PIURA      : 21570   EN INVESTIGACIÓN: 18932  
                        LIMA REGION: 17855   AREQUIPA        : 13818  
                        LAMBAYEQUE : 17678   CHICLAYO        : 11843  
                        LA LIBERTAD: 15903   TRUJILLO        : 11545  
                        (Other)    :131827   (Other)         :158036  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 19796   PCR:114796   Min.   :  0.00  
     EN INVESTIGACIÓN      : 18932   PR :318304   1st Qu.: 31.00  
     LIMA                  : 17394                Median : 42.00  
     SAN MARTIN DE PORRES  : 13930                Mean   : 43.33  
     COMAS                 : 12100                3rd Qu.: 55.00  
     CALLAO                : 11500                Max.   :120.00  
     (Other)               :339448                NA's   :28      
            sexo        fecha_resultado     
     Femenino :190659   Min.   :2020-03-06  
     Masculino:242441   1st Qu.:2020-05-18  
                        Median :2020-06-10  
                        Mean   :2020-06-11  
                        3rd Qu.:2020-07-10  
                        Max.   :2020-08-02  
                                            

         uuid           fecha_fallecimiento       edad               sexo      
     Length:19811       Min.   :2020-03-18   Min.   :  0.00   Femenino : 5797  
     Class :character   1st Qu.:2020-05-10   1st Qu.: 57.00   Masculino:14014  
     Mode  :character   Median :2020-06-10   Median : 66.00                    
                        Mean   :2020-06-08   Mean   : 65.63                    
                        3rd Qu.:2020-07-05   3rd Qu.: 75.00                    
                        Max.   :2020-08-02   Max.   :107.00                    
                                                                               
       fecha_nac               departamento     provincia   
     Min.   :1912-12-15   LIMA       :9351   LIMA    :8090  
     1st Qu.:1944-07-07   LA LIBERTAD:1373   TRUJILLO: 990  
     Median :1953-08-13   PIURA      :1276   CALLAO  : 892  
     Mean   :1954-04-27   LAMBAYEQUE :1235   AREQUIPA: 731  
     3rd Qu.:1962-11-29   CALLAO     :1052   CHICLAYO: 690  
     Max.   :2020-02-12   ICA        : 877   (Other) :7080  
     NA's   :1131         (Other)    :4647   NA's    :1338  
                       distrito       edad_calc     
     SAN JUAN DE LURIGANCHO:  971   Min.   :  0.17  
     LIMA                  :  685   1st Qu.: 57.52  
     CALLAO                :  588   Median : 66.83  
     SAN MARTIN DE PORRES  :  587   Mean   : 66.12  
     VILLA EL SALVADOR     :  560   3rd Qu.: 75.92  
     (Other)               :15615   Max.   :107.53  
     NA's                  :  805   NA's   :1131    

      uuid_caso              departamento       provincia     
     Length:282561      LIMA       :222387   LIMA    :222387  
     Class :character   CALLAO     : 21496   CALLAO  : 21496  
     Mode  :character   LA LIBERTAD:  7961   TRUJILLO:  7648  
                        LAMBAYEQUE :  5888   CHICLAYO:  5518  
                        ANCASH     :  5480   SANTA   :  5150  
                        PIURA      :  5291   PIURA   :  3079  
                        (Other)    : 14058   (Other) : 17283  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 56945   PCR: 85358   Min.   :  0.00  
     LIMA                  : 27507   PR :197203   1st Qu.: 50.00  
     SAN MARTIN DE PORRES  : 23718                Median : 58.00  
     COMAS                 : 19797                Mean   : 57.82  
     CALLAO                : 18066                3rd Qu.: 66.00  
     VILLA EL SALVADOR     : 14828                Max.   :101.00  
     (Other)               :121700                                
            sexo        fecha_resultado      uuid_fallecimiento
     Femenino : 55408   Min.   :2020-03-07   Length:282561     
     Masculino:227153   1st Qu.:2020-04-30   Class :character  
                        Median :2020-05-19   Mode  :character  
                        Mean   :2020-05-19                     
                        3rd Qu.:2020-06-05                     
                        Max.   :2020-07-31                     
                                                               
     fecha_fallecimiento    fecha_nac            edad_calc      coincidencias   
     Min.   :2020-03-19   Min.   :1919-01-11   Min.   :  0.26   Min.   : 1.000  
     1st Qu.:2020-06-09   1st Qu.:1953-12-25   1st Qu.: 50.40   1st Qu.: 2.000  
     Median :2020-06-27   Median :1961-11-29   Median : 58.56   Median : 4.000  
     Mean   :2020-06-24   Mean   :1962-02-26   Mean   : 58.32   Mean   : 5.396  
     3rd Qu.:2020-07-16   3rd Qu.:1970-01-22   3rd Qu.: 66.52   3rd Qu.: 7.000  
     Max.   :2020-08-01   Max.   :2020-02-12   Max.   :101.48   Max.   :26.000  
                                                                                

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 48883 casos reconstruídos.

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
