[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-06-24 02:28:29 UTC

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

    summary(casos)

         uuid                departamento               provincia     
     Length:257447      LIMA       :145466   LIMA            :135020  
     Class :character   CALLAO     : 17145   CALLAO          : 16262  
     Mode  :character   PIURA      : 15587   EN INVESTIGACIÓN:  8836  
                        LAMBAYEQUE : 12420   CHICLAYO        :  8349  
                        LA LIBERTAD:  8525   PIURA           :  7395  
                        LORETO     :  8364   CORONEL PORTILLO:  6515  
                        (Other)    : 49940   (Other)         : 75070  
                       distrito      metododx          edad      
     SAN JUAN DE LURIGANCHO: 13101   PCR: 61754   Min.   :  0.0  
     LIMA                  : 12372   PR :195693   1st Qu.: 30.0  
     SAN MARTIN DE PORRES  :  9906                Median : 42.0  
     CALLAO                :  9653                Mean   : 43.1  
     EN INVESTIGACIÓN      :  8836                3rd Qu.: 55.0  
     COMAS                 :  7650                Max.   :120.0  
     (Other)               :195929                NA's   :1550   
            sexo        fecha_resultado     
     Femenino :106469   Min.   :2020-03-06  
     Masculino:148170   1st Qu.:2020-05-06  
     NA's     :  2808   Median :2020-05-22  
                        Mean   :2020-05-19  
                        3rd Qu.:2020-06-05  
                        Max.   :2020-06-21  
                        NA's   :1339        

    summary(fallecimientos)

         uuid           fecha_fallecimiento       edad               sexo     
     Length:8223        Min.   :2020-03-19   Min.   :  0.00   Femenino :2398  
     Class :character   1st Qu.:2020-05-02   1st Qu.: 57.00   Masculino:5825  
     Mode  :character   Median :2020-05-27   Median : 66.00                   
                        Mean   :2020-05-21   Mean   : 65.41                   
                        3rd Qu.:2020-06-11   3rd Qu.: 75.00                   
                        Max.   :2020-06-21   Max.   :101.00                   
                                                                              
       fecha_nac               departamento     provincia   
     Min.   :1915-06-19   LIMA       :3761   LIMA    :3137  
     1st Qu.:1944-08-24   LAMBAYEQUE : 709   CALLAO  : 395  
     Median :1953-10-19   PIURA      : 694   PIURA   : 381  
     Mean   :1954-07-15   CALLAO     : 550   TRUJILLO: 337  
     3rd Qu.:1963-01-22   LA LIBERTAD: 462   CHICLAYO: 280  
     Max.   :2020-02-08   ANCASH     : 426   (Other) :2355  
     NA's   :757          (Other)    :1621   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 366   Min.   :  0.17  
     CALLAO                : 306   1st Qu.: 57.32  
     SAN MARTIN DE PORRES  : 299   Median : 66.61  
     LIMA                  : 274   Mean   : 65.85  
     COMAS                 : 247   3rd Qu.: 75.75  
     (Other)               :5926   Max.   :104.86  
     NA's                  : 805   NA's   :757     

    summary(reconstruido)

      uuid_caso              departamento      provincia    
     Length:93168       LIMA       :74265   LIMA    :73669  
     Class :character   CALLAO     : 8659   CALLAO  : 8659  
     Mode  :character   PIURA      : 2411   SANTA   : 1847  
                        ANCASH     : 1890   TRUJILLO: 1694  
                        LA LIBERTAD: 1761   PIURA   : 1529  
                        LAMBAYEQUE : 1557   CHICLAYO: 1393  
                        (Other)    : 2625   (Other) : 4377  
                       distrito     metododx         edad               sexo      
     SAN JUAN DE LURIGANCHO:17921   PCR:26782   Min.   :  0.00   Femenino :17326  
     LIMA                  : 9569   PR :66386   1st Qu.: 50.00   Masculino:75842  
     SAN MARTIN DE PORRES  : 9560               Median : 58.00                    
     CALLAO                : 7232               Mean   : 57.66                    
     COMAS                 : 6470               3rd Qu.: 66.00                    
     VILLA EL SALVADOR     : 4609               Max.   :100.00                    
     (Other)               :37807                                                 
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:93168       Min.   :2020-03-19  
     1st Qu.:2020-04-28   Class :character   1st Qu.:2020-06-02  
     Median :2020-05-14   Mode  :character   Median :2020-06-10  
     Mean   :2020-05-12                      Mean   :2020-06-06  
     3rd Qu.:2020-05-27                      3rd Qu.:2020-06-16  
     Max.   :2020-06-20                      Max.   :2020-06-21  
                                                                 
       fecha_nac            edad_calc      coincidencias   
     Min.   :1919-12-01   Min.   :  0.57   Min.   : 1.000  
     1st Qu.:1953-12-21   1st Qu.: 50.11   1st Qu.: 1.000  
     Median :1961-11-27   Median : 58.55   Median : 2.000  
     Mean   :1962-03-30   Mean   : 58.19   Mean   : 2.809  
     3rd Qu.:1970-04-25   3rd Qu.: 66.46   3rd Qu.: 4.000  
     Max.   :2019-11-10   Max.   :100.51   Max.   :12.000  
                                                           

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 29775 casos reconstruídos.

    ## [1] "es_PE.utf8"

    ## Parsed with column specification:
    ## cols(
    ##   fecha_resultado = col_date(format = ""),
    ##   pais = col_character(),
    ##   iso3c = col_character(),
    ##   departamento = col_character(),
    ##   n = col_double(),
    ##   n_acum = col_double()
    ## )

    ## Warning: Ignoring unknown parameters: aes

    ## Warning: Removed 12 rows containing non-finite values (stat_smooth).

    ## Warning: Removed 12 rows containing missing values (geom_point).

![“Positivos por día. MINSA”](plots/positivos-por-dia-minsa.png)

![“Positivos acumulados. MINSA”](plots/positivos-acumulados-minsa.png)

![“Positivos por día y por Departamento.
MINSA”](plots/positivos-diarios-por-departamento-minsa.png)

    ## Parsed with column specification:
    ## cols(
    ##   fecha_fallecimiento = col_date(format = ""),
    ##   pais = col_character(),
    ##   iso3c = col_character(),
    ##   departamento = col_character(),
    ##   n = col_double(),
    ##   n_acum = col_double()
    ## )

    ## Warning: Ignoring unknown parameters: aes

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
