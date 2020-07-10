[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-07-10 16:13:38 UTC

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
     Length:316448      LIMA       :161220   LIMA            :156677  
     Class :character   CALLAO     : 18745   EN INVESTIGACIÓN: 19684  
     Mode  :character   PIURA      : 18293   CALLAO          : 17757  
                        LAMBAYEQUE : 14742   CHICLAYO        :  9949  
                        LA LIBERTAD: 11494   PIURA           :  8670  
                        LIMA REGION: 10238   TRUJILLO        :  8132  
                        (Other)    : 81716   (Other)         : 95579  
                       distrito      metododx          edad       
     EN INVESTIGACIÓN      : 19684   PCR: 80761   Min.   :  0.00  
     SAN JUAN DE LURIGANCHO: 15308   PR :235687   1st Qu.: 31.00  
     LIMA                  : 14096                Median : 42.00  
     SAN MARTIN DE PORRES  : 11363                Mean   : 43.35  
     CALLAO                : 10270                3rd Qu.: 55.00  
     COMAS                 :  9341                Max.   :120.00  
     (Other)               :236386                NA's   :1560    
            sexo        fecha_resultado     
     Femenino :133840   Min.   :2020-03-06  
     Masculino:179821   1st Qu.:2020-05-11  
     NA's     :  2787   Median :2020-05-27  
                        Mean   :2020-05-27  
                        3rd Qu.:2020-06-15  
                        Max.   :2020-07-08  
                        NA's   :1480        

         uuid           fecha_fallecimiento       edad               sexo     
     Length:11314       Min.   :2020-03-19   Min.   :  0.00   Femenino :3310  
     Class :character   1st Qu.:2020-05-09   1st Qu.: 57.00   Masculino:8004  
     Mode  :character   Median :2020-06-07   Median : 66.00                   
                        Mean   :2020-05-31   Mean   : 65.63                   
                        3rd Qu.:2020-06-22   3rd Qu.: 75.00                   
                        Max.   :2020-07-08   Max.   :107.00                   
                                                                              
       fecha_nac               departamento     provincia   
     Min.   :1912-12-15   LIMA       :5252   LIMA    :4407  
     1st Qu.:1944-06-04   PIURA      : 820   TRUJILLO: 538  
     Median :1953-07-03   LAMBAYEQUE : 780   CALLAO  : 533  
     Mean   :1954-04-23   LA LIBERTAD: 738   PIURA   : 437  
     3rd Qu.:1962-11-28   CALLAO     : 693   CHICLAYO: 328  
     Max.   :2020-02-12   ICA        : 568   (Other) :3733  
     NA's   :784          (Other)    :2463   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 533   Min.   :  0.17  
     SAN MARTIN DE PORRES  : 387   1st Qu.: 57.53  
     CALLAO                : 374   Median : 66.94  
     LIMA                  : 364   Mean   : 66.11  
     COMAS                 : 348   3rd Qu.: 76.01  
     (Other)               :8503   Max.   :107.53  
     NA's                  : 805   NA's   :784     

      uuid_caso              departamento       provincia     
     Length:153961      LIMA       :122357   LIMA    :122357  
     Class :character   CALLAO     : 13259   CALLAO  : 13259  
     Mode  :character   LA LIBERTAD:  3974   TRUJILLO:  3812  
                        PIURA      :  3261   SANTA   :  2817  
                        ANCASH     :  2963   CHICLAYO:  2173  
                        LAMBAYEQUE :  2394   PIURA   :  2076  
                        (Other)    :  5753   (Other) :  7467  
                       distrito     metododx          edad       
     SAN JUAN DE LURIGANCHO:31219   PCR: 44514   Min.   :  0.00  
     LIMA                  :16036   PR :109447   1st Qu.: 50.00  
     SAN MARTIN DE PORRES  :14375                Median : 58.00  
     COMAS                 :11225                Mean   : 57.72  
     CALLAO                :11178                3rd Qu.: 66.00  
     VILLA EL SALVADOR     : 7710                Max.   :101.00  
     (Other)               :62218                                
            sexo        fecha_resultado      uuid_fallecimiento
     Femenino : 29805   Min.   :2020-03-07   Length:153961     
     Masculino:124156   1st Qu.:2020-04-30   Class :character  
                        Median :2020-05-18   Mode  :character  
                        Mean   :2020-05-16                     
                        3rd Qu.:2020-05-30                     
                        Max.   :2020-07-07                     
                                                               
     fecha_fallecimiento    fecha_nac            edad_calc      coincidencias   
     Min.   :2020-03-19   Min.   :1919-01-11   Min.   :  0.39   Min.   : 1.000  
     1st Qu.:2020-06-08   1st Qu.:1953-11-10   1st Qu.: 50.25   1st Qu.: 2.000  
     Median :2020-06-17   Median :1962-01-09   Median : 58.43   Median : 3.000  
     Mean   :2020-06-15   Mean   :1962-03-24   Mean   : 58.23   Mean   : 3.733  
     3rd Qu.:2020-06-27   3rd Qu.:1970-03-12   3rd Qu.: 66.60   3rd Qu.: 5.000  
     Max.   :2020-07-08   Max.   :2020-02-12   Max.   :101.48   Max.   :16.000  
                                                                                

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 36708 casos reconstruídos.

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
