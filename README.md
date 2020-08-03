[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-08-03 20:39:01 UTC

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
     Length:428850      LIMA       :204806   LIMA            :196734  
     Class :character   CALLAO     : 21606   CALLAO          : 20480  
     Mode  :character   PIURA      : 21494   EN INVESTIGACIÓN: 18657  
                        LIMA REGION: 17762   AREQUIPA        : 13637  
                        LAMBAYEQUE : 17584   CHICLAYO        : 11796  
                        LA LIBERTAD: 15764   TRUJILLO        : 11451  
                        (Other)    :129834   (Other)         :156095  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 19672   PCR:113766   Min.   :  0.00  
     EN INVESTIGACIÓN      : 18657   PR :315084   1st Qu.: 31.00  
     LIMA                  : 17284                Median : 42.00  
     SAN MARTIN DE PORRES  : 13826                Mean   : 43.33  
     COMAS                 : 11969                3rd Qu.: 55.00  
     CALLAO                : 11485                Max.   :120.00  
     (Other)               :335957                NA's   :25      
            sexo        fecha_resultado     
     Femenino :188467   Min.   :2020-01-01  
     Masculino:240383   1st Qu.:2020-05-07  
                        Median :2020-05-29  
                        Mean   :2020-05-31  
                        3rd Qu.:2020-06-29  
                        Max.   :2020-08-01  
                        NA's   :2           

         uuid           fecha_fallecimiento       edad               sexo      
     Length:19614       Min.   :2020-03-18   Min.   :  0.00   Femenino : 5739  
     Class :character   1st Qu.:2020-05-10   1st Qu.: 57.00   Masculino:13875  
     Mode  :character   Median :2020-06-10   Median : 66.00                    
                        Mean   :2020-06-07   Mean   : 65.62                    
                        3rd Qu.:2020-07-04   3rd Qu.: 75.00                    
                        Max.   :2020-08-01   Max.   :107.00                    
                                                                               
       fecha_nac               departamento     provincia   
     Min.   :1912-12-15   LIMA       :9259   LIMA    :8004  
     1st Qu.:1944-07-07   LA LIBERTAD:1363   TRUJILLO: 986  
     Median :1953-08-13   PIURA      :1268   CALLAO  : 881  
     Mean   :1954-04-27   LAMBAYEQUE :1226   AREQUIPA: 715  
     3rd Qu.:1962-11-29   CALLAO     :1041   CHICLAYO: 684  
     Max.   :2020-02-12   ICA        : 866   (Other) :7006  
     NA's   :934          (Other)    :4591   NA's    :1338  
                       distrito       edad_calc     
     SAN JUAN DE LURIGANCHO:  953   Min.   :  0.17  
     LIMA                  :  681   1st Qu.: 57.52  
     CALLAO                :  581   Median : 66.83  
     SAN MARTIN DE PORRES  :  579   Mean   : 66.12  
     VILLA EL SALVADOR     :  555   3rd Qu.: 75.92  
     (Other)               :15460   Max.   :107.53  
     NA's                  :  805   NA's   :934     

      uuid_caso              departamento       provincia     
     Length:329858      LIMA       :256189   LIMA    :256189  
     Class :character   CALLAO     : 25129   CALLAO  : 25129  
     Mode  :character   LA LIBERTAD:  9782   TRUJILLO:  9433  
                        LAMBAYEQUE :  7691   CHICLAYO:  7171  
                        PIURA      :  6886   SANTA   :  6035  
                        ANCASH     :  6458   PIURA   :  3868  
                        (Other)    : 17723   (Other) : 22033  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 65175   PCR:101592   Min.   :  0.00  
     LIMA                  : 32204   PR :228266   1st Qu.: 50.00  
     SAN MARTIN DE PORRES  : 27124                Median : 58.00  
     COMAS                 : 22414                Mean   : 57.85  
     CALLAO                : 21170                3rd Qu.: 66.00  
     VILLA EL SALVADOR     : 17237                Max.   :101.00  
     (Other)               :144534                                
            sexo        fecha_resultado      uuid_fallecimiento
     Femenino : 65458   Min.   :2020-01-01   Length:329858     
     Masculino:264400   1st Qu.:2020-04-21   Class :character  
                        Median :2020-05-10   Mode  :character  
                        Mean   :2020-05-11                     
                        3rd Qu.:2020-05-29                     
                        Max.   :2020-07-31                     
                                                               
     fecha_fallecimiento    fecha_nac            edad_calc      coincidencias   
     Min.   :2020-03-19   Min.   :1919-01-11   Min.   :  0.26   Min.   : 1.000  
     1st Qu.:2020-06-05   1st Qu.:1953-12-07   1st Qu.: 50.44   1st Qu.: 2.000  
     Median :2020-06-24   Median :1961-11-11   Median : 58.61   Median : 4.000  
     Mean   :2020-06-21   Mean   :1962-02-09   Mean   : 58.36   Mean   : 5.713  
     3rd Qu.:2020-07-15   3rd Qu.:1970-01-02   3rd Qu.: 66.54   3rd Qu.: 8.000  
     Max.   :2020-08-01   Max.   :2020-02-12   Max.   :101.48   Max.   :26.000  
                                                                                

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 52455 casos reconstruídos.

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
