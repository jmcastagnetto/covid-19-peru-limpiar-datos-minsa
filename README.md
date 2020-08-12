[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-08-12 23:03:35 UTC

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
     Length:489680      LIMA       :227270   LIMA            :216913  
     Class :character   CALLAO     : 23272   EN INVESTIGACIÓN: 23119  
     Mode  :character   PIURA      : 22948   CALLAO          : 22070  
                        AREQUIPA   : 20276   AREQUIPA        : 18046  
                        LIMA REGION: 19854   TRUJILLO        : 12956  
                        LAMBAYEQUE : 18984   CHICLAYO        : 12697  
                        (Other)    :157076   (Other)         :183879  
                       distrito      metododx          edad       
     EN INVESTIGACIÓN      : 23119   PCR:125298   Min.   :  0.00  
     SAN JUAN DE LURIGANCHO: 21612   PR :364382   1st Qu.: 31.00  
     LIMA                  : 18875                Median : 42.00  
     SAN MARTIN DE PORRES  : 15031                Mean   : 43.25  
     COMAS                 : 13297                3rd Qu.: 55.00  
     CALLAO                : 12278                Max.   :120.00  
     (Other)               :385468                NA's   :59      
            sexo        fecha_resultado     
     Femenino :218743   Min.   :2020-03-06  
     Masculino:270937   1st Qu.:2020-05-21  
                        Median :2020-06-16  
                        Mean   :2020-06-17  
                        3rd Qu.:2020-07-21  
                        Max.   :2020-08-10  
                                            

         uuid           fecha_fallecimiento       edad               sexo      
     Length:21501       Min.   :2020-03-18   Min.   :  0.00   Femenino : 6295  
     Class :character   1st Qu.:2020-05-13   1st Qu.: 57.00   Masculino:15206  
     Mode  :character   Median :2020-06-13   Median : 66.00                    
                        Mean   :2020-06-11   Mean   : 65.65                    
                        3rd Qu.:2020-07-11   3rd Qu.: 75.00                    
                        Max.   :2020-08-10   Max.   :107.00                    
                                                                               
       fecha_nac               departamento      provincia   
     Min.   :1912-12-15   LIMA       :10099   LIMA    :8834  
     1st Qu.:1944-06-27   LA LIBERTAD: 1447   TRUJILLO:1031  
     Median :1953-08-05   PIURA      : 1327   CALLAO  : 944  
     Mean   :1954-04-25   LAMBAYEQUE : 1268   AREQUIPA: 853  
     3rd Qu.:1962-12-15   CALLAO     : 1105   CHICLAYO: 717  
     Max.   :2020-02-12   ICA        : 1000   (Other) :7844  
     NA's   :1379         (Other)    : 5255   NA's    :1278  
                       distrito       edad_calc     
     SAN JUAN DE LURIGANCHO: 1055   Min.   :  0.17  
     LIMA                  :  751   1st Qu.: 57.47  
     CALLAO                :  635   Median : 66.86  
     SAN MARTIN DE PORRES  :  621   Mean   : 66.13  
     COMAS                 :  595   3rd Qu.: 75.95  
     (Other)               :17096   Max.   :107.53  
     NA's                  :  748   NA's   :1379    

      uuid_caso              departamento       provincia     
     Length:322796      LIMA       :254914   LIMA    :254914  
     Class :character   CALLAO     : 23788   CALLAO  : 23788  
     Mode  :character   LA LIBERTAD:  8667   TRUJILLO:  8324  
                        LAMBAYEQUE :  6349   CHICLAYO:  5919  
                        ANCASH     :  6016   SANTA   :  5644  
                        PIURA      :  5610   AREQUIPA:  3914  
                        (Other)    : 17452   (Other) : 20293  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 66283   PCR: 97475   Min.   :  0.00  
     LIMA                  : 31274   PR :225321   1st Qu.: 50.00  
     SAN MARTIN DE PORRES  : 27049                Median : 58.00  
     COMAS                 : 22372                Mean   : 57.71  
     CALLAO                : 20366                3rd Qu.: 66.00  
     ATE                   : 16513                Max.   :101.00  
     (Other)               :138939                                
            sexo        fecha_resultado      uuid_fallecimiento
     Femenino : 63838   Min.   :2020-03-07   Length:322796     
     Masculino:258958   1st Qu.:2020-05-01   Class :character  
                        Median :2020-05-20   Mode  :character  
                        Mean   :2020-05-21                     
                        3rd Qu.:2020-06-07                     
                        Max.   :2020-08-07                     
                                                               
     fecha_fallecimiento    fecha_nac            edad_calc      coincidencias 
     Min.   :2020-03-19   Min.   :1919-01-11   Min.   :  0.26   Min.   : 1.0  
     1st Qu.:2020-06-10   1st Qu.:1954-01-15   1st Qu.: 50.35   1st Qu.: 2.0  
     Median :2020-06-30   Median :1961-12-18   Median : 58.49   Median : 4.0  
     Mean   :2020-06-28   Mean   :1962-04-09   Mean   : 58.22   Mean   : 5.7  
     3rd Qu.:2020-07-22   3rd Qu.:1970-02-22   3rd Qu.: 66.50   3rd Qu.: 8.0  
     Max.   :2020-08-08   Max.   :2020-02-12   Max.   :101.48   Max.   :27.0  
                                                                              

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 54941 casos reconstruídos.

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
