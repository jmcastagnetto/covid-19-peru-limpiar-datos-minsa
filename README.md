[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-06-10 21:05:58 UTC

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

Información relevante
---------------------

Fuentes de datos:

-   <a href="https://www.datosabiertos.gob.pe/dataset/casos-positivos-por-covid-19-ministerio-de-salud-minsa" class="uri">https://www.datosabiertos.gob.pe/dataset/casos-positivos-por-covid-19-ministerio-de-salud-minsa</a>
-   <a href="https://www.datosabiertos.gob.pe/dataset/fallecidos-por-covid-19-ministerio-de-salud-minsa" class="uri">https://www.datosabiertos.gob.pe/dataset/fallecidos-por-covid-19-ministerio-de-salud-minsa</a>

Luego del primer paso de limpieza de datos:

    summary(casos)

         uuid                departamento               provincia     
     Length:203736      LIMA       :120183   LIMA            :113430  
     Class :character   CALLAO     : 14284   CALLAO          : 13566  
     Mode  :character   PIURA      : 11067   CHICLAYO        :  6725  
                        LAMBAYEQUE : 10100   PIURA           :  5260  
                        LORETO     :  6506   CORONEL PORTILLO:  5146  
                        LA LIBERTAD:  6082   EN INVESTIGACIÓN:  4942  
                        (Other)    : 35514   (Other)         : 54667  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 10997   PCR: 48271   Min.   :  0.00  
     LIMA                  : 10394   PR :155465   1st Qu.: 30.00  
     SAN MARTIN DE PORRES  :  8542                Median : 42.00  
     CALLAO                :  8070                Mean   : 42.94  
     COMAS                 :  6354                3rd Qu.: 54.00  
     ATE                   :  6129                Max.   :120.00  
     (Other)               :153250                NA's   :1636    
            sexo        fecha_resultado     
     Femenino : 81780   Min.   :2020-03-06  
     Masculino:119033   1st Qu.:2020-05-02  
     NA's     :  2923   Median :2020-05-17  
                        Mean   :2020-05-13  
                        3rd Qu.:2020-05-27  
                        Max.   :2020-06-08  
                        NA's   :1459        

    summary(fallecimientos)

         uuid           fecha_fallecimiento       edad               sexo     
     Length:5738        Min.   :2020-03-19   Min.   :  0.00   Femenino :1654  
     Class :character   1st Qu.:2020-04-26   1st Qu.: 56.00   Masculino:4084  
     Mode  :character   Median :2020-05-09   Median : 66.00                   
                        Mean   :2020-05-10   Mean   : 65.16                   
                        3rd Qu.:2020-05-29   3rd Qu.: 75.00                   
                        Max.   :2020-06-08   Max.   :100.00                   
                                                                              
       fecha_nac              departamento     provincia   
     Min.   :1915-06-19   LIMA      :2449   LIMA    :1933  
     1st Qu.:1944-11-25   LAMBAYEQUE: 636   PIURA   : 319  
     Median :1954-01-09   PIURA     : 584   CALLAO  : 246  
     Mean   :1954-10-27   CALLAO    : 401   CHICLAYO: 233  
     3rd Qu.:1963-07-18   ANCASH    : 327   TRUJILLO: 175  
     Max.   :2020-02-08   LORETO    : 308   (Other) :1494  
     NA's   :748          (Other)   :1033   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 226   Min.   :  0.17  
     CALLAO                : 216   1st Qu.: 56.83  
     SAN MARTIN DE PORRES  : 186   Median : 66.30  
     LIMA                  : 185   Mean   : 65.54  
     CHIMBOTE              : 173   3rd Qu.: 75.44  
     (Other)               :3947   Max.   :104.86  
     NA's                  : 805   NA's   :748     

    summary(reconstruido)

      uuid_caso              departamento      provincia    
     Length:41011       LIMA       :32471   LIMA    :32179  
     Class :character   CALLAO     : 3223   CALLAO  : 3223  
     Mode  :character   PIURA      : 1599   PIURA   : 1005  
                        ANCASH     :  999   SANTA   :  982  
                        LAMBAYEQUE :  914   CHICLAYO:  812  
                        LA LIBERTAD:  671   TRUJILLO:  643  
                        (Other)    : 1134   (Other) : 2167  
                       distrito     metododx         edad               sexo      
     SAN JUAN DE LURIGANCHO: 8479   PCR:11848   Min.   :  0.00   Femenino : 7897  
     LIMA                  : 4118   PR :29163   1st Qu.: 49.00   Masculino:33114  
     SAN MARTIN DE PORRES  : 3274               Median : 57.00                    
     COMAS                 : 2844               Mean   : 57.23                    
     CALLAO                : 2425               3rd Qu.: 66.00                    
     VILLA EL SALVADOR     : 1984               Max.   :100.00                    
     (Other)               :17887                                                 
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:41011       Min.   :2020-03-19  
     1st Qu.:2020-04-24   Class :character   1st Qu.:2020-05-28  
     Median :2020-05-07   Mode  :character   Median :2020-06-01  
     Mean   :2020-05-06                      Mean   :2020-05-27  
     3rd Qu.:2020-05-22                      3rd Qu.:2020-06-05  
     Max.   :2020-06-07                      Max.   :2020-06-08  
                                                                 
       fecha_nac            edad_calc      coincidencias  
     Min.   :1919-12-01   Min.   :  0.57   Min.   :1.000  
     1st Qu.:1954-04-12   1st Qu.: 49.97   1st Qu.:1.000  
     Median :1962-09-02   Median : 57.75   Median :2.000  
     Mean   :1962-08-18   Mean   : 57.77   Mean   :1.953  
     3rd Qu.:1970-06-15   3rd Qu.: 66.14   3rd Qu.:2.000  
     Max.   :2019-11-10   Max.   :100.51   Max.   :7.000  
                                                          

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 19556 casos reconstruídos.

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

-   datos/DATOSABIERTOS\_SISCOVID-utf8-limpio.csv.gz
-   datos/FALLECIDOS\_CDC-utf8-limpio.csv.gz

Y algunos reconstruidos con los anteriores:

-   datos/casos\_fallecimientos\_reconstruccion\_posible.csv.gz
-   datos/timeseries-casos.csv.gz
-   datos/timeseries-casos-lugares.csv.gz
-   datos/timeseries-fallecimientos.csv.gz
-   datos/timeseries-fallecimientos-lugares.csv.gz
