[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-08-06 17:34:04 UTC

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
     Length:447624      LIMA       :212212   LIMA            :203511  
     Class :character   CALLAO     : 22131   CALLAO          : 20983  
     Mode  :character   PIURA      : 21871   EN INVESTIGACIÓN: 20007  
                        LIMA REGION: 18605   AREQUIPA        : 14707  
                        LAMBAYEQUE : 17977   CHICLAYO        : 12043  
                        AREQUIPA   : 16500   TRUJILLO        : 11883  
                        (Other)    :138328   (Other)         :164490  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 20286   PCR:117744   Min.   :  0.00  
     EN INVESTIGACIÓN      : 20007   PR :329880   1st Qu.: 31.00  
     LIMA                  : 17755                Median : 42.00  
     SAN MARTIN DE PORRES  : 14219                Mean   : 43.32  
     COMAS                 : 12390                3rd Qu.: 55.00  
     CALLAO                : 11730                Max.   :120.00  
     (Other)               :351237                NA's   :39      
            sexo        fecha_resultado     
     Femenino :197975   Min.   :2020-03-06  
     Masculino:249649   1st Qu.:2020-05-19  
                        Median :2020-06-11  
                        Mean   :2020-06-12  
                        3rd Qu.:2020-07-13  
                        Max.   :2020-08-04  
                                            

         uuid           fecha_fallecimiento       edad               sexo      
     Length:20228       Min.   :2020-03-18   Min.   :  0.00   Femenino : 5905  
     Class :character   1st Qu.:2020-05-11   1st Qu.: 57.00   Masculino:14323  
     Mode  :character   Median :2020-06-11   Median : 66.00                    
                        Mean   :2020-06-09   Mean   : 65.61                    
                        3rd Qu.:2020-07-07   3rd Qu.: 75.00                    
                        Max.   :2020-08-04   Max.   :107.00                    
                                                                               
       fecha_nac               departamento     provincia   
     Min.   :1912-12-15   LIMA       :9515   LIMA    :8245  
     1st Qu.:1944-07-16   LA LIBERTAD:1391   TRUJILLO:1000  
     Median :1953-08-23   PIURA      :1295   CALLAO  : 900  
     Mean   :1954-05-03   LAMBAYEQUE :1242   AREQUIPA: 767  
     3rd Qu.:1962-12-04   CALLAO     :1060   CHICLAYO: 693  
     Max.   :2020-02-12   ICA        : 929   (Other) :7285  
     NA's   :1155         (Other)    :4796   NA's    :1338  
                       distrito       edad_calc     
     SAN JUAN DE LURIGANCHO:  983   Min.   :  0.17  
     LIMA                  :  700   1st Qu.: 57.50  
     SAN MARTIN DE PORRES  :  594   Median : 66.80  
     CALLAO                :  589   Mean   : 66.10  
     VILLA EL SALVADOR     :  566   3rd Qu.: 75.90  
     (Other)               :15991   Max.   :107.53  
     NA's                  :  805   NA's   :1155    

      uuid_caso              departamento       provincia     
     Length:293264      LIMA       :231057   LIMA    :231057  
     Class :character   CALLAO     : 22188   CALLAO  : 22188  
     Mode  :character   LA LIBERTAD:  8078   TRUJILLO:  7748  
                        LAMBAYEQUE :  6026   CHICLAYO:  5636  
                        ANCASH     :  5561   SANTA   :  5214  
                        PIURA      :  5334   AREQUIPA:  3218  
                        (Other)    : 15020   (Other) : 18203  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 59706   PCR: 88598   Min.   :  0.00  
     LIMA                  : 28355   PR :204666   1st Qu.: 50.00  
     SAN MARTIN DE PORRES  : 24393                Median : 58.00  
     COMAS                 : 20677                Mean   : 57.84  
     CALLAO                : 18581                3rd Qu.: 66.00  
     VILLA EL SALVADOR     : 15264                Max.   :101.00  
     (Other)               :126288                                
            sexo        fecha_resultado      uuid_fallecimiento
     Femenino : 58282   Min.   :2020-03-07   Length:293264     
     Masculino:234982   1st Qu.:2020-04-30   Class :character  
                        Median :2020-05-20   Mode  :character  
                        Mean   :2020-05-20                     
                        3rd Qu.:2020-06-06                     
                        Max.   :2020-08-02                     
                                                               
     fecha_fallecimiento    fecha_nac            edad_calc      coincidencias   
     Min.   :2020-03-19   Min.   :1919-01-11   Min.   :  0.26   Min.   : 1.000  
     1st Qu.:2020-06-10   1st Qu.:1953-12-25   1st Qu.: 50.44   1st Qu.: 2.000  
     Median :2020-06-28   Median :1961-11-11   Median : 58.63   Median : 4.000  
     Mean   :2020-06-26   Mean   :1962-02-18   Mean   : 58.35   Mean   : 5.492  
     3rd Qu.:2020-07-18   3rd Qu.:1970-01-05   3rd Qu.: 66.52   3rd Qu.: 7.000  
     Max.   :2020-08-03   Max.   :2020-02-12   Max.   :101.48   Max.   :26.000  
                                                                                

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 50740 casos reconstruídos.

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
