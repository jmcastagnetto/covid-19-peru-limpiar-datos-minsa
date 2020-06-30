[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-06-30 22:20:43 UTC

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
     Length:282365      LIMA       :157050   LIMA            :144760  
     Class :character   CALLAO     : 17944   CALLAO          : 17003  
     Mode  :character   PIURA      : 16746   EN INVESTIGACIÓN:  9258  
                        LAMBAYEQUE : 13572   CHICLAYO        :  9110  
                        LA LIBERTAD:  9856   PIURA           :  7828  
                        LORETO     :  8955   CORONEL PORTILLO:  6954  
                        (Other)    : 58242   (Other)         : 87452  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 14013   PCR: 70215   Min.   :  0.00  
     LIMA                  : 13108   PR :212150   1st Qu.: 31.00  
     SAN MARTIN DE PORRES  : 10563                Median : 42.00  
     CALLAO                : 10008                Mean   : 43.22  
     EN INVESTIGACIÓN      :  9258                3rd Qu.: 55.00  
     COMAS                 :  8412                Max.   :120.00  
     (Other)               :217003                NA's   :1568    
            sexo        fecha_resultado     
     Femenino :118026   Min.   :2020-03-06  
     Masculino:161531   1st Qu.:2020-05-07  
     NA's     :  2808   Median :2020-05-25  
                        Mean   :2020-05-22  
                        3rd Qu.:2020-06-09  
                        Max.   :2020-06-28  
                        NA's   :1510        

         uuid           fecha_fallecimiento       edad               sexo     
     Length:9504        Min.   :2020-03-19   Min.   :  0.00   Femenino :2763  
     Class :character   1st Qu.:2020-05-05   1st Qu.: 57.00   Masculino:6741  
     Mode  :character   Median :2020-06-01   Median : 66.00                   
                        Mean   :2020-05-25   Mean   : 65.48                   
                        3rd Qu.:2020-06-15   3rd Qu.: 75.00                   
                        Max.   :2020-06-28   Max.   :107.00                   
                                                                              
       fecha_nac               departamento     provincia   
     Min.   :1912-12-15   LIMA       :4420   LIMA    :3709  
     1st Qu.:1944-08-03   PIURA      : 748   CALLAO  : 464  
     Median :1953-10-14   LAMBAYEQUE : 741   TRUJILLO: 418  
     Mean   :1954-07-14   CALLAO     : 619   PIURA   : 408  
     3rd Qu.:1963-01-19   LA LIBERTAD: 568   CHICLAYO: 300  
     Max.   :2020-02-08   ICA        : 470   (Other) :2867  
     NA's   :1001         (Other)    :1938   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 439   Min.   :  0.17  
     CALLAO                : 347   1st Qu.: 57.36  
     SAN MARTIN DE PORRES  : 345   Median : 66.63  
     LIMA                  : 320   Mean   : 65.87  
     COMAS                 : 293   3rd Qu.: 75.83  
     (Other)               :6955   Max.   :107.53  
     NA's                  : 805   NA's   :1001    

      uuid_caso              departamento      provincia    
     Length:115856      LIMA       :92253   LIMA    :91383  
     Class :character   CALLAO     :10851   CALLAO  :10851  
     Mode  :character   PIURA      : 2695   TRUJILLO: 2293  
                        LA LIBERTAD: 2387   SANTA   : 2116  
                        ANCASH     : 2186   CHICLAYO: 1779  
                        LAMBAYEQUE : 1969   PIURA   : 1733  
                        (Other)    : 3515   (Other) : 5701  
                       distrito     metododx         edad               sexo      
     SAN JUAN DE LURIGANCHO:22086   PCR:33427   Min.   :  0.00   Femenino :21692  
     LIMA                  :12090   PR :82429   1st Qu.: 50.00   Masculino:94164  
     SAN MARTIN DE PORRES  :11732               Median : 58.00                    
     CALLAO                : 9219               Mean   : 57.61                    
     COMAS                 : 8371               3rd Qu.: 66.00                    
     VILLA EL SALVADOR     : 5699               Max.   :100.00                    
     (Other)               :46659                                                 
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:115856      Min.   :2020-03-19  
     1st Qu.:2020-04-29   Class :character   1st Qu.:2020-06-04  
     Median :2020-05-16   Mode  :character   Median :2020-06-13  
     Mean   :2020-05-13                      Mean   :2020-06-10  
     3rd Qu.:2020-05-28                      3rd Qu.:2020-06-20  
     Max.   :2020-06-26                      Max.   :2020-06-27  
                                                                 
       fecha_nac            edad_calc      coincidencias   
     Min.   :1919-12-01   Min.   :  0.57   Min.   : 1.000  
     1st Qu.:1954-01-22   1st Qu.: 50.03   1st Qu.: 1.000  
     Median :1961-12-29   Median : 58.45   Median : 3.000  
     Mean   :1962-04-26   Mean   : 58.12   Mean   : 3.166  
     3rd Qu.:1970-05-26   3rd Qu.: 66.41   3rd Qu.: 4.000  
     Max.   :2019-11-10   Max.   :100.51   Max.   :14.000  
                                                           

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 32770 casos reconstruídos.

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
