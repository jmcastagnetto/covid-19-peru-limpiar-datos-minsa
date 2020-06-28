[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-06-28 17:01:30 UTC

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
     Length:275989      LIMA       :154713   LIMA            :142711  
     Class :character   CALLAO     : 17747   CALLAO          : 16821  
     Mode  :character   PIURA      : 16461   EN INVESTIGACIÓN:  8914  
                        LAMBAYEQUE : 13259   CHICLAYO        :  8889  
                        LA LIBERTAD:  9490   PIURA           :  7728  
                        LORETO     :  8835   CORONEL PORTILLO:  6833  
                        (Other)    : 55484   (Other)         : 84093  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 13853   PCR: 68681   Min.   :  0.00  
     LIMA                  : 12960   PR :207308   1st Qu.: 31.00  
     SAN MARTIN DE PORRES  : 10431                Median : 42.00  
     CALLAO                :  9940                Mean   : 43.18  
     EN INVESTIGACIÓN      :  8914                3rd Qu.: 55.00  
     COMAS                 :  8184                Max.   :120.00  
     (Other)               :211707                NA's   :1563    
            sexo        fecha_resultado     
     Femenino :114984   Min.   :2020-03-06  
     Masculino:158197   1st Qu.:2020-05-07  
     NA's     :  2808   Median :2020-05-24  
                        Mean   :2020-05-22  
                        3rd Qu.:2020-06-08  
                        Max.   :2020-06-26  
                        NA's   :1510        

         uuid           fecha_fallecimiento       edad               sexo     
     Length:9135        Min.   :2020-03-19   Min.   :  0.00   Femenino :2645  
     Class :character   1st Qu.:2020-05-04   1st Qu.: 57.00   Masculino:6490  
     Mode  :character   Median :2020-05-31   Median : 66.00                   
                        Mean   :2020-05-24   Mean   : 65.41                   
                        3rd Qu.:2020-06-14   3rd Qu.: 75.00                   
                        Max.   :2020-06-26   Max.   :107.00                   
                                                                              
       fecha_nac               departamento     provincia   
     Min.   :1912-12-15   LIMA       :4228   LIMA    :3547  
     1st Qu.:1944-08-13   PIURA      : 737   CALLAO  : 441  
     Median :1953-10-28   LAMBAYEQUE : 731   PIURA   : 403  
     Mean   :1954-07-17   CALLAO     : 596   TRUJILLO: 396  
     3rd Qu.:1963-01-23   LA LIBERTAD: 538   CHICLAYO: 295  
     Max.   :2020-02-08   ICA        : 456   (Other) :2715  
     NA's   :770          (Other)    :1849   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 415   Min.   :  0.17  
     CALLAO                : 335   1st Qu.: 57.33  
     SAN MARTIN DE PORRES  : 333   Median : 66.62  
     LIMA                  : 304   Mean   : 65.86  
     COMAS                 : 283   3rd Qu.: 75.80  
     (Other)               :6660   Max.   :107.53  
     NA's                  : 805   NA's   :770     

      uuid_caso              departamento      provincia    
     Length:112491      LIMA       :89753   LIMA    :88930  
     Class :character   CALLAO     :10446   CALLAO  :10446  
     Mode  :character   PIURA      : 2715   TRUJILLO: 2185  
                        LA LIBERTAD: 2278   SANTA   : 2086  
                        ANCASH     : 2156   PIURA   : 1741  
                        LAMBAYEQUE : 1855   CHICLAYO: 1674  
                        (Other)    : 3288   (Other) : 5429  
                       distrito     metododx         edad               sexo      
     SAN JUAN DE LURIGANCHO:21369   PCR:32533   Min.   :  0.00   Femenino :20958  
     SAN MARTIN DE PORRES  :11571   PR :79958   1st Qu.: 50.00   Masculino:91533  
     LIMA                  :11325               Median : 58.00                    
     CALLAO                : 8840               Mean   : 57.68                    
     COMAS                 : 8189               3rd Qu.: 66.00                    
     VILLA EL SALVADOR     : 5613               Max.   :100.00                    
     (Other)               :45584                                                 
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:112491      Min.   :2020-03-19  
     1st Qu.:2020-04-29   Class :character   1st Qu.:2020-06-04  
     Median :2020-05-16   Mode  :character   Median :2020-06-12  
     Mean   :2020-05-13                      Mean   :2020-06-09  
     3rd Qu.:2020-05-27                      3rd Qu.:2020-06-19  
     Max.   :2020-06-25                      Max.   :2020-06-26  
                                                                 
       fecha_nac            edad_calc      coincidencias   
     Min.   :1919-12-01   Min.   :  0.57   Min.   : 1.000  
     1st Qu.:1954-01-08   1st Qu.: 50.38   1st Qu.: 1.000  
     Median :1961-12-13   Median : 58.53   Median : 3.000  
     Mean   :1962-03-27   Mean   : 58.20   Mean   : 3.136  
     3rd Qu.:1970-01-29   3rd Qu.: 66.44   3rd Qu.: 4.000  
     Max.   :2019-11-10   Max.   :100.51   Max.   :13.000  
                                                           

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 32007 casos reconstruídos.

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
