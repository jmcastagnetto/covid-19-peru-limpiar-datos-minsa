[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-06-11 20:38:27 UTC

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
     Length:208823      LIMA       :122883   LIMA            :115864  
     Class :character   CALLAO     : 14489   CALLAO          : 13767  
     Mode  :character   PIURA      : 11520   CHICLAYO        :  6852  
                        LAMBAYEQUE : 10286   PIURA           :  5472  
                        LORETO     :  6719   CORONEL PORTILLO:  5269  
                        LA LIBERTAD:  6311   EN INVESTIGACIÓN:  5139  
                        (Other)    : 36615   (Other)         : 56460  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 11239   PCR: 49551   Min.   :  0.00  
     LIMA                  : 10622   PR :159272   1st Qu.: 30.00  
     SAN MARTIN DE PORRES  :  8710                Median : 42.00  
     CALLAO                :  8188                Mean   : 42.94  
     COMAS                 :  6495                3rd Qu.: 54.00  
     ATE                   :  6259                Max.   :120.00  
     (Other)               :157310                NA's   :1520    
            sexo        fecha_resultado     
     Femenino : 84138   Min.   :2020-03-06  
     Masculino:121881   1st Qu.:2020-05-02  
     NA's     :  2804   Median :2020-05-18  
                        Mean   :2020-05-14  
                        3rd Qu.:2020-05-27  
                        Max.   :2020-06-09  
                        NA's   :1340        

    summary(fallecimientos)

         uuid           fecha_fallecimiento       edad               sexo     
     Length:5903        Min.   :2020-03-19   Min.   :  0.00   Femenino :1705  
     Class :character   1st Qu.:2020-04-27   1st Qu.: 56.50   Masculino:4198  
     Mode  :character   Median :2020-05-10   Median : 66.00                   
                        Mean   :2020-05-11   Mean   : 65.18                   
                        3rd Qu.:2020-05-30   3rd Qu.: 75.00                   
                        Max.   :2020-06-09   Max.   :100.00                   
                                                                              
       fecha_nac              departamento     provincia   
     Min.   :1915-06-19   LIMA      :2543   LIMA    :2020  
     1st Qu.:1944-11-22   LAMBAYEQUE: 642   PIURA   : 326  
     Median :1953-12-23   PIURA     : 593   CALLAO  : 255  
     Mean   :1954-10-14   CALLAO    : 410   CHICLAYO: 236  
     3rd Qu.:1963-06-27   ANCASH    : 335   TRUJILLO: 184  
     Max.   :2020-02-08   LORETO    : 309   (Other) :1544  
     NA's   :748          (Other)   :1071   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 236   Min.   :  0.17  
     CALLAO                : 221   1st Qu.: 56.85  
     LIMA                  : 194   Median : 66.38  
     SAN MARTIN DE PORRES  : 192   Mean   : 65.57  
     CHIMBOTE              : 177   3rd Qu.: 75.44  
     (Other)               :4078   Max.   :104.86  
     NA's                  : 805   NA's   :748     

    summary(reconstruido)

      uuid_caso              departamento      provincia    
     Length:43841       LIMA       :34817   LIMA    :34514  
     Class :character   CALLAO     : 3457   CALLAO  : 3457  
     Mode  :character   PIURA      : 1675   PIURA   : 1079  
                        ANCASH     : 1033   SANTA   : 1011  
                        LAMBAYEQUE :  924   CHICLAYO:  818  
                        LA LIBERTAD:  726   TRUJILLO:  697  
                        (Other)    : 1209   (Other) : 2265  
                       distrito     metododx         edad               sexo      
     SAN JUAN DE LURIGANCHO: 8948   PCR:12680   Min.   :  0.00   Femenino : 8648  
     LIMA                  : 4522   PR :31161   1st Qu.: 49.00   Masculino:35193  
     SAN MARTIN DE PORRES  : 3622               Median : 57.00                    
     COMAS                 : 2934               Mean   : 57.36                    
     CALLAO                : 2648               3rd Qu.: 66.00                    
     VILLA EL SALVADOR     : 2168               Max.   :100.00                    
     (Other)               :18999                                                 
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:43841       Min.   :2020-03-19  
     1st Qu.:2020-04-24   Class :character   1st Qu.:2020-05-28  
     Median :2020-05-08   Mode  :character   Median :2020-06-02  
     Mean   :2020-05-07                      Mean   :2020-05-28  
     3rd Qu.:2020-05-22                      3rd Qu.:2020-06-06  
     Max.   :2020-06-08                      Max.   :2020-06-09  
                                                                 
       fecha_nac            edad_calc      coincidencias  
     Min.   :1919-12-01   Min.   :  0.57   Min.   :1.000  
     1st Qu.:1954-02-15   1st Qu.: 50.02   1st Qu.:1.000  
     Median :1962-07-19   Median : 57.86   Median :2.000  
     Mean   :1962-07-03   Mean   : 57.90   Mean   :2.007  
     3rd Qu.:1970-05-26   3rd Qu.: 66.28   3rd Qu.:3.000  
     Max.   :2019-11-10   Max.   :100.51   Max.   :8.000  
                                                          

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 20486 casos reconstruídos.

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
