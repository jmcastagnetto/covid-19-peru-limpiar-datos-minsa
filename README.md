[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-07-25 02:03:44 UTC

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

Información relevante
---------------------

Fuentes de datos:

-   <a href="https://www.datosabiertos.gob.pe/dataset/casos-positivos-por-covid-19-ministerio-de-salud-minsa" class="uri">https://www.datosabiertos.gob.pe/dataset/casos-positivos-por-covid-19-ministerio-de-salud-minsa</a>
-   <a href="https://www.datosabiertos.gob.pe/dataset/fallecidos-por-covid-19-ministerio-de-salud-minsa" class="uri">https://www.datosabiertos.gob.pe/dataset/fallecidos-por-covid-19-ministerio-de-salud-minsa</a>

Luego del primer paso de limpieza de datos:

         uuid                departamento               provincia     
     Length:371096      LIMA       :183475   LIMA            :177214  
     Class :character   CALLAO     : 20184   CALLAO          : 19148  
     Mode  :character   PIURA      : 20054   EN INVESTIGACIÓN: 14721  
                        LAMBAYEQUE : 16122   CHICLAYO        : 10851  
                        LIMA REGION: 14767   AREQUIPA        : 10212  
                        LA LIBERTAD: 13664   PIURA           :  9943  
                        (Other)    :102830   (Other)         :129007  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 17481   PCR:100489   Min.   :  0.00  
     LIMA                  : 15841   PR :270607   1st Qu.: 31.00  
     EN INVESTIGACIÓN      : 14721                Median : 42.00  
     SAN MARTIN DE PORRES  : 12716                Mean   : 43.36  
     CALLAO                : 10915                3rd Qu.: 55.00  
     COMAS                 : 10822                Max.   :120.00  
     (Other)               :288600                NA's   :791     
            sexo        fecha_resultado     
     Femenino :159612   Min.   :2020-03-06  
     Masculino:209486   1st Qu.:2020-05-14  
     NA's     :  1998   Median :2020-06-02  
                        Mean   :2020-06-03  
                        3rd Qu.:2020-06-26  
                        Max.   :2020-07-22  
                        NA's   :522         

         uuid           fecha_fallecimiento       edad               sexo      
     Length:17654       Min.   :2020-03-18   Min.   :  0.00   Femenino : 5187  
     Class :character   1st Qu.:2020-05-08   1st Qu.: 57.00   Masculino:12467  
     Mode  :character   Median :2020-06-05   Median : 66.00                    
                        Mean   :2020-06-02   Mean   : 65.63                    
                        3rd Qu.:2020-06-27   3rd Qu.: 75.00                    
                        Max.   :2020-07-22   Max.   :107.00                    
                                                                               
       fecha_nac               departamento     provincia   
     Min.   :1912-12-15   LIMA       :8331   LIMA    :7295  
     1st Qu.:1944-06-27   LA LIBERTAD:1248   TRUJILLO: 906  
     Median :1953-07-17   PIURA      :1225   CALLAO  : 827  
     Mean   :1954-04-12   LAMBAYEQUE :1197   CHICLAYO: 663  
     3rd Qu.:1962-11-28   CALLAO     : 987   AREQUIPA: 580  
     Max.   :2020-02-12   ANCASH     : 782   (Other) :6045  
     NA's   :1533         (Other)    :3884   NA's    :1338  
                       distrito       edad_calc     
     SAN JUAN DE LURIGANCHO:  853   Min.   :  0.17  
     LIMA                  :  645   1st Qu.: 57.53  
     CALLAO                :  553   Median : 66.90  
     SAN MARTIN DE PORRES  :  545   Mean   : 66.15  
     VILLA EL SALVADOR     :  518   3rd Qu.: 75.94  
     (Other)               :13735   Max.   :107.53  
     NA's                  :  805   NA's   :1533    

      uuid_caso              departamento       provincia     
     Length:231985      LIMA       :180795   LIMA    :180795  
     Class :character   CALLAO     : 18708   CALLAO  : 18708  
     Mode  :character   LA LIBERTAD:  6772   TRUJILLO:  6522  
                        LAMBAYEQUE :  5363   CHICLAYO:  5016  
                        ANCASH     :  4910   SANTA   :  4627  
                        PIURA      :  4843   PIURA   :  2904  
                        (Other)    : 10594   (Other) : 13413  
                       distrito     metododx          edad       
     SAN JUAN DE LURIGANCHO:45270   PCR: 69266   Min.   :  0.00  
     LIMA                  :22878   PR :162719   1st Qu.: 50.00  
     SAN MARTIN DE PORRES  :20619                Median : 58.00  
     COMAS                 :16458                Mean   : 57.77  
     CALLAO                :15731                3rd Qu.: 66.00  
     VILLA EL SALVADOR     :12422                Max.   :101.00  
     (Other)               :98607                                
            sexo        fecha_resultado      uuid_fallecimiento
     Femenino : 45192   Min.   :2020-03-07   Length:231985     
     Masculino:186793   1st Qu.:2020-04-29   Class :character  
                        Median :2020-05-19   Mode  :character  
                        Mean   :2020-05-17                     
                        3rd Qu.:2020-06-02                     
                        Max.   :2020-07-21                     
                                                               
     fecha_fallecimiento    fecha_nac            edad_calc      coincidencias   
     Min.   :2020-03-19   Min.   :1919-01-11   Min.   :  0.30   Min.   : 1.000  
     1st Qu.:2020-06-08   1st Qu.:1953-12-23   1st Qu.: 50.29   1st Qu.: 2.000  
     Median :2020-06-22   Median :1962-01-28   Median : 58.41   Median : 4.000  
     Mean   :2020-06-20   Mean   :1962-03-12   Mean   : 58.27   Mean   : 4.735  
     3rd Qu.:2020-07-09   3rd Qu.:1970-03-12   3rd Qu.: 66.50   3rd Qu.: 7.000  
     Max.   :2020-07-22   Max.   :2020-02-12   Max.   :101.48   Max.   :21.000  
                                                                                

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 43530 casos reconstruídos.

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
