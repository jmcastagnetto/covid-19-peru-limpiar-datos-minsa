[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-08-16 05:14:31 UTC

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

### Casos positivos

         uuid                departamento               provincia     
     Length:507996      LIMA       :234183   LIMA            :223163  
     Class :character   CALLAO     : 23945   EN INVESTIGACIÓN: 24302  
     Mode  :character   PIURA      : 23467   CALLAO          : 22715  
                        AREQUIPA   : 21692   AREQUIPA        : 19256  
                        LIMA REGION: 20346   TRUJILLO        : 13326  
                        LAMBAYEQUE : 19369   CHICLAYO        : 12964  
                        (Other)    :164994   (Other)         :192270  
                       distrito      metododx          edad       
     EN INVESTIGACIÓN      : 24302   PCR:129564   Min.   :  0.00  
     SAN JUAN DE LURIGANCHO: 22255   PR :378432   1st Qu.: 30.00  
     LIMA                  : 19380                Median : 42.00  
     SAN MARTIN DE PORRES  : 15404                Mean   : 43.23  
     COMAS                 : 13615                3rd Qu.: 55.00  
     CALLAO                : 12688                Max.   :120.00  
     (Other)               :400352                NA's   :61      
            sexo        fecha_resultado     
     Femenino :227825   Min.   :2020-03-06  
     Masculino:280171   1st Qu.:2020-05-22  
                        Median :2020-06-19  
                        Mean   :2020-06-19  
                        3rd Qu.:2020-07-23  
                        Max.   :2020-08-12  
                                            

### Fallecimientos

         uuid           fecha_fallecimiento       edad               sexo      
     Length:25648       Min.   :2020-03-18   Min.   :  0.00   Femenino : 7579  
     Class :character   1st Qu.:2020-05-17   1st Qu.: 57.00   Masculino:18069  
     Mode  :character   Median :2020-06-12   Median : 66.00                    
                        Mean   :2020-06-11   Mean   : 65.67                    
                        3rd Qu.:2020-07-08   3rd Qu.: 76.00                    
                        Max.   :2020-08-12   Max.   :107.00                    
                                                                               
       fecha_nac               departamento      provincia   
     Min.   :1912-12-15   LIMA       :11365   LIMA    :9977  
     1st Qu.:1944-06-27   LA LIBERTAD: 1914   TRUJILLO:1355  
     Median :1953-08-13   PIURA      : 1722   CALLAO  :1284  
     Mean   :1954-04-30   LAMBAYEQUE : 1530   CHICLAYO: 930  
     3rd Qu.:1962-12-22   CALLAO     : 1445   AREQUIPA: 883  
     Max.   :2020-02-25   ICA        : 1347   (Other) :9940  
     NA's   :4912         (Other)    : 6325   NA's    :1279  
                       distrito       edad_calc     
     SAN JUAN DE LURIGANCHO: 1160   Min.   :  0.17  
     LIMA                  :  895   1st Qu.: 57.46  
     CALLAO                :  874   Median : 66.84  
     SAN MARTIN DE PORRES  :  710   Mean   : 66.12  
     VILLA EL SALVADOR     :  695   3rd Qu.: 75.95  
     (Other)               :20565   Max.   :107.53  
     NA's                  :  749   NA's   :4912    

### Coincidencias reconstruídas

      uuid_caso              departamento       provincia     
     Length:338880      LIMA       :268135   LIMA    :268135  
     Class :character   CALLAO     : 24437   CALLAO  : 24437  
     Mode  :character   LA LIBERTAD:  9061   TRUJILLO:  8674  
                        LAMBAYEQUE :  6490   CHICLAYO:  6058  
                        ANCASH     :  6146   SANTA   :  5738  
                        PIURA      :  5716   AREQUIPA:  4203  
                        (Other)    : 18895   (Other) : 21635  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 69492   PCR:102465   Min.   :  0.00  
     LIMA                  : 33023   PR :236415   1st Qu.: 50.00  
     SAN MARTIN DE PORRES  : 28355                Median : 58.00  
     COMAS                 : 22983                Mean   : 57.73  
     CALLAO                : 20863                3rd Qu.: 66.00  
     ATE                   : 17281                Max.   :101.00  
     (Other)               :146883                                
            sexo        fecha_resultado      uuid_fallecimiento
     Femenino : 67635   Min.   :2020-03-07   Length:338880     
     Masculino:271245   1st Qu.:2020-05-01   Class :character  
                        Median :2020-05-21   Mode  :character  
                        Mean   :2020-05-22                     
                        3rd Qu.:2020-06-08                     
                        Max.   :2020-08-10                     
                                                               
     fecha_fallecimiento    fecha_nac            edad_calc      coincidencias   
     Min.   :2020-03-19   Min.   :1919-01-11   Min.   :  0.26   Min.   : 1.000  
     1st Qu.:2020-06-11   1st Qu.:1954-01-09   1st Qu.: 50.37   1st Qu.: 2.000  
     Median :2020-07-03   Median :1961-11-29   Median : 58.60   Median : 4.000  
     Mean   :2020-06-30   Mean   :1962-04-05   Mean   : 58.24   Mean   : 5.793  
     3rd Qu.:2020-07-24   3rd Qu.:1970-02-08   3rd Qu.: 66.51   3rd Qu.: 8.000  
     Max.   :2020-08-11   Max.   :2020-02-25   Max.   :101.48   Max.   :29.000  
                                                                                

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 57539 casos reconstruídos.

Gráficos
--------

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
