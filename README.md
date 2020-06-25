[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-06-25 18:22:52 UTC

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
     Length:264689      LIMA       :149377   LIMA            :138045  
     Class :character   CALLAO     : 17372   CALLAO          : 16473  
     Mode  :character   PIURA      : 15863   EN INVESTIGACIÓN:  9628  
                        LAMBAYEQUE : 12709   CHICLAYO        :  8549  
                        LA LIBERTAD:  8849   PIURA           :  7509  
                        LORETO     :  8681   CORONEL PORTILLO:  6619  
                        (Other)    : 51838   (Other)         : 77866  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 13435   PCR: 64401   Min.   :  0.00  
     LIMA                  : 12619   PR :200288   1st Qu.: 30.00  
     SAN MARTIN DE PORRES  : 10101                Median : 42.00  
     CALLAO                :  9742                Mean   : 43.13  
     EN INVESTIGACIÓN      :  9628                3rd Qu.: 55.00  
     COMAS                 :  7852                Max.   :120.00  
     (Other)               :201312                NA's   :1555    
            sexo        fecha_resultado     
     Femenino :109825   Min.   :2020-03-06  
     Masculino:152056   1st Qu.:2020-05-06  
     NA's     :  2808   Median :2020-05-23  
                        Mean   :2020-05-20  
                        3rd Qu.:2020-06-06  
                        Max.   :2020-06-23  
                        NA's   :1339        

         uuid           fecha_fallecimiento       edad               sexo     
     Length:8586        Min.   :2020-03-19   Min.   :  0.00   Femenino :2497  
     Class :character   1st Qu.:2020-05-03   1st Qu.: 57.00   Masculino:6089  
     Mode  :character   Median :2020-05-29   Median : 66.00                   
                        Mean   :2020-05-22   Mean   : 65.42                   
                        3rd Qu.:2020-06-12   3rd Qu.: 75.00                   
                        Max.   :2020-06-23   Max.   :101.00                   
                                                                              
       fecha_nac               departamento     provincia   
     Min.   :1915-06-19   LIMA       :3950   LIMA    :3303  
     1st Qu.:1944-08-13   LAMBAYEQUE : 718   CALLAO  : 408  
     Median :1953-10-14   PIURA      : 715   PIURA   : 390  
     Mean   :1954-07-10   CALLAO     : 563   TRUJILLO: 361  
     3rd Qu.:1963-01-16   LA LIBERTAD: 496   CHICLAYO: 285  
     Max.   :2020-02-08   ANCASH     : 437   (Other) :2501  
     NA's   :770          (Other)    :1707   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 388   Min.   :  0.17  
     CALLAO                : 313   1st Qu.: 57.37  
     SAN MARTIN DE PORRES  : 312   Median : 66.62  
     LIMA                  : 286   Mean   : 65.87  
     COMAS                 : 266   3rd Qu.: 75.78  
     (Other)               :6216   Max.   :104.86  
     NA's                  : 805   NA's   :770     

      uuid_caso              departamento      provincia    
     Length:100425      LIMA       :80362   LIMA    :79698  
     Class :character   CALLAO     : 8988   CALLAO  : 8988  
     Mode  :character   PIURA      : 2521   TRUJILLO: 1957  
                        LA LIBERTAD: 2033   SANTA   : 1953  
                        ANCASH     : 1997   PIURA   : 1583  
                        LAMBAYEQUE : 1629   CHICLAYO: 1454  
                        (Other)    : 2895   (Other) : 4792  
                       distrito     metododx         edad               sexo      
     SAN JUAN DE LURIGANCHO:19243   PCR:28989   Min.   :  0.00   Femenino :18713  
     LIMA                  :10400   PR :71436   1st Qu.: 50.00   Masculino:81712  
     SAN MARTIN DE PORRES  :10304               Median : 58.00                    
     CALLAO                : 7528               Mean   : 57.69                    
     COMAS                 : 7340               3rd Qu.: 66.00                    
     VILLA EL SALVADOR     : 5161               Max.   :100.00                    
     (Other)               :40449                                                 
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:100425      Min.   :2020-03-19  
     1st Qu.:2020-04-28   Class :character   1st Qu.:2020-06-03  
     Median :2020-05-15   Mode  :character   Median :2020-06-11  
     Mean   :2020-05-12                      Mean   :2020-06-07  
     3rd Qu.:2020-05-27                      3rd Qu.:2020-06-17  
     Max.   :2020-06-22                      Max.   :2020-06-23  
                                                                 
       fecha_nac            edad_calc      coincidencias   
     Min.   :1919-12-01   Min.   :  0.57   Min.   : 1.000  
     1st Qu.:1953-12-21   1st Qu.: 50.15   1st Qu.: 1.000  
     Median :1961-10-23   Median : 58.64   Median : 2.000  
     Mean   :1962-03-20   Mean   : 58.22   Mean   : 2.941  
     3rd Qu.:1970-04-15   3rd Qu.: 66.46   3rd Qu.: 4.000  
     Max.   :2019-11-10   Max.   :100.51   Max.   :12.000  
                                                           

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 29957 casos reconstruídos.

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
