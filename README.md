[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-06-30 01:36:15 UTC

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
     Length:279419      LIMA       :156172   LIMA            :143997  
     Class :character   CALLAO     : 17871   CALLAO          : 16936  
     Mode  :character   PIURA      : 16634   EN INVESTIGACIÓN:  9111  
                        LAMBAYEQUE : 13475   CHICLAYO        :  9043  
                        LA LIBERTAD:  9692   PIURA           :  7795  
                        LORETO     :  8904   CORONEL PORTILLO:  6906  
                        (Other)    : 56671   (Other)         : 85631  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 13941   PCR: 69529   Min.   :  0.00  
     LIMA                  : 13047   PR :209890   1st Qu.: 31.00  
     SAN MARTIN DE PORRES  : 10523                Median : 42.00  
     CALLAO                :  9994                Mean   : 43.19  
     EN INVESTIGACIÓN      :  9111                3rd Qu.: 55.00  
     COMAS                 :  8368                Max.   :120.00  
     (Other)               :214435                NA's   :1565    
            sexo        fecha_resultado     
     Femenino :116678   Min.   :2020-03-06  
     Masculino:159933   1st Qu.:2020-05-07  
     NA's     :  2808   Median :2020-05-25  
                        Mean   :2020-05-22  
                        3rd Qu.:2020-06-09  
                        Max.   :2020-06-27  
                        NA's   :1510        

         uuid           fecha_fallecimiento       edad               sexo     
     Length:9317        Min.   :2020-03-19   Min.   :  0.00   Femenino :2702  
     Class :character   1st Qu.:2020-05-05   1st Qu.: 57.00   Masculino:6615  
     Mode  :character   Median :2020-06-01   Median : 66.00                   
                        Mean   :2020-05-25   Mean   : 65.43                   
                        3rd Qu.:2020-06-15   3rd Qu.: 75.00                   
                        Max.   :2020-06-27   Max.   :107.00                   
                                                                              
       fecha_nac               departamento     provincia   
     Min.   :1912-12-15   LIMA       :4320   LIMA    :3626  
     1st Qu.:1944-08-03   PIURA      : 742   CALLAO  : 456  
     Median :1953-10-13   LAMBAYEQUE : 737   TRUJILLO: 407  
     Mean   :1954-07-08   CALLAO     : 611   PIURA   : 405  
     3rd Qu.:1963-01-16   LA LIBERTAD: 553   CHICLAYO: 299  
     Max.   :2020-02-08   ICA        : 464   (Other) :2786  
     NA's   :772          (Other)    :1890   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 424   Min.   :  0.17  
     CALLAO                : 343   1st Qu.: 57.37  
     SAN MARTIN DE PORRES  : 337   Median : 66.63  
     LIMA                  : 313   Mean   : 65.88  
     COMAS                 : 292   3rd Qu.: 75.83  
     (Other)               :6803   Max.   :107.53  
     NA's                  : 805   NA's   :772     

      uuid_caso              departamento      provincia    
     Length:116758      LIMA       :93134   LIMA    :92264  
     Class :character   CALLAO     :10851   CALLAO  :10851  
     Mode  :character   PIURA      : 2734   TRUJILLO: 2296  
                        LA LIBERTAD: 2390   SANTA   : 2116  
                        ANCASH     : 2186   CHICLAYO: 1779  
                        LAMBAYEQUE : 1969   PIURA   : 1758  
                        (Other)    : 3494   (Other) : 5694  
                       distrito     metododx         edad               sexo      
     SAN JUAN DE LURIGANCHO:22192   PCR:33706   Min.   :  0.00   Femenino :21747  
     LIMA                  :12231   PR :83052   1st Qu.: 50.00   Masculino:95011  
     SAN MARTIN DE PORRES  :11858               Median : 58.00                    
     CALLAO                : 9219               Mean   : 57.65                    
     COMAS                 : 8504               3rd Qu.: 66.00                    
     VILLA EL SALVADOR     : 5798               Max.   :100.00                    
     (Other)               :46956                                                 
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:116758      Min.   :2020-03-19  
     1st Qu.:2020-04-29   Class :character   1st Qu.:2020-06-04  
     Median :2020-05-16   Mode  :character   Median :2020-06-13  
     Mean   :2020-05-13                      Mean   :2020-06-10  
     3rd Qu.:2020-05-28                      3rd Qu.:2020-06-20  
     Max.   :2020-06-26                      Max.   :2020-06-27  
                                                                 
       fecha_nac            edad_calc      coincidencias   
     Min.   :1919-12-01   Min.   :  0.57   Min.   : 1.000  
     1st Qu.:1954-01-18   1st Qu.: 50.11   1st Qu.: 1.000  
     Median :1961-12-27   Median : 58.46   Median : 3.000  
     Mean   :1962-04-11   Mean   : 58.16   Mean   : 3.201  
     3rd Qu.:1970-05-01   3rd Qu.: 66.41   3rd Qu.: 4.000  
     Max.   :2019-11-10   Max.   :100.51   Max.   :14.000  
                                                           

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 32695 casos reconstruídos.

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
