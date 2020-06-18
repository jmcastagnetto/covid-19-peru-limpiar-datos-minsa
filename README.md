[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-06-18 17:30:23 UTC

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
     Length:240908      LIMA       :138203   LIMA            :129104  
     Class :character   CALLAO     : 16224   CALLAO          : 15368  
     Mode  :character   PIURA      : 14413   CHICLAYO        :  7855  
                        LAMBAYEQUE : 11699   EN INVESTIGACIÓN:  7587  
                        LORETO     :  7849   PIURA           :  6906  
                        LA LIBERTAD:  7714   CORONEL PORTILLO:  6099  
                        (Other)    : 44806   (Other)         : 67989  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 12443   PCR: 57217   Min.   :  0.00  
     LIMA                  : 11858   PR :183691   1st Qu.: 30.00  
     SAN MARTIN DE PORRES  :  9608                Median : 42.00  
     CALLAO                :  9181                Mean   : 43.06  
     EN INVESTIGACIÓN      :  7587                3rd Qu.: 54.00  
     COMAS                 :  7298                Max.   :120.00  
     (Other)               :182933                NA's   :1538    
            sexo        fecha_resultado     
     Femenino : 98806   Min.   :2020-03-06  
     Masculino:139296   1st Qu.:2020-05-05  
     NA's     :  2806   Median :2020-05-21  
                        Mean   :2020-05-17  
                        3rd Qu.:2020-06-01  
                        Max.   :2020-06-16  
                        NA's   :1339        

    summary(fallecimientos)

         uuid           fecha_fallecimiento       edad              sexo     
     Length:7257        Min.   :2020-03-19   Min.   :  0.0   Femenino :2115  
     Class :character   1st Qu.:2020-04-30   1st Qu.: 57.0   Masculino:5142  
     Mode  :character   Median :2020-05-19   Median : 66.0                   
                        Mean   :2020-05-17   Mean   : 65.2                   
                        3rd Qu.:2020-06-06   3rd Qu.: 75.0                   
                        Max.   :2020-06-16   Max.   :101.0                   
                                                                             
       fecha_nac               departamento     provincia   
     Min.   :1915-06-19   LIMA       :3278   LIMA    :2697  
     1st Qu.:1944-11-24   LAMBAYEQUE : 680   PIURA   : 356  
     Median :1953-12-18   PIURA      : 651   CALLAO  : 343  
     Mean   :1954-10-06   CALLAO     : 498   TRUJILLO: 275  
     3rd Qu.:1963-06-14   ANCASH     : 394   CHICLAYO: 260  
     Max.   :2020-02-08   LA LIBERTAD: 384   (Other) :1988  
     NA's   :748          (Other)    :1372   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 313   Min.   :  0.17  
     CALLAO                : 271   1st Qu.: 56.94  
     SAN MARTIN DE PORRES  : 260   Median : 66.39  
     LIMA                  : 239   Mean   : 65.62  
     CHIMBOTE              : 206   3rd Qu.: 75.45  
     (Other)               :5163   Max.   :104.86  
     NA's                  : 805   NA's   :748     

    summary(reconstruido)

      uuid_caso              departamento      provincia    
     Length:73310       LIMA       :58465   LIMA    :57981  
     Class :character   CALLAO     : 6555   CALLAO  : 6555  
     Mode  :character   PIURA      : 2076   SANTA   : 1560  
                        ANCASH     : 1599   PIURA   : 1300  
                        LA LIBERTAD: 1332   TRUJILLO: 1279  
                        LAMBAYEQUE : 1282   CHICLAYO: 1139  
                        (Other)    : 2001   (Other) : 3496  
                       distrito     metododx         edad               sexo      
     SAN JUAN DE LURIGANCHO:14136   PCR:21032   Min.   :  0.00   Femenino :14123  
     SAN MARTIN DE PORRES  : 7624   PR :52278   1st Qu.: 49.00   Masculino:59187  
     LIMA                  : 7345               Median : 58.00                    
     CALLAO                : 5406               Mean   : 57.42                    
     COMAS                 : 4831               3rd Qu.: 66.00                    
     VILLA EL SALVADOR     : 3753               Max.   :100.00                    
     (Other)               :30215                                                 
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:73310       Min.   :2020-03-19  
     1st Qu.:2020-04-27   Class :character   1st Qu.:2020-05-31  
     Median :2020-05-13   Mode  :character   Median :2020-06-07  
     Mean   :2020-05-10                      Mean   :2020-06-03  
     3rd Qu.:2020-05-26                      3rd Qu.:2020-06-12  
     Max.   :2020-06-15                      Max.   :2020-06-16  
                                                                 
       fecha_nac            edad_calc      coincidencias   
     Min.   :1919-12-01   Min.   :  0.57   Min.   : 1.000  
     1st Qu.:1954-03-30   1st Qu.: 49.99   1st Qu.: 1.000  
     Median :1962-04-01   Median : 58.19   Median : 2.000  
     Mean   :1962-06-24   Mean   : 57.94   Mean   : 2.472  
     3rd Qu.:1970-06-11   3rd Qu.: 66.20   3rd Qu.: 3.000  
     Max.   :2019-11-10   Max.   :100.51   Max.   :10.000  
                                                           

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 27089 casos reconstruídos.

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
