[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-07-07 21:25:22 UTC

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
     Length:305703      LIMA       :157158   LIMA            :152850  
     Class :character   CALLAO     : 18471   EN INVESTIGACIÓN: 18456  
     Mode  :character   PIURA      : 17941   CALLAO          : 17509  
                        LAMBAYEQUE : 14355   CHICLAYO        :  9665  
                        LA LIBERTAD: 11050   PIURA           :  8526  
                        LIMA REGION:  9495   TRUJILLO        :  7787  
                        (Other)    : 77233   (Other)         : 90910  
                       distrito      metododx          edad      
     EN INVESTIGACIÓN      : 18456   PCR: 76943   Min.   :  0.0  
     SAN JUAN DE LURIGANCHO: 14915   PR :228760   1st Qu.: 31.0  
     LIMA                  : 13786                Median : 42.0  
     SAN MARTIN DE PORRES  : 11099                Mean   : 43.3  
     CALLAO                : 10189                3rd Qu.: 55.0  
     COMAS                 :  8971                Max.   :120.0  
     (Other)               :228287                NA's   :1577   
            sexo        fecha_resultado     
     Femenino :128848   Min.   :2020-03-06  
     Masculino:174047   1st Qu.:2020-05-09  
     NA's     :  2808   Median :2020-05-27  
                        Mean   :2020-05-25  
                        3rd Qu.:2020-06-12  
                        Max.   :2020-07-05  
                        NA's   :1510        

         uuid           fecha_fallecimiento       edad               sexo     
     Length:10772       Min.   :2020-03-19   Min.   :  0.00   Femenino :3151  
     Class :character   1st Qu.:2020-05-08   1st Qu.: 57.00   Masculino:7621  
     Mode  :character   Median :2020-06-05   Median : 66.00                   
                        Mean   :2020-05-29   Mean   : 65.53                   
                        3rd Qu.:2020-06-20   3rd Qu.: 75.00                   
                        Max.   :2020-07-05   Max.   :107.00                   
                                                                              
       fecha_nac               departamento     provincia   
     Min.   :1912-12-15   LIMA       :4978   LIMA    :4207  
     1st Qu.:1944-06-29   PIURA      : 805   CALLAO  : 509  
     Median :1953-08-05   LAMBAYEQUE : 773   TRUJILLO: 503  
     Mean   :1954-06-03   LA LIBERTAD: 690   PIURA   : 432  
     3rd Qu.:1962-12-15   CALLAO     : 664   CHICLAYO: 325  
     Max.   :2020-02-12   ICA        : 536   (Other) :3458  
     NA's   :783          (Other)    :2326   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 502   Min.   :  0.17  
     SAN MARTIN DE PORRES  : 377   1st Qu.: 57.44  
     CALLAO                : 364   Median : 66.81  
     LIMA                  : 355   Mean   : 65.99  
     COMAS                 : 326   3rd Qu.: 75.92  
     (Other)               :8043   Max.   :107.53  
     NA's                  : 805   NA's   :783     

      uuid_caso              departamento       provincia     
     Length:144321      LIMA       :114720   LIMA    :114720  
     Class :character   CALLAO     : 12558   CALLAO  : 12558  
     Mode  :character   LA LIBERTAD:  3592   TRUJILLO:  3450  
                        PIURA      :  3139   SANTA   :  2657  
                        ANCASH     :  2770   CHICLAYO:  2121  
                        LAMBAYEQUE :  2330   PIURA   :  2028  
                        (Other)    :  5212   (Other) :  6787  
                       distrito     metododx          edad       
     SAN JUAN DE LURIGANCHO:28895   PCR: 41522   Min.   :  0.00  
     LIMA                  :15229   PR :102799   1st Qu.: 50.00  
     SAN MARTIN DE PORRES  :13777                Median : 58.00  
     CALLAO                :10645                Mean   : 57.59  
     COMAS                 :10214                3rd Qu.: 66.00  
     VILLA EL SALVADOR     : 7012                Max.   :100.00  
     (Other)               :58549                                
            sexo        fecha_resultado      uuid_fallecimiento
     Femenino : 27886   Min.   :2020-03-07   Length:144321     
     Masculino:116435   1st Qu.:2020-04-30   Class :character  
                        Median :2020-05-18   Mode  :character  
                        Mean   :2020-05-15                     
                        3rd Qu.:2020-05-29                     
                        Max.   :2020-07-04                     
                                                               
     fecha_fallecimiento    fecha_nac            edad_calc      coincidencias  
     Min.   :2020-03-19   Min.   :1919-12-01   Min.   :  0.39   Min.   : 1.00  
     1st Qu.:2020-06-07   1st Qu.:1953-12-15   1st Qu.: 50.02   1st Qu.: 2.00  
     Median :2020-06-16   Median :1962-02-06   Median : 58.40   Median : 3.00  
     Mean   :2020-06-14   Mean   :1962-05-08   Mean   : 58.10   Mean   : 3.57  
     3rd Qu.:2020-06-26   3rd Qu.:1970-06-11   3rd Qu.: 66.50   3rd Qu.: 5.00  
     Max.   :2020-07-05   Max.   :2020-02-12   Max.   :100.51   Max.   :15.00  
                                                                               

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 35904 casos reconstruídos.

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
