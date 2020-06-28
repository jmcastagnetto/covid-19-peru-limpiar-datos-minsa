[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-06-28 02:02:06 UTC

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
     Length:272364      LIMA       :153068   LIMA            :141345  
     Class :character   CALLAO     : 17580   CALLAO          : 16668  
     Mode  :character   PIURA      : 16250   CHICLAYO        :  8777  
                        LAMBAYEQUE : 13098   EN INVESTIGACIÓN:  8621  
                        LA LIBERTAD:  9307   PIURA           :  7643  
                        LORETO     :  8786   CORONEL PORTILLO:  6716  
                        (Other)    : 54275   (Other)         : 82594  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 13724   PCR: 67491   Min.   :  0.00  
     LIMA                  : 12859   PR :204873   1st Qu.: 31.00  
     SAN MARTIN DE PORRES  : 10352                Median : 42.00  
     CALLAO                :  9857                Mean   : 43.17  
     EN INVESTIGACIÓN      :  8621                3rd Qu.: 55.00  
     COMAS                 :  8068                Max.   :120.00  
     (Other)               :208883                NA's   :1560    
            sexo        fecha_resultado     
     Femenino :113314   Min.   :2020-03-06  
     Masculino:156242   1st Qu.:2020-05-07  
     NA's     :  2808   Median :2020-05-23  
                        Mean   :2020-05-21  
                        3rd Qu.:2020-06-07  
                        Max.   :2020-06-25  
                        NA's   :1510        

         uuid           fecha_fallecimiento       edad               sexo     
     Length:8939        Min.   :2020-03-19   Min.   :  0.00   Femenino :2592  
     Class :character   1st Qu.:2020-05-04   1st Qu.: 57.00   Masculino:6347  
     Mode  :character   Median :2020-05-30   Median : 66.00                   
                        Mean   :2020-05-23   Mean   : 65.39                   
                        3rd Qu.:2020-06-13   3rd Qu.: 75.00                   
                        Max.   :2020-06-25   Max.   :101.00                   
                                                                              
       fecha_nac               departamento     provincia   
     Min.   :1915-06-19   LIMA       :4124   LIMA    :3454  
     1st Qu.:1944-08-13   PIURA      : 733   CALLAO  : 429  
     Median :1953-10-28   LAMBAYEQUE : 725   PIURA   : 400  
     Mean   :1954-07-22   CALLAO     : 584   TRUJILLO: 389  
     3rd Qu.:1963-01-27   LA LIBERTAD: 528   CHICLAYO: 290  
     Max.   :2020-02-08   ICA        : 449   (Other) :2639  
     NA's   :770          (Other)    :1796   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 401   Min.   :  0.17  
     CALLAO                : 327   1st Qu.: 57.31  
     SAN MARTIN DE PORRES  : 323   Median : 66.60  
     LIMA                  : 296   Mean   : 65.84  
     COMAS                 : 278   3rd Qu.: 75.80  
     (Other)               :6509   Max.   :104.86  
     NA's                  : 805   NA's   :770     

      uuid_caso              departamento      provincia    
     Length:107370      LIMA       :85612   LIMA    :84843  
     Class :character   CALLAO     : 9857   CALLAO  : 9857  
     Mode  :character   PIURA      : 2676   TRUJILLO: 2157  
                        LA LIBERTAD: 2248   SANTA   : 2015  
                        ANCASH     : 2075   PIURA   : 1707  
                        LAMBAYEQUE : 1729   CHICLAYO: 1551  
                        (Other)    : 3173   (Other) : 5240  
                       distrito     metododx         edad               sexo      
     SAN JUAN DE LURIGANCHO:20203   PCR:30961   Min.   :  0.00   Femenino :20276  
     SAN MARTIN DE PORRES  :10913   PR :76409   1st Qu.: 50.00   Masculino:87094  
     LIMA                  :10791               Median : 58.00                    
     CALLAO                : 8321               Mean   : 57.67                    
     COMAS                 : 8022               3rd Qu.: 66.00                    
     VILLA EL SALVADOR     : 5361               Max.   :100.00                    
     (Other)               :43759                                                 
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:107370      Min.   :2020-03-19  
     1st Qu.:2020-04-28   Class :character   1st Qu.:2020-06-04  
     Median :2020-05-15   Mode  :character   Median :2020-06-12  
     Mean   :2020-05-13                      Mean   :2020-06-08  
     3rd Qu.:2020-05-27                      3rd Qu.:2020-06-18  
     Max.   :2020-06-24                      Max.   :2020-06-25  
                                                                 
       fecha_nac            edad_calc      coincidencias   
     Min.   :1919-12-01   Min.   :  0.57   Min.   : 1.000  
     1st Qu.:1954-01-08   1st Qu.: 50.22   1st Qu.: 1.000  
     Median :1961-11-27   Median : 58.55   Median : 2.000  
     Mean   :1962-04-03   Mean   : 58.18   Mean   : 3.026  
     3rd Qu.:1970-03-20   3rd Qu.: 66.44   3rd Qu.: 4.000  
     Max.   :2019-11-10   Max.   :100.51   Max.   :13.000  
                                                           

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 31453 casos reconstruídos.

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
