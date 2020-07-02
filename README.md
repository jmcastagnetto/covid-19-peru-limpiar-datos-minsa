[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-07-02 16:53:05 UTC

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
     Length:288477      LIMA       :159403   LIMA            :146851  
     Class :character   CALLAO     : 18155   CALLAO          : 17210  
     Mode  :character   PIURA      : 17149   EN INVESTIGACIÓN:  9501  
                        LAMBAYEQUE : 13779   CHICLAYO        :  9264  
                        LA LIBERTAD: 10148   PIURA           :  8077  
                        LORETO     :  9072   TRUJILLO        :  7179  
                        (Other)    : 60771   (Other)         : 90395  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 14202   PCR: 71953   Min.   :  0.00  
     LIMA                  : 13300   PR :216524   1st Qu.: 31.00  
     SAN MARTIN DE PORRES  : 10702                Median : 42.00  
     CALLAO                : 10090                Mean   : 43.24  
     EN INVESTIGACIÓN      :  9501                3rd Qu.: 55.00  
     COMAS                 :  8579                Max.   :120.00  
     (Other)               :222103                NA's   :1567    
            sexo        fecha_resultado     
     Femenino :120880   Min.   :2020-03-06  
     Masculino:164789   1st Qu.:2020-05-08  
     NA's     :  2808   Median :2020-05-25  
                        Mean   :2020-05-23  
                        3rd Qu.:2020-06-10  
                        Max.   :2020-06-30  
                        NA's   :1510        

         uuid           fecha_fallecimiento       edad               sexo     
     Length:9860        Min.   :2020-03-19   Min.   :  0.00   Femenino :2865  
     Class :character   1st Qu.:2020-05-06   1st Qu.: 57.00   Masculino:6995  
     Mode  :character   Median :2020-06-03   Median : 66.00                   
                        Mean   :2020-05-26   Mean   : 65.51                   
                        3rd Qu.:2020-06-17   3rd Qu.: 75.00                   
                        Max.   :2020-06-30   Max.   :107.00                   
                                                                              
       fecha_nac               departamento     provincia   
     Min.   :1912-12-15   LIMA       :4581   LIMA    :3852  
     1st Qu.:1944-06-27   PIURA      : 759   CALLAO  : 478  
     Median :1953-09-02   LAMBAYEQUE : 751   TRUJILLO: 440  
     Mean   :1954-06-05   CALLAO     : 633   PIURA   : 413  
     3rd Qu.:1962-12-12   LA LIBERTAD: 598   CHICLAYO: 308  
     Max.   :2020-02-08   ICA        : 486   (Other) :3031  
     NA's   :775          (Other)    :2052   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 461   Min.   :  0.17  
     CALLAO                : 353   1st Qu.: 57.45  
     SAN MARTIN DE PORRES  : 352   Median : 66.74  
     LIMA                  : 332   Mean   : 65.98  
     COMAS                 : 304   3rd Qu.: 75.92  
     (Other)               :7253   Max.   :107.53  
     NA's                  : 805   NA's   :775     

      uuid_caso              departamento       provincia     
     Length:128204      LIMA       :102388   LIMA    :101441  
     Class :character   CALLAO     : 11506   CALLAO  : 11506  
     Mode  :character   PIURA      :  2837   TRUJILLO:  2727  
                        LA LIBERTAD:  2831   SANTA   :  2334  
                        ANCASH     :  2423   CHICLAYO:  1910  
                        LAMBAYEQUE :  2103   PIURA   :  1836  
                        (Other)    :  4116   (Other) :  6450  
                       distrito     metododx         edad               sexo       
     SAN JUAN DE LURIGANCHO:25693   PCR:37038   Min.   :  0.00   Femenino : 24284  
     LIMA                  :13398   PR :91166   1st Qu.: 49.00   Masculino:103920  
     SAN MARTIN DE PORRES  :12483               Median : 58.00                     
     CALLAO                : 9766               Mean   : 57.64                     
     COMAS                 : 9065               3rd Qu.: 66.00                     
     VILLA EL SALVADOR     : 6521               Max.   :100.00                     
     (Other)               :51278                                                  
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:128204      Min.   :2020-03-19  
     1st Qu.:2020-04-29   Class :character   1st Qu.:2020-06-05  
     Median :2020-05-17   Mode  :character   Median :2020-06-14  
     Mean   :2020-05-14                      Mean   :2020-06-11  
     3rd Qu.:2020-05-28                      3rd Qu.:2020-06-22  
     Max.   :2020-06-29                      Max.   :2020-06-30  
                                                                 
       fecha_nac            edad_calc      coincidencias   
     Min.   :1919-12-01   Min.   :  0.57   Min.   : 1.000  
     1st Qu.:1953-12-07   1st Qu.: 49.91   1st Qu.: 1.000  
     Median :1961-12-29   Median : 58.46   Median : 3.000  
     Mean   :1962-04-15   Mean   : 58.16   Mean   : 3.374  
     3rd Qu.:1970-07-19   3rd Qu.: 66.50   3rd Qu.: 5.000  
     Max.   :2019-11-10   Max.   :100.51   Max.   :15.000  
                                                           

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 34128 casos reconstruídos.

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
