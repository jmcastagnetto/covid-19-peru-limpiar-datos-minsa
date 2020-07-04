[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-07-04 01:12:51 UTC

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
     Length:292004      LIMA       :160901   LIMA            :148062  
     Class :character   CALLAO     : 18230   CALLAO          : 17285  
     Mode  :character   PIURA      : 17336   EN INVESTIGACIÓN:  9770  
                        LAMBAYEQUE : 13904   CHICLAYO        :  9343  
                        LA LIBERTAD: 10333   PIURA           :  8185  
                        LORETO     :  9162   TRUJILLO        :  7282  
                        (Other)    : 62138   (Other)         : 92077  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 14325   PCR: 73082   Min.   :  0.00  
     LIMA                  : 13394   PR :218922   1st Qu.: 31.00  
     SAN MARTIN DE PORRES  : 10790                Median : 42.00  
     CALLAO                : 10117                Mean   : 43.25  
     EN INVESTIGACIÓN      :  9770                3rd Qu.: 55.00  
     COMAS                 :  8656                Max.   :120.00  
     (Other)               :224952                NA's   :1569    
            sexo        fecha_resultado     
     Femenino :122374   Min.   :2020-03-06  
     Masculino:166822   1st Qu.:2020-05-08  
     NA's     :  2808   Median :2020-05-26  
                        Mean   :2020-05-24  
                        3rd Qu.:2020-06-10  
                        Max.   :2020-07-01  
                        NA's   :1510        

         uuid           fecha_fallecimiento       edad               sexo     
     Length:10045       Min.   :2020-03-19   Min.   :  0.00   Femenino :2922  
     Class :character   1st Qu.:2020-05-06   1st Qu.: 57.00   Masculino:7123  
     Mode  :character   Median :2020-06-03   Median : 66.00                   
                        Mean   :2020-05-27   Mean   : 65.51                   
                        3rd Qu.:2020-06-17   3rd Qu.: 75.00                   
                        Max.   :2020-07-01   Max.   :107.00                   
                                                                              
       fecha_nac               departamento     provincia   
     Min.   :1912-12-15   LIMA       :4652   LIMA    :3916  
     1st Qu.:1944-06-25   PIURA      : 769   CALLAO  : 488  
     Median :1953-08-25   LAMBAYEQUE : 756   TRUJILLO: 453  
     Mean   :1954-06-08   CALLAO     : 643   PIURA   : 418  
     3rd Qu.:1962-12-20   LA LIBERTAD: 615   CHICLAYO: 312  
     Max.   :2020-02-08   ICA        : 497   (Other) :3120  
     NA's   :775          (Other)    :2113   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 469   Min.   :  0.17  
     CALLAO                : 356   1st Qu.: 57.43  
     SAN MARTIN DE PORRES  : 355   Median : 66.76  
     LIMA                  : 335   Mean   : 65.97  
     COMAS                 : 310   3rd Qu.: 75.93  
     (Other)               :7415   Max.   :107.53  
     NA's                  : 805   NA's   :775     

      uuid_caso              departamento       provincia     
     Length:131356      LIMA       :104654   LIMA    :103687  
     Class :character   CALLAO     : 11878   CALLAO  : 11878  
     Mode  :character   LA LIBERTAD:  2945   TRUJILLO:  2835  
                        PIURA      :  2881   SANTA   :  2362  
                        ANCASH     :  2454   CHICLAYO:  1977  
                        LAMBAYEQUE :  2179   PIURA   :  1874  
                        (Other)    :  4365   (Other) :  6743  
                       distrito     metododx         edad               sexo       
     SAN JUAN DE LURIGANCHO:26189   PCR:37957   Min.   :  0.00   Femenino : 24981  
     LIMA                  :13659   PR :93399   1st Qu.: 49.00   Masculino:106375  
     SAN MARTIN DE PORRES  :12586               Median : 58.00                     
     CALLAO                :10111               Mean   : 57.62                     
     COMAS                 : 9375               3rd Qu.: 66.00                     
     VILLA EL SALVADOR     : 6522               Max.   :100.00                     
     (Other)               :52914                                                  
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:131356      Min.   :2020-03-19  
     1st Qu.:2020-04-29   Class :character   1st Qu.:2020-06-06  
     Median :2020-05-17   Mode  :character   Median :2020-06-15  
     Mean   :2020-05-14                      Mean   :2020-06-12  
     3rd Qu.:2020-05-28                      3rd Qu.:2020-06-23  
     Max.   :2020-06-30                      Max.   :2020-07-01  
                                                                 
       fecha_nac            edad_calc      coincidencias   
     Min.   :1919-12-01   Min.   :  0.57   Min.   : 1.000  
     1st Qu.:1953-12-07   1st Qu.: 49.89   1st Qu.: 1.000  
     Median :1961-12-29   Median : 58.45   Median : 3.000  
     Mean   :1962-04-25   Mean   : 58.13   Mean   : 3.387  
     3rd Qu.:1970-07-19   3rd Qu.: 66.50   3rd Qu.: 5.000  
     Max.   :2019-11-10   Max.   :100.51   Max.   :15.000  
                                                           

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 34658 casos reconstruídos.

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
