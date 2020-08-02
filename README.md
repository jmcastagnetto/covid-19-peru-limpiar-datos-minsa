[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-08-02 22:19:10 UTC

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
     Length:422183      LIMA       :202207   LIMA            :194358  
     Class :character   CALLAO     : 21448   CALLAO          : 20334  
     Mode  :character   PIURA      : 21353   EN INVESTIGACIÓN: 18188  
                        LIMA REGION: 17673   AREQUIPA        : 13029  
                        LAMBAYEQUE : 17440   CHICLAYO        : 11702  
                        LA LIBERTAD: 15481   TRUJILLO        : 11252  
                        (Other)    :126581   (Other)         :153320  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 19445   PCR:112221   Min.   :  0.00  
     EN INVESTIGACIÓN      : 18188   PR :309962   1st Qu.: 31.00  
     LIMA                  : 17089                Median : 42.00  
     SAN MARTIN DE PORRES  : 13721                Mean   : 43.33  
     COMAS                 : 11838                3rd Qu.: 55.00  
     CALLAO                : 11425                Max.   :120.00  
     (Other)               :330477                NA's   :20      
            sexo        fecha_resultado     
     Femenino :185138   Min.   :2020-03-06  
     Masculino:237045   1st Qu.:2020-05-18  
                        Median :2020-06-09  
                        Mean   :2020-06-09  
                        3rd Qu.:2020-07-07  
                        Max.   :2020-07-31  
                                            

         uuid           fecha_fallecimiento       edad               sexo      
     Length:19408       Min.   :2020-03-18   Min.   :  0.00   Femenino : 5673  
     Class :character   1st Qu.:2020-05-10   1st Qu.: 57.00   Masculino:13735  
     Mode  :character   Median :2020-06-09   Median : 66.00                    
                        Mean   :2020-06-06   Mean   : 65.62                    
                        3rd Qu.:2020-07-03   3rd Qu.: 75.00                    
                        Max.   :2020-07-31   Max.   :107.00                    
                                                                               
       fecha_nac               departamento     provincia   
     Min.   :1912-12-15   LIMA       :9166   LIMA    :7921  
     1st Qu.:1944-07-09   LA LIBERTAD:1355   TRUJILLO: 981  
     Median :1953-08-08   PIURA      :1260   CALLAO  : 874  
     Mean   :1954-04-28   LAMBAYEQUE :1225   AREQUIPA: 697  
     3rd Qu.:1962-12-02   CALLAO     :1034   CHICLAYO: 683  
     Max.   :2020-02-12   ICA        : 856   (Other) :6914  
     NA's   :1120         (Other)    :4512   NA's    :1338  
                       distrito       edad_calc     
     SAN JUAN DE LURIGANCHO:  945   Min.   :  0.17  
     LIMA                  :  677   1st Qu.: 57.50  
     CALLAO                :  578   Median : 66.84  
     SAN MARTIN DE PORRES  :  574   Mean   : 66.11  
     VILLA EL SALVADOR     :  550   3rd Qu.: 75.91  
     (Other)               :15279   Max.   :107.53  
     NA's                  :  805   NA's   :1120    

      uuid_caso              departamento       provincia     
     Length:273164      LIMA       :214589   LIMA    :214589  
     Class :character   CALLAO     : 21175   CALLAO  : 21175  
     Mode  :character   LA LIBERTAD:  7813   TRUJILLO:  7525  
                        LAMBAYEQUE :  5787   CHICLAYO:  5418  
                        ANCASH     :  5439   SANTA   :  5109  
                        PIURA      :  5185   PIURA   :  3064  
                        (Other)    : 13176   (Other) : 16284  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 54955   PCR: 82549   Min.   :  0.00  
     LIMA                  : 26702   PR :190615   1st Qu.: 50.00  
     SAN MARTIN DE PORRES  : 23032                Median : 58.00  
     COMAS                 : 19119                Mean   : 57.82  
     CALLAO                : 17903                3rd Qu.: 66.00  
     VILLA EL SALVADOR     : 14533                Max.   :101.00  
     (Other)               :116920                                
            sexo        fecha_resultado      uuid_fallecimiento
     Femenino : 53209   Min.   :2020-03-07   Length:273164     
     Masculino:219955   1st Qu.:2020-04-29   Class :character  
                        Median :2020-05-19   Mode  :character  
                        Mean   :2020-05-18                     
                        3rd Qu.:2020-06-04                     
                        Max.   :2020-07-29                     
                                                               
     fecha_fallecimiento    fecha_nac            edad_calc      coincidencias   
     Min.   :2020-03-19   Min.   :1919-01-11   Min.   :  0.26   Min.   : 1.000  
     1st Qu.:2020-06-08   1st Qu.:1953-12-25   1st Qu.: 50.39   1st Qu.: 2.000  
     Median :2020-06-26   Median :1961-12-13   Median : 58.54   Median : 4.000  
     Mean   :2020-06-23   Mean   :1962-02-22   Mean   : 58.33   Mean   : 5.321  
     3rd Qu.:2020-07-14   3rd Qu.:1970-01-29   3rd Qu.: 66.51   3rd Qu.: 7.000  
     Max.   :2020-07-30   Max.   :2020-02-12   Max.   :101.48   Max.   :26.000  
                                                                                

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 47575 casos reconstruídos.

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
