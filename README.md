[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-06-24 19:46:14 UTC

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
     Length:260810      LIMA       :147372   LIMA            :136550  
     Class :character   CALLAO     : 17303   CALLAO          : 16408  
     Mode  :character   PIURA      : 15686   EN INVESTIGACIÓN:  9237  
                        LAMBAYEQUE : 12552   CHICLAYO        :  8429  
                        LA LIBERTAD:  8658   PIURA           :  7428  
                        LORETO     :  8449   CORONEL PORTILLO:  6563  
                        (Other)    : 50790   (Other)         : 76195  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 13244   PCR: 62850   Min.   :  0.00  
     LIMA                  : 12506   PR :197960   1st Qu.: 30.00  
     SAN MARTIN DE PORRES  :  9996                Median : 42.00  
     CALLAO                :  9721                Mean   : 43.12  
     EN INVESTIGACIÓN      :  9237                3rd Qu.: 55.00  
     COMAS                 :  7749                Max.   :120.00  
     (Other)               :198357                NA's   :1654    
            sexo        fecha_resultado     
     Femenino :108041   Min.   :2020-03-06  
     Masculino:149861   1st Qu.:2020-05-06  
     NA's     :  2908   Median :2020-05-22  
                        Mean   :2020-05-20  
                        3rd Qu.:2020-06-05  
                        Max.   :2020-06-22  
                        NA's   :1439        

         uuid           fecha_fallecimiento       edad               sexo     
     Length:8404        Min.   :2020-03-19   Min.   :  0.00   Femenino :2441  
     Class :character   1st Qu.:2020-05-03   1st Qu.: 57.00   Masculino:5963  
     Mode  :character   Median :2020-05-28   Median : 66.00                   
                        Mean   :2020-05-21   Mean   : 65.41                   
                        3rd Qu.:2020-06-11   3rd Qu.: 75.00                   
                        Max.   :2020-06-22   Max.   :101.00                   
                                                                              
       fecha_nac               departamento     provincia   
     Min.   :1915-06-19   LIMA       :3855   LIMA    :3219  
     1st Qu.:1944-08-13   LAMBAYEQUE : 713   CALLAO  : 400  
     Median :1953-10-19   PIURA      : 700   PIURA   : 385  
     Mean   :1954-07-15   CALLAO     : 555   TRUJILLO: 351  
     3rd Qu.:1963-01-21   LA LIBERTAD: 481   CHICLAYO: 282  
     Max.   :2020-02-08   ANCASH     : 431   (Other) :2429  
     NA's   :768          (Other)    :1669   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 374   Min.   :  0.17  
     CALLAO                : 310   1st Qu.: 57.33  
     SAN MARTIN DE PORRES  : 301   Median : 66.61  
     LIMA                  : 279   Mean   : 65.85  
     COMAS                 : 252   3rd Qu.: 75.77  
     (Other)               :6083   Max.   :104.86  
     NA's                  : 805   NA's   :768     

      uuid_caso              departamento      provincia    
     Length:96329       LIMA       :76851   LIMA    :76226  
     Class :character   CALLAO     : 8794   CALLAO  : 8794  
     Mode  :character   PIURA      : 2436   SANTA   : 1953  
                        ANCASH     : 1996   TRUJILLO: 1853  
                        LA LIBERTAD: 1924   PIURA   : 1542  
                        LAMBAYEQUE : 1592   CHICLAYO: 1420  
                        (Other)    : 2736   (Other) : 4541  
                       distrito     metododx         edad               sexo      
     SAN JUAN DE LURIGANCHO:18352   PCR:27783   Min.   :  0.00   Femenino :17773  
     LIMA                  : 9942   PR :68546   1st Qu.: 50.00   Masculino:78556  
     SAN MARTIN DE PORRES  : 9638               Median : 58.00                    
     CALLAO                : 7367               Mean   : 57.69                    
     COMAS                 : 6716               3rd Qu.: 66.00                    
     VILLA EL SALVADOR     : 4886               Max.   :100.00                    
     (Other)               :39428                                                 
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:96329       Min.   :2020-03-19  
     1st Qu.:2020-04-28   Class :character   1st Qu.:2020-06-02  
     Median :2020-05-15   Mode  :character   Median :2020-06-10  
     Mean   :2020-05-12                      Mean   :2020-06-07  
     3rd Qu.:2020-05-27                      3rd Qu.:2020-06-16  
     Max.   :2020-06-21                      Max.   :2020-06-22  
                                                                 
       fecha_nac            edad_calc      coincidencias   
     Min.   :1919-12-01   Min.   :  0.57   Min.   : 1.000  
     1st Qu.:1953-12-07   1st Qu.: 50.15   1st Qu.: 1.000  
     Median :1961-10-22   Median : 58.64   Median : 2.000  
     Mean   :1962-03-21   Mean   : 58.21   Mean   : 2.845  
     3rd Qu.:1970-04-15   3rd Qu.: 66.50   3rd Qu.: 4.000  
     Max.   :2019-11-10   Max.   :100.51   Max.   :12.000  
                                                           

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 29705 casos reconstruídos.

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
