[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-06-22 20:42:12 UTC

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
     Length:254936      LIMA       :144623   LIMA            :134300  
     Class :character   CALLAO     : 16986   CALLAO          : 16109  
     Mode  :character   PIURA      : 15389   EN INVESTIGACIÓN:  8643  
                        LAMBAYEQUE : 12315   CHICLAYO        :  8291  
                        LA LIBERTAD:  8381   PIURA           :  7272  
                        LORETO     :  8335   CORONEL PORTILLO:  6375  
                        (Other)    : 48907   (Other)         : 73946  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 13027   PCR: 61136   Min.   :  0.00  
     LIMA                  : 12311   PR :193800   1st Qu.: 30.00  
     SAN MARTIN DE PORRES  :  9874                Median : 42.00  
     CALLAO                :  9570                Mean   : 43.09  
     EN INVESTIGACIÓN      :  8643                3rd Qu.: 55.00  
     COMAS                 :  7604                Max.   :120.00  
     (Other)               :193907                NA's   :1547    
            sexo        fecha_resultado     
     Femenino :105274   Min.   :2020-03-06  
     Masculino:146854   1st Qu.:2020-05-06  
     NA's     :  2808   Median :2020-05-22  
                        Mean   :2020-05-19  
                        3rd Qu.:2020-06-04  
                        Max.   :2020-12-06  
                        NA's   :1339        

    summary(fallecimientos)

         uuid           fecha_fallecimiento       edad               sexo     
     Length:8045        Min.   :2020-03-19   Min.   :  0.00   Femenino :2356  
     Class :character   1st Qu.:2020-05-02   1st Qu.: 57.00   Masculino:5689  
     Mode  :character   Median :2020-05-27   Median : 66.00                   
                        Mean   :2020-05-20   Mean   : 65.36                   
                        3rd Qu.:2020-06-10   3rd Qu.: 75.00                   
                        Max.   :2020-06-20   Max.   :101.00                   
                                                                              
       fecha_nac               departamento     provincia   
     Min.   :1915-06-19   LIMA       :3674   LIMA    :3064  
     1st Qu.:1944-09-23   LAMBAYEQUE : 705   CALLAO  : 386  
     Median :1953-10-28   PIURA      : 689   PIURA   : 377  
     Mean   :1954-08-02   CALLAO     : 541   TRUJILLO: 321  
     3rd Qu.:1963-02-23   LA LIBERTAD: 441   CHICLAYO: 277  
     Max.   :2020-02-08   ANCASH     : 419   (Other) :2282  
     NA's   :757          (Other)    :1576   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 356   Min.   :  0.17  
     CALLAO                : 300   1st Qu.: 57.22  
     SAN MARTIN DE PORRES  : 294   Median : 66.58  
     LIMA                  : 269   Mean   : 65.80  
     COMAS                 : 237   3rd Qu.: 75.67  
     (Other)               :5784   Max.   :104.86  
     NA's                  : 805   NA's   :757     

    summary(reconstruido)

      uuid_caso              departamento      provincia    
     Length:89841       LIMA       :71813   LIMA    :71257  
     Class :character   CALLAO     : 8220   CALLAO  : 8220  
     Mode  :character   PIURA      : 2361   SANTA   : 1760  
                        ANCASH     : 1803   TRUJILLO: 1563  
                        LA LIBERTAD: 1628   PIURA   : 1481  
                        LAMBAYEQUE : 1523   CHICLAYO: 1366  
                        (Other)    : 2493   (Other) : 4194  
                       distrito     metododx         edad               sexo      
     SAN JUAN DE LURIGANCHO:17362   PCR:25808   Min.   :  0.00   Femenino :16832  
     LIMA                  : 9317   PR :64033   1st Qu.: 50.00   Masculino:73009  
     SAN MARTIN DE PORRES  : 9305               Median : 58.00                    
     CALLAO                : 6866               Mean   : 57.59                    
     COMAS                 : 6027               3rd Qu.: 66.00                    
     VILLA EL SALVADOR     : 4525               Max.   :100.00                    
     (Other)               :36439                                                 
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:89841       Min.   :2020-03-19  
     1st Qu.:2020-04-28   Class :character   1st Qu.:2020-06-02  
     Median :2020-05-14   Mode  :character   Median :2020-06-10  
     Mean   :2020-05-11                      Mean   :2020-06-06  
     3rd Qu.:2020-05-26                      3rd Qu.:2020-06-15  
     Max.   :2020-06-19                      Max.   :2020-06-20  
                                                                 
       fecha_nac            edad_calc      coincidencias   
     Min.   :1919-12-01   Min.   :  0.57   Min.   : 1.000  
     1st Qu.:1954-01-08   1st Qu.: 50.09   1st Qu.: 1.000  
     Median :1962-01-06   Median : 58.42   Median : 2.000  
     Mean   :1962-04-27   Mean   : 58.11   Mean   : 2.758  
     3rd Qu.:1970-05-02   3rd Qu.: 66.41   3rd Qu.: 4.000  
     Max.   :2019-11-10   Max.   :100.51   Max.   :12.000  
                                                           

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 29445 casos reconstruídos.

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
