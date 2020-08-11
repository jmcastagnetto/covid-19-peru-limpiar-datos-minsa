[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-08-10 23:59:57 UTC

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
     Length:478024      LIMA       :222840   LIMA            :212997  
     Class :character   CALLAO     : 23005   EN INVESTIGACIÓN: 22240  
     Mode  :character   PIURA      : 22641   CALLAO          : 21816  
                        AREQUIPA   : 19579   AREQUIPA        : 17462  
                        LIMA REGION: 19469   TRUJILLO        : 12614  
                        LAMBAYEQUE : 18775   CHICLAYO        : 12561  
                        (Other)    :151715   (Other)         :178334  
                       distrito      metododx          edad       
     EN INVESTIGACIÓN      : 22240   PCR:123141   Min.   :  0.00  
     SAN JUAN DE LURIGANCHO: 21247   PR :354883   1st Qu.: 31.00  
     LIMA                  : 18437                Median : 42.00  
     SAN MARTIN DE PORRES  : 14789                Mean   : 43.28  
     COMAS                 : 13024                3rd Qu.: 55.00  
     CALLAO                : 12157                Max.   :120.00  
     (Other)               :376130                NA's   :54      
            sexo        fecha_resultado     
     Femenino :213013   Min.   :2020-03-06  
     Masculino:265011   1st Qu.:2020-05-21  
                        Median :2020-06-15  
                        Mean   :2020-06-16  
                        3rd Qu.:2020-07-18  
                        Max.   :2020-08-08  
                                            

         uuid           fecha_fallecimiento       edad               sexo      
     Length:21072       Min.   :2020-03-18   Min.   :  0.00   Femenino : 6158  
     Class :character   1st Qu.:2020-05-12   1st Qu.: 57.00   Masculino:14914  
     Mode  :character   Median :2020-06-12   Median : 66.00                    
                        Mean   :2020-06-10   Mean   : 65.64                    
                        3rd Qu.:2020-07-09   3rd Qu.: 75.00                    
                        Max.   :2020-08-08   Max.   :107.00                    
                                                                               
       fecha_nac               departamento     provincia   
     Min.   :1912-12-15   LIMA       :9912   LIMA    :8663  
     1st Qu.:1944-06-28   LA LIBERTAD:1424   TRUJILLO:1021  
     Median :1953-08-11   PIURA      :1318   CALLAO  : 937  
     Mean   :1954-04-28   LAMBAYEQUE :1260   AREQUIPA: 824  
     3rd Qu.:1962-12-15   CALLAO     :1098   CHICLAYO: 710  
     Max.   :2020-02-12   ICA        : 983   (Other) :7639  
     NA's   :1358         (Other)    :5077   NA's    :1278  
                       distrito       edad_calc     
     SAN JUAN DE LURIGANCHO: 1038   Min.   :  0.17  
     LIMA                  :  735   1st Qu.: 57.47  
     CALLAO                :  631   Median : 66.84  
     SAN MARTIN DE PORRES  :  612   Mean   : 66.12  
     COMAS                 :  587   3rd Qu.: 75.95  
     (Other)               :16721   Max.   :107.53  
     NA's                  :  748   NA's   :1358    

      uuid_caso              departamento       provincia     
     Length:310508      LIMA       :244948   LIMA    :244948  
     Class :character   CALLAO     : 22852   CALLAO  : 22852  
     Mode  :character   LA LIBERTAD:  8438   TRUJILLO:  8097  
                        LAMBAYEQUE :  6253   CHICLAYO:  5833  
                        ANCASH     :  5957   SANTA   :  5597  
                        PIURA      :  5530   AREQUIPA:  3720  
                        (Other)    : 16530   (Other) : 19461  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 63590   PCR: 93746   Min.   :  0.00  
     LIMA                  : 30215   PR :216762   1st Qu.: 50.00  
     SAN MARTIN DE PORRES  : 25859                Median : 58.00  
     COMAS                 : 21318                Mean   : 57.69  
     CALLAO                : 19477                3rd Qu.: 66.00  
     VILLA EL SALVADOR     : 16037                Max.   :101.00  
     (Other)               :134012                                
            sexo        fecha_resultado      uuid_fallecimiento
     Femenino : 61280   Min.   :2020-03-07   Length:310508     
     Masculino:249228   1st Qu.:2020-04-30   Class :character  
                        Median :2020-05-20   Mode  :character  
                        Mean   :2020-05-20                     
                        3rd Qu.:2020-06-06                     
                        Max.   :2020-08-05                     
                                                               
     fecha_fallecimiento    fecha_nac            edad_calc      coincidencias   
     Min.   :2020-03-19   Min.   :1919-01-11   Min.   :  0.26   Min.   : 1.000  
     1st Qu.:2020-06-10   1st Qu.:1954-01-28   1st Qu.: 50.35   1st Qu.: 2.000  
     Median :2020-06-29   Median :1962-01-06   Median : 58.45   Median : 4.000  
     Mean   :2020-06-27   Mean   :1962-04-14   Mean   : 58.20   Mean   : 5.599  
     3rd Qu.:2020-07-19   3rd Qu.:1970-02-17   3rd Qu.: 66.37   3rd Qu.: 8.000  
     Max.   :2020-08-06   Max.   :2020-02-12   Max.   :101.48   Max.   :26.000  
                                                                                

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 53351 casos reconstruídos.

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
