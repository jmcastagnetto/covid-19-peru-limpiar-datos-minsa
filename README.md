[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-06-16 19:09:21 UTC

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

Información relevante
---------------------

Fuentes de datos:

-   <a href="https://www.datosabiertos.gob.pe/dataset/casos-positivos-por-covid-19-ministerio-de-salud-minsa" class="uri">https://www.datosabiertos.gob.pe/dataset/casos-positivos-por-covid-19-ministerio-de-salud-minsa</a>
-   <a href="https://www.datosabiertos.gob.pe/dataset/fallecidos-por-covid-19-ministerio-de-salud-minsa" class="uri">https://www.datosabiertos.gob.pe/dataset/fallecidos-por-covid-19-ministerio-de-salud-minsa</a>

Luego del primer paso de limpieza de datos:

    summary(casos)

         uuid                departamento               provincia     
     Length:232992      LIMA       :134008   LIMA            :125524  
     Class :character   CALLAO     : 15955   CALLAO          : 15126  
     Mode  :character   PIURA      : 14046   CHICLAYO        :  7658  
                        LAMBAYEQUE : 11394   EN INVESTIGACIÓN:  6934  
                        LORETO     :  7737   PIURA           :  6752  
                        LA LIBERTAD:  7391   CORONEL PORTILLO:  5925  
                        (Other)    : 42461   (Other)         : 65073  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 12089   PCR: 54803   Min.   :  0.00  
     LIMA                  : 11597   PR :178189   1st Qu.: 30.00  
     SAN MARTIN DE PORRES  :  9318                Median : 42.00  
     CALLAO                :  9087                Mean   : 43.01  
     COMAS                 :  7086                3rd Qu.: 54.00  
     EN INVESTIGACIÓN      :  6934                Max.   :120.00  
     (Other)               :176881                NA's   :1530    
            sexo        fecha_resultado     
     Femenino : 95192   Min.   :2020-03-06  
     Masculino:134997   1st Qu.:2020-05-04  
     NA's     :  2803   Median :2020-05-20  
                        Mean   :2020-05-17  
                        3rd Qu.:2020-05-30  
                        Max.   :2020-06-14  
                        NA's   :1339        

    summary(fallecimientos)

         uuid           fecha_fallecimiento       edad               sexo     
     Length:6860        Min.   :2020-03-19   Min.   :  0.00   Femenino :1989  
     Class :character   1st Qu.:2020-04-29   1st Qu.: 57.00   Masculino:4871  
     Mode  :character   Median :2020-05-16   Median : 66.00                   
                        Mean   :2020-05-15   Mean   : 65.21                   
                        3rd Qu.:2020-06-04   3rd Qu.: 75.00                   
                        Max.   :2020-06-14   Max.   :100.00                   
                                                                              
       fecha_nac              departamento     provincia   
     Min.   :1915-06-19   LIMA      :3083   LIMA    :2524  
     1st Qu.:1944-11-25   LAMBAYEQUE: 668   PIURA   : 346  
     Median :1953-12-10   PIURA     : 631   CALLAO  : 309  
     Mean   :1954-10-03   CALLAO    : 464   CHICLAYO: 253  
     3rd Qu.:1963-06-20   ANCASH    : 378   TRUJILLO: 247  
     Max.   :2020-02-08   ICA       : 353   (Other) :1843  
     NA's   :748          (Other)   :1283   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 292   Min.   :  0.17  
     CALLAO                : 249   1st Qu.: 56.93  
     SAN MARTIN DE PORRES  : 246   Median : 66.42  
     LIMA                  : 229   Mean   : 65.62  
     CHIMBOTE              : 202   3rd Qu.: 75.44  
     (Other)               :4837   Max.   :104.86  
     NA's                  : 805   NA's   :748     

    summary(reconstruido)

      uuid_caso              departamento      provincia    
     Length:64926       LIMA       :52294   LIMA    :51889  
     Class :character   CALLAO     : 5189   CALLAO  : 5189  
     Mode  :character   PIURA      : 1988   SANTA   : 1435  
                        ANCASH     : 1467   PIURA   : 1250  
                        LA LIBERTAD: 1182   TRUJILLO: 1141  
                        LAMBAYEQUE : 1180   CHICLAYO: 1053  
                        (Other)    : 1626   (Other) : 2969  
                       distrito     metododx         edad               sexo      
     SAN JUAN DE LURIGANCHO:12750   PCR:18608   Min.   :  0.00   Femenino :12376  
     SAN MARTIN DE PORRES  : 6886   PR :46318   1st Qu.: 49.00   Masculino:52550  
     LIMA                  : 6699               Median : 57.00                    
     COMAS                 : 4403               Mean   : 57.34                    
     CALLAO                : 4137               3rd Qu.: 66.00                    
     VILLA EL SALVADOR     : 3196               Max.   :100.00                    
     (Other)               :26855                                                 
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:64926       Min.   :2020-03-19  
     1st Qu.:2020-04-27   Class :character   1st Qu.:2020-05-30  
     Median :2020-05-12   Mode  :character   Median :2020-06-06  
     Mean   :2020-05-09                      Mean   :2020-06-01  
     3rd Qu.:2020-05-25                      3rd Qu.:2020-06-10  
     Max.   :2020-06-13                      Max.   :2020-06-14  
                                                                 
       fecha_nac            edad_calc      coincidencias   
     Min.   :1919-12-01   Min.   :  0.57   Min.   : 1.000  
     1st Qu.:1954-03-29   1st Qu.: 49.98   1st Qu.: 1.000  
     Median :1962-07-24   Median : 57.80   Median : 2.000  
     Mean   :1962-07-20   Mean   : 57.87   Mean   : 2.355  
     3rd Qu.:1970-06-13   3rd Qu.: 66.15   3rd Qu.: 3.000  
     Max.   :2019-11-10   Max.   :100.51   Max.   :10.000  
                                                           

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 25079 casos reconstruídos.

    ## [1] "es_PE.utf8"

![“Positivos por día. MINSA”](positivos-por-dia-minsa.png)

![“Positivos acumulados. MINSA”](positivos-acumulados-minsa.png)

![“Fallecimientos por día. MINSA”](fallecimientos-por-dia-minsa.png)

![“Fallecimientos acumulados.
MINSA”](fallecimientos-acumulados-minsa.png)

![“Distribución de tiempos desde detección a fallecimiento, por número
de registros
coincidentes”](deteccion-fallecimiento-por-coincidentes.png)

Los archivos “limpios” son:

-   [datos/fallecidos\_covid-utf8-limpio.csv](datos/fallecidos_covid-utf8-limpio.csv)
-   [datos/positivos\_covid-utf8-limpio.csv](datos/positivos_covid-utf8-limpio.csv)

Y algunos reconstruidos a partir de los anteriores:

-   [datos/casos\_fallecimientos\_reconstruccion\_posible.csv](datos/casos_fallecimientos_reconstruccion_posible.csv)
-   [datos/timeseries-casos.csv](datos/timeseries-casos.csv)
-   [datos/timeseries-casos-lugares.csv](datos/timeseries-casos-lugares.csv)
-   [datos/timeseries-fallecimientos.csv](datos/timeseries-fallecimientos.csv)
-   [datos/timeseries-fallecimientos-lugares.csv](datos/timeseries-fallecimientos-lugares.csv)
