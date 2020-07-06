[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-07-06 15:35:46 UTC

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
     Length:302718      LIMA       :165307   LIMA            :151737  
     Class :character   CALLAO     : 18406   CALLAO          : 17449  
     Mode  :character   PIURA      : 17838   EN INVESTIGACIÓN: 10534  
                        LAMBAYEQUE : 14259   CHICLAYO        :  9596  
                        LA LIBERTAD: 10956   PIURA           :  8460  
                        LORETO     :  9374   TRUJILLO        :  7729  
                        (Other)    : 66578   (Other)         : 97213  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 14774   PCR: 75847   Min.   :  0.00  
     LIMA                  : 13698   PR :226871   1st Qu.: 31.00  
     SAN MARTIN DE PORRES  : 11014                Median : 42.00  
     EN INVESTIGACIÓN      : 10534                Mean   : 43.29  
     CALLAO                : 10178                3rd Qu.: 55.00  
     COMAS                 :  8876                Max.   :120.00  
     (Other)               :233644                NA's   :1576    
            sexo        fecha_resultado     
     Femenino :127431   Min.   :2020-03-06  
     Masculino:172479   1st Qu.:2020-05-09  
     NA's     :  2808   Median :2020-05-26  
                        Mean   :2020-05-25  
                        3rd Qu.:2020-06-12  
                        Max.   :2020-07-04  
                        NA's   :1510        

         uuid           fecha_fallecimiento       edad               sexo     
     Length:10589       Min.   :2020-03-19   Min.   :  0.00   Femenino :3093  
     Class :character   1st Qu.:2020-05-07   1st Qu.: 57.00   Masculino:7496  
     Mode  :character   Median :2020-06-05   Median : 66.00                   
                        Mean   :2020-05-29   Mean   : 65.53                   
                        3rd Qu.:2020-06-19   3rd Qu.: 75.00                   
                        Max.   :2020-07-04   Max.   :107.00                   
                                                                              
       fecha_nac               departamento     provincia   
     Min.   :1912-12-15   LIMA       :4900   LIMA    :4134  
     1st Qu.:1944-06-30   PIURA      : 799   CALLAO  : 503  
     Median :1953-08-01   LAMBAYEQUE : 768   TRUJILLO: 496  
     Mean   :1954-05-31   LA LIBERTAD: 675   PIURA   : 429  
     3rd Qu.:1962-12-13   CALLAO     : 658   CHICLAYO: 322  
     Max.   :2020-02-12   ICA        : 527   (Other) :3367  
     NA's   :783          (Other)    :2262   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 494   Min.   :  0.17  
     SAN MARTIN DE PORRES  : 369   1st Qu.: 57.45  
     CALLAO                : 360   Median : 66.84  
     LIMA                  : 350   Mean   : 66.00  
     COMAS                 : 324   3rd Qu.: 75.92  
     (Other)               :7887   Max.   :107.53  
     NA's                  : 805   NA's   :783     

      uuid_caso              departamento       provincia     
     Length:141362      LIMA       :112676   LIMA    :111570  
     Class :character   CALLAO     : 12190   CALLAO  : 12190  
     Mode  :character   LA LIBERTAD:  3479   TRUJILLO:  3345  
                        PIURA      :  3065   SANTA   :  2570  
                        ANCASH     :  2679   CHICLAYO:  2072  
                        LAMBAYEQUE :  2277   PIURA   :  1966  
                        (Other)    :  4996   (Other) :  7649  
                       distrito     metododx          edad       
     SAN JUAN DE LURIGANCHO:28171   PCR: 40919   Min.   :  0.00  
     LIMA                  :14647   PR :100443   1st Qu.: 49.00  
     SAN MARTIN DE PORRES  :13276                Median : 58.00  
     CALLAO                :10283                Mean   : 57.67  
     COMAS                 :10157                3rd Qu.: 66.00  
     VILLA EL SALVADOR     : 6818                Max.   :100.00  
     (Other)               :58010                                
            sexo        fecha_resultado      uuid_fallecimiento
     Femenino : 27317   Min.   :2020-03-07   Length:141362     
     Masculino:114045   1st Qu.:2020-04-30   Class :character  
                        Median :2020-05-18   Mode  :character  
                        Mean   :2020-05-15                     
                        3rd Qu.:2020-05-29                     
                        Max.   :2020-07-03                     
                                                               
     fecha_fallecimiento    fecha_nac            edad_calc      coincidencias   
     Min.   :2020-03-19   Min.   :1919-12-01   Min.   :  0.39   Min.   : 1.000  
     1st Qu.:2020-06-06   1st Qu.:1953-11-06   1st Qu.: 49.99   1st Qu.: 1.000  
     Median :2020-06-16   Median :1961-12-29   Median : 58.45   Median : 3.000  
     Mean   :2020-06-13   Mean   :1962-04-09   Mean   : 58.18   Mean   : 3.518  
     3rd Qu.:2020-06-25   3rd Qu.:1970-06-11   3rd Qu.: 66.62   3rd Qu.: 5.000  
     Max.   :2020-07-04   Max.   :2020-02-12   Max.   :100.51   Max.   :15.000  
                                                                                

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 35791 casos reconstruídos.

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
