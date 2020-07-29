[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-07-29 19:55:08 UTC

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
     Length:395005      LIMA       :192748   LIMA            :185675  
     Class :character   CALLAO     : 20841   CALLAO          : 19760  
     Mode  :character   PIURA      : 20687   EN INVESTIGACIÓN: 16001  
                        LAMBAYEQUE : 16815   AREQUIPA        : 11589  
                        LIMA REGION: 16461   CHICLAYO        : 11265  
                        LA LIBERTAD: 14550   TRUJILLO        : 10617  
                        (Other)    :112903   (Other)         :140098  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 18369   PCR:107470   Min.   :  0.00  
     LIMA                  : 16389   PR :287535   1st Qu.: 31.00  
     EN INVESTIGACIÓN      : 16001                Median : 42.00  
     SAN MARTIN DE PORRES  : 13284                Mean   : 43.36  
     COMAS                 : 11404                3rd Qu.: 55.00  
     CALLAO                : 11156                Max.   :120.00  
     (Other)               :308402                                
            sexo        fecha_resultado     
     Femenino :171368   Min.   :2020-03-06  
     Masculino:222135   1st Qu.:2020-05-16  
     NA's     :  1502   Median :2020-06-05  
                        Mean   :2020-06-06  
                        3rd Qu.:2020-07-01  
                        Max.   :2020-07-27  
                                            

         uuid           fecha_fallecimiento       edad               sexo      
     Length:18612       Min.   :2020-03-18   Min.   :  0.00   Femenino : 5452  
     Class :character   1st Qu.:2020-05-09   1st Qu.: 57.00   Masculino:13160  
     Mode  :character   Median :2020-06-07   Median : 66.00                    
                        Mean   :2020-06-05   Mean   : 65.63                    
                        3rd Qu.:2020-07-01   3rd Qu.: 75.00                    
                        Max.   :2020-07-27   Max.   :107.00                    
                                                                               
       fecha_nac               departamento     provincia   
     Min.   :1912-12-15   LIMA       :8785   LIMA    :7630  
     1st Qu.:1944-07-09   LA LIBERTAD:1320   TRUJILLO: 955  
     Median :1953-07-29   PIURA      :1249   CALLAO  : 857  
     Mean   :1954-04-23   LAMBAYEQUE :1211   CHICLAYO: 672  
     3rd Qu.:1962-11-28   CALLAO     :1017   AREQUIPA: 657  
     Max.   :2020-02-12   ANCASH     : 813   (Other) :6503  
     NA's   :864          (Other)    :4217   NA's    :1338  
                       distrito       edad_calc     
     SAN JUAN DE LURIGANCHO:  903   Min.   :  0.17  
     LIMA                  :  662   1st Qu.: 57.52  
     CALLAO                :  571   Median : 66.86  
     SAN MARTIN DE PORRES  :  560   Mean   : 66.12  
     VILLA EL SALVADOR     :  536   3rd Qu.: 75.90  
     (Other)               :14575   Max.   :107.53  
     NA's                  :  805   NA's   :864     

      uuid_caso              departamento       provincia     
     Length:259517      LIMA       :203169   LIMA    :203169  
     Class :character   CALLAO     : 20606   CALLAO  : 20606  
     Mode  :character   LA LIBERTAD:  7467   TRUJILLO:  7196  
                        LAMBAYEQUE :  5645   CHICLAYO:  5279  
                        ANCASH     :  5287   SANTA   :  4986  
                        PIURA      :  5056   PIURA   :  3022  
                        (Other)    : 12287   (Other) : 15259  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 51894   PCR: 78460   Min.   :  0.00  
     LIMA                  : 25656   PR :181057   1st Qu.: 50.00  
     SAN MARTIN DE PORRES  : 22306                Median : 58.00  
     COMAS                 : 17765                Mean   : 57.76  
     CALLAO                : 17445                3rd Qu.: 66.00  
     VILLA EL SALVADOR     : 13773                Max.   :101.00  
     (Other)               :110678                                
            sexo        fecha_resultado      uuid_fallecimiento
     Femenino : 50558   Min.   :2020-03-07   Length:259517     
     Masculino:208959   1st Qu.:2020-04-29   Class :character  
                        Median :2020-05-18   Mode  :character  
                        Mean   :2020-05-18                     
                        3rd Qu.:2020-06-03                     
                        Max.   :2020-07-26                     
                                                               
     fecha_fallecimiento    fecha_nac            edad_calc      coincidencias   
     Min.   :2020-03-19   Min.   :1919-01-11   Min.   :  0.26   Min.   : 1.000  
     1st Qu.:2020-06-07   1st Qu.:1954-01-08   1st Qu.: 50.31   1st Qu.: 2.000  
     Median :2020-06-24   Median :1961-12-27   Median : 58.46   Median : 4.000  
     Mean   :2020-06-21   Mean   :1962-03-17   Mean   : 58.26   Mean   : 5.151  
     3rd Qu.:2020-07-12   3rd Qu.:1970-03-03   3rd Qu.: 66.44   3rd Qu.: 7.000  
     Max.   :2020-07-27   Max.   :2020-02-12   Max.   :101.48   Max.   :25.000  
                                                                                

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 46019 casos reconstruídos.

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
