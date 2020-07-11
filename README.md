[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-07-11 20:52:18 UTC

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
     Length:319646      LIMA       :162219   LIMA            :157881  
     Class :character   CALLAO     : 18921   EN INVESTIGACIÓN: 19937  
     Mode  :character   PIURA      : 18394   CALLAO          : 17932  
                        LAMBAYEQUE : 14818   CHICLAYO        :  9991  
                        LA LIBERTAD: 11629   PIURA           :  8724  
                        LIMA REGION: 10635   TRUJILLO        :  8248  
                        (Other)    : 83030   (Other)         : 96933  
                       distrito      metododx          edad       
     EN INVESTIGACIÓN      : 19937   PCR: 81835   Min.   :  0.00  
     SAN JUAN DE LURIGANCHO: 15442   PR :237811   1st Qu.: 31.00  
     LIMA                  : 14290                Median : 42.00  
     SAN MARTIN DE PORRES  : 11426                Mean   : 43.35  
     CALLAO                : 10363                3rd Qu.: 55.00  
     COMAS                 :  9422                Max.   :120.00  
     (Other)               :238766                NA's   :1562    
            sexo        fecha_resultado     
     Femenino :135420   Min.   :2020-03-06  
     Masculino:181439   1st Qu.:2020-05-11  
     NA's     :  2787   Median :2020-05-27  
                        Mean   :2020-05-27  
                        3rd Qu.:2020-06-15  
                        Max.   :2020-07-09  
                        NA's   :1309        

         uuid           fecha_fallecimiento       edad               sexo     
     Length:11500       Min.   :2020-03-19   Min.   :  0.00   Femenino :3370  
     Class :character   1st Qu.:2020-05-09   1st Qu.: 57.00   Masculino:8130  
     Mode  :character   Median :2020-06-08   Median : 66.00                   
                        Mean   :2020-06-01   Mean   : 65.63                   
                        3rd Qu.:2020-06-23   3rd Qu.: 75.00                   
                        Max.   :2020-07-09   Max.   :107.00                   
                                                                              
       fecha_nac               departamento     provincia   
     Min.   :1912-12-15   LIMA       :5360   LIMA    :4484  
     1st Qu.:1944-06-14   PIURA      : 827   CALLAO  : 542  
     Median :1953-07-03   LAMBAYEQUE : 784   TRUJILLO: 542  
     Mean   :1954-04-23   LA LIBERTAD: 745   PIURA   : 442  
     3rd Qu.:1962-11-30   CALLAO     : 702   AREQUIPA: 334  
     Max.   :2020-02-12   ICA        : 580   (Other) :3818  
     NA's   :787          (Other)    :2502   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 541   Min.   :  0.17  
     SAN MARTIN DE PORRES  : 391   1st Qu.: 57.51  
     CALLAO                : 378   Median : 66.94  
     LIMA                  : 368   Mean   : 66.11  
     COMAS                 : 356   3rd Qu.: 75.97  
     (Other)               :8661   Max.   :107.53  
     NA's                  : 805   NA's   :787     

      uuid_caso              departamento       provincia     
     Length:158103      LIMA       :125831   LIMA    :125831  
     Class :character   CALLAO     : 13523   CALLAO  : 13523  
     Mode  :character   LA LIBERTAD:  4013   TRUJILLO:  3848  
                        PIURA      :  3326   SANTA   :  2817  
                        ANCASH     :  2965   CHICLAYO:  2173  
                        LAMBAYEQUE :  2399   PIURA   :  2140  
                        (Other)    :  6046   (Other) :  7771  
                       distrito     metododx          edad       
     SAN JUAN DE LURIGANCHO:32069   PCR: 45815   Min.   :  0.00  
     LIMA                  :16276   PR :112288   1st Qu.: 50.00  
     SAN MARTIN DE PORRES  :14589                Median : 58.00  
     COMAS                 :11691                Mean   : 57.73  
     CALLAO                :11362                3rd Qu.: 66.00  
     VILLA EL SALVADOR     : 7900                Max.   :101.00  
     (Other)               :64216                                
            sexo        fecha_resultado      uuid_fallecimiento
     Femenino : 30716   Min.   :2020-03-07   Length:158103     
     Masculino:127387   1st Qu.:2020-04-30   Class :character  
                        Median :2020-05-19   Mode  :character  
                        Mean   :2020-05-16                     
                        3rd Qu.:2020-05-30                     
                        Max.   :2020-07-08                     
                                                               
     fecha_fallecimiento    fecha_nac            edad_calc      coincidencias   
     Min.   :2020-03-19   Min.   :1919-01-11   Min.   :  0.39   Min.   : 1.000  
     1st Qu.:2020-06-08   1st Qu.:1953-11-22   1st Qu.: 50.29   1st Qu.: 2.000  
     Median :2020-06-18   Median :1962-01-20   Median : 58.41   Median : 3.000  
     Mean   :2020-06-16   Mean   :1962-03-21   Mean   : 58.24   Mean   : 3.777  
     3rd Qu.:2020-06-28   3rd Qu.:1970-03-03   3rd Qu.: 66.56   3rd Qu.: 5.000  
     Max.   :2020-07-09   Max.   :2020-02-12   Max.   :101.48   Max.   :16.000  
                                                                                

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 36774 casos reconstruídos.

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
