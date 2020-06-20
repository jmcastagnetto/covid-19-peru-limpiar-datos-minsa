[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-06-20 19:51:59 UTC

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
     Length:247925      LIMA       :141512   LIMA            :131731  
     Class :character   CALLAO     : 16678   CALLAO          : 15815  
     Mode  :character   PIURA      : 14902   EN INVESTIGACIÓN:  8153  
                        LAMBAYEQUE : 12069   CHICLAYO        :  8102  
                        LA LIBERTAD:  8060   PIURA           :  7080  
                        LORETO     :  8051   CORONEL PORTILLO:  6208  
                        (Other)    : 46653   (Other)         : 70836  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 12765   PCR: 59312   Min.   :  0.00  
     LIMA                  : 12072   PR :188613   1st Qu.: 30.00  
     SAN MARTIN DE PORRES  :  9749                Median : 42.00  
     CALLAO                :  9393                Mean   : 43.08  
     EN INVESTIGACIÓN      :  8153                3rd Qu.: 55.00  
     COMAS                 :  7452                Max.   :120.00  
     (Other)               :188341                NA's   :1546    
            sexo        fecha_resultado     
     Femenino :101923   Min.   :2020-03-06  
     Masculino:143196   1st Qu.:2020-05-05  
     NA's     :  2806   Median :2020-05-21  
                        Mean   :2020-05-18  
                        3rd Qu.:2020-06-03  
                        Max.   :2020-12-06  
                        NA's   :1339        

    summary(fallecimientos)

         uuid           fecha_fallecimiento       edad               sexo     
     Length:7660        Min.   :2020-03-19   Min.   :  0.00   Femenino :2234  
     Class :character   1st Qu.:2020-05-01   1st Qu.: 57.00   Masculino:5426  
     Mode  :character   Median :2020-05-22   Median : 66.00                   
                        Mean   :2020-05-18   Mean   : 65.31                   
                        3rd Qu.:2020-06-08   3rd Qu.: 75.00                   
                        Max.   :2020-06-18   Max.   :101.00                   
                                                                              
       fecha_nac               departamento     provincia   
     Min.   :1915-06-19   LIMA       :3485   LIMA    :2890  
     1st Qu.:1944-10-05   LAMBAYEQUE : 694   PIURA   : 366  
     Median :1953-12-05   PIURA      : 667   CALLAO  : 358  
     Mean   :1954-08-20   CALLAO     : 513   TRUJILLO: 299  
     3rd Qu.:1963-04-19   LA LIBERTAD: 414   CHICLAYO: 270  
     Max.   :2020-02-08   ANCASH     : 403   (Other) :2139  
     NA's   :748          (Other)    :1484   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 339   Min.   :  0.17  
     CALLAO                : 281   1st Qu.: 57.08  
     SAN MARTIN DE PORRES  : 275   Median : 66.47  
     LIMA                  : 257   Mean   : 65.75  
     COMAS                 : 223   3rd Qu.: 75.59  
     (Other)               :5480   Max.   :104.86  
     NA's                  : 805   NA's   :748     

    summary(reconstruido)

      uuid_caso              departamento      provincia    
     Length:81719       LIMA       :65654   LIMA    :65131  
     Class :character   CALLAO     : 7084   CALLAO  : 7084  
     Mode  :character   PIURA      : 2162   SANTA   : 1610  
                        ANCASH     : 1652   TRUJILLO: 1382  
                        LA LIBERTAD: 1444   PIURA   : 1374  
                        LAMBAYEQUE : 1426   CHICLAYO: 1275  
                        (Other)    : 2297   (Other) : 3863  
                       distrito     metododx         edad               sexo      
     SAN JUAN DE LURIGANCHO:16157   PCR:23509   Min.   :  0.00   Femenino :15489  
     LIMA                  : 8439   PR :58210   1st Qu.: 50.00   Masculino:66230  
     SAN MARTIN DE PORRES  : 8319               Median : 58.00                    
     CALLAO                : 5886               Mean   : 57.58                    
     COMAS                 : 5534               3rd Qu.: 66.00                    
     VILLA EL SALVADOR     : 4312               Max.   :100.00                    
     (Other)               :33072                                                 
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:81719       Min.   :2020-03-19  
     1st Qu.:2020-04-27   Class :character   1st Qu.:2020-06-01  
     Median :2020-05-13   Mode  :character   Median :2020-06-08  
     Mean   :2020-05-11                      Mean   :2020-06-04  
     3rd Qu.:2020-05-26                      3rd Qu.:2020-06-13  
     Max.   :2020-06-17                      Max.   :2020-06-18  
                                                                 
       fecha_nac            edad_calc      coincidencias   
     Min.   :1919-12-01   Min.   :  0.57   Min.   : 1.000  
     1st Qu.:1954-03-27   1st Qu.: 50.22   1st Qu.: 1.000  
     Median :1962-03-31   Median : 58.21   Median : 2.000  
     Mean   :1962-04-26   Mean   : 58.11   Mean   : 2.621  
     3rd Qu.:1970-03-03   3rd Qu.: 66.21   3rd Qu.: 4.000  
     Max.   :2019-11-10   Max.   :100.51   Max.   :11.000  
                                                           

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 28163 casos reconstruídos.

    ## [1] "es_PE.utf8"

![“Positivos por día. MINSA”](plots/positivos-por-dia-minsa.png)

![“Positivos acumulados. MINSA”](plots/positivos-acumulados-minsa.png)

![“Fallecimientos por día.
MINSA”](plots/fallecimientos-por-dia-minsa.png)

![“Fallecimientos acumulados.
MINSA”](plots/fallecimientos-acumulados-minsa.png)

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
