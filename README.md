[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-07-23 21:10:54 UTC

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
     Length:366550      LIMA       :181421   LIMA            :175504  
     Class :character   CALLAO     : 20062   CALLAO          : 19027  
     Mode  :character   PIURA      : 19949   EN INVESTIGACIÓN: 14310  
                        LAMBAYEQUE : 16023   CHICLAYO        : 10774  
                        LIMA REGION: 14538   PIURA           :  9878  
                        LA LIBERTAD: 13523   TRUJILLO        :  9806  
                        (Other)    :101034   (Other)         :127251  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 17313   PCR: 98951   Min.   :  0.00  
     LIMA                  : 15693   PR :267599   1st Qu.: 31.00  
     EN INVESTIGACIÓN      : 14310                Median : 42.00  
     SAN MARTIN DE PORRES  : 12626                Mean   : 43.37  
     CALLAO                : 10847                3rd Qu.: 55.00  
     COMAS                 : 10702                Max.   :120.00  
     (Other)               :285059                NA's   :790     
            sexo        fecha_resultado     
     Femenino :157651   Min.   :2020-03-06  
     Masculino:206901   1st Qu.:2020-05-14  
     NA's     :  1998   Median :2020-06-02  
                        Mean   :2020-06-02  
                        3rd Qu.:2020-06-25  
                        Max.   :2020-07-21  
                        NA's   :522         

         uuid           fecha_fallecimiento       edad               sexo     
     Length:13767       Min.   :2020-03-19   Min.   :  0.00   Femenino :4051  
     Class :character   1st Qu.:2020-05-16   1st Qu.: 57.00   Masculino:9716  
     Mode  :character   Median :2020-06-13   Median : 66.00                   
                        Mean   :2020-06-08   Mean   : 65.71                   
                        3rd Qu.:2020-07-02   3rd Qu.: 76.00                   
                        Max.   :2020-07-21   Max.   :107.00                   
                                                                              
       fecha_nac               departamento     provincia   
     Min.   :1912-12-15   LIMA       :6414   LIMA    :5392  
     1st Qu.:1944-05-30   LA LIBERTAD: 939   TRUJILLO: 684  
     Median :1953-06-28   PIURA      : 892   CALLAO  : 626  
     Mean   :1954-03-27   LAMBAYEQUE : 833   AREQUIPA: 556  
     3rd Qu.:1962-11-17   CALLAO     : 786   PIURA   : 474  
     Max.   :2020-02-12   ICA        : 704   (Other) :4697  
     NA's   :795          (Other)    :3199   NA's    :1338  
                       distrito       edad_calc     
     SAN JUAN DE LURIGANCHO:  634   Min.   :  0.17  
     SAN MARTIN DE PORRES  :  461   1st Qu.: 57.58  
     COMAS                 :  428   Median : 66.97  
     LIMA                  :  420   Mean   : 66.21  
     CALLAO                :  419   3rd Qu.: 76.04  
     (Other)               :10600   Max.   :107.53  
     NA's                  :  805   NA's   :795     

      uuid_caso              departamento       provincia     
     Length:207209      LIMA       :164851   LIMA    :164851  
     Class :character   CALLAO     : 16693   CALLAO  : 16693  
     Mode  :character   LA LIBERTAD:  5718   TRUJILLO:  5494  
                        PIURA      :  3807   SANTA   :  3514  
                        ANCASH     :  3783   CHICLAYO:  2765  
                        LAMBAYEQUE :  3010   PIURA   :  2479  
                        (Other)    :  9347   (Other) : 11413  
                       distrito     metododx          edad       
     SAN JUAN DE LURIGANCHO:41530   PCR: 61248   Min.   :  0.00  
     LIMA                  :20193   PR :145961   1st Qu.: 50.00  
     SAN MARTIN DE PORRES  :19482                Median : 58.00  
     COMAS                 :15694                Mean   : 57.74  
     CALLAO                :13903                3rd Qu.: 66.00  
     VILLA EL SALVADOR     :10421                Max.   :101.00  
     (Other)               :85986                                
            sexo        fecha_resultado      uuid_fallecimiento
     Femenino : 40227   Min.   :2020-03-07   Length:207209     
     Masculino:166982   1st Qu.:2020-05-02   Class :character  
                        Median :2020-05-21   Mode  :character  
                        Mean   :2020-05-19                     
                        3rd Qu.:2020-06-04                     
                        Max.   :2020-07-20                     
                                                               
     fecha_fallecimiento    fecha_nac            edad_calc      coincidencias   
     Min.   :2020-03-19   Min.   :1919-01-11   Min.   :  0.39   Min.   : 1.000  
     1st Qu.:2020-06-11   1st Qu.:1953-12-29   1st Qu.: 50.11   1st Qu.: 2.000  
     Median :2020-06-25   Median :1962-01-13   Median : 58.43   Median : 3.000  
     Mean   :2020-06-23   Mean   :1962-03-26   Mean   : 58.24   Mean   : 4.311  
     3rd Qu.:2020-07-09   3rd Qu.:1970-05-01   3rd Qu.: 66.46   3rd Qu.: 6.000  
     Max.   :2020-07-21   Max.   :2020-02-12   Max.   :101.48   Max.   :18.000  
                                                                                

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 43077 casos reconstruídos.

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
