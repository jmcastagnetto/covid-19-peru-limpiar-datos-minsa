[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-08-05 16:59:13 UTC

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
     Length:439890      LIMA       :209339   LIMA            :200940  
     Class :character   CALLAO     : 21943   CALLAO          : 20802  
     Mode  :character   PIURA      : 21694   EN INVESTIGACIÓN: 19457  
                        LIMA REGION: 18378   AREQUIPA        : 14122  
                        LAMBAYEQUE : 17801   CHICLAYO        : 11922  
                        LA LIBERTAD: 16089   TRUJILLO        : 11681  
                        (Other)    :134646   (Other)         :160966  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 20023   PCR:116060   Min.   :  0.00  
     EN INVESTIGACIÓN      : 19457   PR :323830   1st Qu.: 31.00  
     LIMA                  : 17545                Median : 42.00  
     SAN MARTIN DE PORRES  : 14089                Mean   : 43.32  
     COMAS                 : 12220                3rd Qu.: 55.00  
     CALLAO                : 11635                Max.   :120.00  
     (Other)               :344921                NA's   :29      
            sexo        fecha_resultado     
     Femenino :194128   Min.   :2020-03-06  
     Masculino:245762   1st Qu.:2020-05-19  
                        Median :2020-06-10  
                        Mean   :2020-06-11  
                        3rd Qu.:2020-07-11  
                        Max.   :2020-08-03  
                                            

         uuid           fecha_fallecimiento       edad               sexo      
     Length:20007       Min.   :2020-03-18   Min.   :  0.00   Femenino : 5851  
     Class :character   1st Qu.:2020-05-11   1st Qu.: 57.00   Masculino:14156  
     Mode  :character   Median :2020-06-10   Median : 66.00                    
                        Mean   :2020-06-08   Mean   : 65.61                    
                        3rd Qu.:2020-07-06   3rd Qu.: 75.00                    
                        Max.   :2020-08-03   Max.   :107.00                    
                                                                               
       fecha_nac               departamento     provincia   
     Min.   :1912-12-15   LIMA       :9428   LIMA    :8163  
     1st Qu.:1944-07-07   LA LIBERTAD:1379   TRUJILLO: 992  
     Median :1953-08-13   PIURA      :1282   CALLAO  : 897  
     Mean   :1954-04-27   LAMBAYEQUE :1238   AREQUIPA: 745  
     3rd Qu.:1962-11-29   CALLAO     :1057   CHICLAYO: 691  
     Max.   :2020-02-12   ICA        : 918   (Other) :7181  
     NA's   :1327         (Other)    :4705   NA's    :1338  
                       distrito       edad_calc     
     SAN JUAN DE LURIGANCHO:  980   Min.   :  0.17  
     LIMA                  :  690   1st Qu.: 57.52  
     SAN MARTIN DE PORRES  :  590   Median : 66.83  
     CALLAO                :  589   Mean   : 66.12  
     VILLA EL SALVADOR     :  561   3rd Qu.: 75.92  
     (Other)               :15792   Max.   :107.53  
     NA's                  :  805   NA's   :1327    

      uuid_caso              departamento       provincia     
     Length:282572      LIMA       :222391   LIMA    :222391  
     Class :character   CALLAO     : 21497   CALLAO  : 21497  
     Mode  :character   LA LIBERTAD:  7962   TRUJILLO:  7649  
                        LAMBAYEQUE :  5888   CHICLAYO:  5518  
                        ANCASH     :  5480   SANTA   :  5150  
                        PIURA      :  5291   PIURA   :  3079  
                        (Other)    : 14063   (Other) : 17288  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 56946   PCR: 85358   Min.   :  0.00  
     LIMA                  : 27507   PR :197214   1st Qu.: 50.00  
     SAN MARTIN DE PORRES  : 23719                Median : 58.00  
     COMAS                 : 19799                Mean   : 57.82  
     CALLAO                : 18067                3rd Qu.: 66.00  
     VILLA EL SALVADOR     : 14828                Max.   :101.00  
     (Other)               :121706                                
            sexo        fecha_resultado      uuid_fallecimiento
     Femenino : 55413   Min.   :2020-03-07   Length:282572     
     Masculino:227159   1st Qu.:2020-04-30   Class :character  
                        Median :2020-05-19   Mode  :character  
                        Mean   :2020-05-19                     
                        3rd Qu.:2020-06-05                     
                        Max.   :2020-07-31                     
                                                               
     fecha_fallecimiento    fecha_nac            edad_calc      coincidencias   
     Min.   :2020-03-19   Min.   :1919-01-11   Min.   :  0.26   Min.   : 1.000  
     1st Qu.:2020-06-09   1st Qu.:1953-12-25   1st Qu.: 50.40   1st Qu.: 2.000  
     Median :2020-06-27   Median :1961-11-29   Median : 58.56   Median : 4.000  
     Mean   :2020-06-24   Mean   :1962-02-26   Mean   : 58.32   Mean   : 5.395  
     3rd Qu.:2020-07-16   3rd Qu.:1970-01-22   3rd Qu.: 66.52   3rd Qu.: 7.000  
     Max.   :2020-08-01   Max.   :2020-02-12   Max.   :101.48   Max.   :26.000  
                                                                                

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 48892 casos reconstruídos.

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
