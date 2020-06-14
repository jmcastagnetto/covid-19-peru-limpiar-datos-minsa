[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-06-14 17:01:49 UTC

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

Información relevante
---------------------

Fuentes de datos:

-   <a href="https://www.datosabiertos.gob.pe/dataset/casos-positivos-por-covid-19-ministerio-de-salud-minsa" class="uri">https://www.datosabiertos.gob.pe/dataset/casos-positivos-por-covid-19-ministerio-de-salud-minsa</a>
-   <a href="https://www.datosabiertos.gob.pe/dataset/fallecidos-por-covid-19-ministerio-de-salud-minsa" class="uri">https://www.datosabiertos.gob.pe/dataset/fallecidos-por-covid-19-ministerio-de-salud-minsa</a>

Luego del primer paso de limpieza de datos:

    summary(casos)

         uuid                departamento               provincia     
     Length:225132      LIMA       :129865   LIMA            :123605  
     Class :character   CALLAO     : 15556   CALLAO          : 14776  
     Mode  :character   PIURA      : 13411   CHICLAYO        :  7431  
                        LAMBAYEQUE : 11059   PIURA           :  6553  
                        LORETO     :  7478   CORONEL PORTILLO:  5778  
                        LA LIBERTAD:  7026   MAYNAS          :  5272  
                        (Other)    : 40737   (Other)         : 61717  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 12016   PCR: 52833   Min.   :  0.00  
     LIMA                  : 11340   PR :172299   1st Qu.: 30.00  
     SAN MARTIN DE PORRES  :  9178                Median : 42.00  
     CALLAO                :  8882                Mean   : 43.01  
     COMAS                 :  6944                3rd Qu.: 54.00  
     ATE                   :  6558                Max.   :120.00  
     (Other)               :170214                NA's   :1512    
            sexo        fecha_resultado     
     Femenino : 91479   Min.   :2020-03-06  
     Masculino:130913   1st Qu.:2020-05-04  
     NA's     :  2740   Median :2020-05-19  
                        Mean   :2020-05-16  
                        3rd Qu.:2020-05-29  
                        Max.   :2020-06-12  
                        NA's   :1282        

    summary(fallecimientos)

         uuid           fecha_fallecimiento       edad               sexo     
     Length:6498        Min.   :2020-03-19   Min.   :  0.00   Femenino :1879  
     Class :character   1st Qu.:2020-04-28   1st Qu.: 56.00   Masculino:4619  
     Mode  :character   Median :2020-05-13   Median : 66.00                   
                        Mean   :2020-05-14   Mean   : 65.18                   
                        3rd Qu.:2020-06-02   3rd Qu.: 75.00                   
                        Max.   :2020-06-12   Max.   :100.00                   
                                                                              
       fecha_nac              departamento     provincia   
     Min.   :1915-06-19   LIMA      :2894   LIMA    :2345  
     1st Qu.:1944-11-25   LAMBAYEQUE: 659   PIURA   : 337  
     Median :1953-12-12   PIURA     : 612   CALLAO  : 284  
     Mean   :1954-10-12   CALLAO    : 439   CHICLAYO: 248  
     3rd Qu.:1963-06-30   ANCASH    : 358   TRUJILLO: 220  
     Max.   :2020-02-08   ICA       : 335   (Other) :1726  
     NA's   :748          (Other)   :1201   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 272   Min.   :  0.17  
     CALLAO                : 238   1st Qu.: 56.87  
     SAN MARTIN DE PORRES  : 227   Median : 66.42  
     LIMA                  : 219   Mean   : 65.59  
     CHIMBOTE              : 191   3rd Qu.: 75.44  
     (Other)               :4546   Max.   :104.86  
     NA's                  : 805   NA's   :748     

    summary(reconstruido)

      uuid_caso              departamento      provincia    
     Length:57055       LIMA       :45861   LIMA    :45469  
     Class :character   CALLAO     : 4491   CALLAO  : 4491  
     Mode  :character   PIURA      : 1857   SANTA   : 1248  
                        ANCASH     : 1273   PIURA   : 1186  
                        LAMBAYEQUE : 1080   TRUJILLO: 1000  
                        LA LIBERTAD: 1039   CHICLAYO:  960  
                        (Other)    : 1454   (Other) : 2701  
                       distrito     metododx         edad               sexo      
     SAN JUAN DE LURIGANCHO:11076   PCR:16315   Min.   :  0.00   Femenino :11034  
     LIMA                  : 6140   PR :40740   1st Qu.: 50.00   Masculino:46021  
     SAN MARTIN DE PORRES  : 5656               Median : 57.00                    
     COMAS                 : 4116               Mean   : 57.39                    
     CALLAO                : 3566               3rd Qu.: 66.00                    
     VILLA EL SALVADOR     : 2649               Max.   :100.00                    
     (Other)               :23852                                                 
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:57055       Min.   :2020-03-19  
     1st Qu.:2020-04-25   Class :character   1st Qu.:2020-05-29  
     Median :2020-05-11   Mode  :character   Median :2020-06-04  
     Mean   :2020-05-09                      Mean   :2020-05-31  
     3rd Qu.:2020-05-25                      3rd Qu.:2020-06-09  
     Max.   :2020-06-11                      Max.   :2020-06-12  
                                                                 
       fecha_nac            edad_calc      coincidencias   
     Min.   :1919-12-01   Min.   :  0.57   Min.   : 1.000  
     1st Qu.:1954-01-26   1st Qu.: 50.03   1st Qu.: 1.000  
     Median :1962-07-17   Median : 57.86   Median : 2.000  
     Mean   :1962-06-28   Mean   : 57.92   Mean   : 2.227  
     3rd Qu.:1970-05-30   3rd Qu.: 66.30   3rd Qu.: 3.000  
     Max.   :2019-11-10   Max.   :100.51   Max.   :10.000  
                                                           

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 23895 casos reconstruídos.

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
