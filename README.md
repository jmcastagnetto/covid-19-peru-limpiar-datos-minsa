[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-07-15 20:49:26 UTC

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
     Length:333867      LIMA       :167571   LIMA            :163069  
     Class :character   CALLAO     : 19243   CALLAO          : 18240  
     Mode  :character   PIURA      : 19024   EN INVESTIGACIÓN: 12197  
                        LAMBAYEQUE : 15150   CHICLAYO        : 10240  
                        LA LIBERTAD: 12341   PIURA           :  9046  
                        LIMA REGION: 11606   TRUJILLO        :  8781  
                        (Other)    : 88932   (Other)         :112294  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 15983   PCR: 86332   Min.   :  0.00  
     LIMA                  : 14868   PR :247535   1st Qu.: 31.00  
     EN INVESTIGACIÓN      : 12197                Median : 42.00  
     SAN MARTIN DE PORRES  : 11729                Mean   : 43.36  
     CALLAO                : 10479                3rd Qu.: 55.00  
     COMAS                 :  9770                Max.   :120.00  
     (Other)               :258841                NA's   :1574    
            sexo        fecha_resultado     
     Femenino :142048   Min.   :2020-03-06  
     Masculino:189035   1st Qu.:2020-05-12  
     NA's     :  2784   Median :2020-05-29  
                        Mean   :2020-05-29  
                        3rd Qu.:2020-06-18  
                        Max.   :2020-07-13  
                        NA's   :1309        

         uuid           fecha_fallecimiento       edad               sexo     
     Length:12229       Min.   :2020-03-19   Min.   :  0.00   Femenino :3575  
     Class :character   1st Qu.:2020-05-11   1st Qu.: 57.00   Masculino:8654  
     Mode  :character   Median :2020-06-10   Median : 66.00                   
                        Mean   :2020-06-03   Mean   : 65.65                   
                        3rd Qu.:2020-06-26   3rd Qu.: 75.00                   
                        Max.   :2020-07-13   Max.   :107.00                   
                                                                              
       fecha_nac               departamento     provincia   
     Min.   :1912-12-15   LIMA       :5684   LIMA    :4784  
     1st Qu.:1944-06-13   PIURA      : 851   TRUJILLO: 588  
     Median :1953-07-08   LA LIBERTAD: 811   CALLAO  : 565  
     Mean   :1954-04-16   LAMBAYEQUE : 803   PIURA   : 457  
     3rd Qu.:1962-11-28   CALLAO     : 725   AREQUIPA: 413  
     Max.   :2020-02-12   ICA        : 631   (Other) :4084  
     NA's   :788          (Other)    :2724   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 571   Min.   :  0.17  
     SAN MARTIN DE PORRES  : 413   1st Qu.: 57.54  
     CALLAO                : 387   Median : 66.92  
     COMAS                 : 383   Mean   : 66.14  
     LIMA                  : 382   3rd Qu.: 75.97  
     (Other)               :9288   Max.   :107.53  
     NA's                  : 805   NA's   :788     

      uuid_caso              departamento       provincia     
     Length:173364      LIMA       :138421   LIMA    :138411  
     Class :character   CALLAO     : 14033   CALLAO  : 14033  
     Mode  :character   LA LIBERTAD:  4554   TRUJILLO:  4360  
                        PIURA      :  3467   SANTA   :  3057  
                        ANCASH     :  3259   PIURA   :  2258  
                        LAMBAYEQUE :  2491   CHICLAYO:  2252  
                        (Other)    :  7139   (Other) :  8993  
                       distrito     metododx          edad              sexo       
     SAN JUAN DE LURIGANCHO:35146   PCR: 50733   Min.   :  0.0   Femenino : 33261  
     LIMA                  :17177   PR :122631   1st Qu.: 50.0   Masculino:140103  
     SAN MARTIN DE PORRES  :15872                Median : 58.0                     
     COMAS                 :13200                Mean   : 57.8                     
     CALLAO                :11699                3rd Qu.: 66.0                     
     VILLA EL SALVADOR     : 8908                Max.   :101.0                     
     (Other)               :71362                                                  
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:173364      Min.   :2020-03-19  
     1st Qu.:2020-05-01   Class :character   1st Qu.:2020-06-09  
     Median :2020-05-19   Mode  :character   Median :2020-06-20  
     Mean   :2020-05-17                      Mean   :2020-06-18  
     3rd Qu.:2020-06-01                      3rd Qu.:2020-07-01  
     Max.   :2020-07-12                      Max.   :2020-07-13  
                                                                 
       fecha_nac            edad_calc      coincidencias   
     Min.   :1919-01-11   Min.   :  0.39   Min.   : 1.000  
     1st Qu.:1953-12-07   1st Qu.: 50.49   1st Qu.: 2.000  
     Median :1961-12-29   Median : 58.46   Median : 3.000  
     Mean   :1962-02-26   Mean   : 58.31   Mean   : 3.983  
     3rd Qu.:1969-12-13   3rd Qu.: 66.52   3rd Qu.: 5.000  
     Max.   :2020-02-12   Max.   :101.48   Max.   :16.000  
                                                           

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 38790 casos reconstruídos.

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
