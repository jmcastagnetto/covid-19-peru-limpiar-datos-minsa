[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-07-25 17:32:32 UTC

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
     Length:375961      LIMA       :185156   LIMA            :178704  
     Class :character   CALLAO     : 20333   CALLAO          : 19286  
     Mode  :character   PIURA      : 20206   EN INVESTIGACIÓN: 15122  
                        LAMBAYEQUE : 16256   CHICLAYO        : 10934  
                        LIMA REGION: 15314   AREQUIPA        : 10388  
                        LA LIBERTAD: 13897   TRUJILLO        : 10119  
                        (Other)    :104799   (Other)         :131408  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 17671   PCR:101936   Min.   :  0.00  
     LIMA                  : 15921   PR :274025   1st Qu.: 31.00  
     EN INVESTIGACIÓN      : 15122                Median : 42.00  
     SAN MARTIN DE PORRES  : 12804                Mean   : 43.36  
     CALLAO                : 10974                3rd Qu.: 55.00  
     COMAS                 : 10899                Max.   :120.00  
     (Other)               :292570                NA's   :794     
            sexo        fecha_resultado     
     Femenino :161945   Min.   :2020-03-06  
     Masculino:212018   1st Qu.:2020-05-15  
     NA's     :  1998   Median :2020-06-03  
                        Mean   :2020-06-04  
                        3rd Qu.:2020-06-27  
                        Max.   :2020-07-23  
                        NA's   :522         

         uuid           fecha_fallecimiento       edad               sexo      
     Length:17843       Min.   :2020-03-18   Min.   :  0.00   Femenino : 5231  
     Class :character   1st Qu.:2020-05-08   1st Qu.: 57.00   Masculino:12612  
     Mode  :character   Median :2020-06-05   Median : 66.00                    
                        Mean   :2020-06-03   Mean   : 65.62                    
                        3rd Qu.:2020-06-28   3rd Qu.: 75.00                    
                        Max.   :2020-07-23   Max.   :107.00                    
                                                                               
       fecha_nac               departamento     provincia   
     Min.   :1912-12-15   LIMA       :8413   LIMA    :7370  
     1st Qu.:1944-07-24   LA LIBERTAD:1262   TRUJILLO: 916  
     Median :1953-07-23   PIURA      :1232   CALLAO  : 838  
     Mean   :1954-04-21   LAMBAYEQUE :1201   CHICLAYO: 665  
     3rd Qu.:1962-11-28   CALLAO     : 998   AREQUIPA: 599  
     Max.   :2020-02-12   ANCASH     : 788   (Other) :6117  
     NA's   :1012         (Other)    :3949   NA's    :1338  
                       distrito       edad_calc     
     SAN JUAN DE LURIGANCHO:  863   Min.   :  0.17  
     LIMA                  :  650   1st Qu.: 57.50  
     CALLAO                :  561   Median : 66.88  
     SAN MARTIN DE PORRES  :  549   Mean   : 66.12  
     VILLA EL SALVADOR     :  522   3rd Qu.: 75.89  
     (Other)               :13893   Max.   :107.53  
     NA's                  :  805   NA's   :1012    

      uuid_caso              departamento       provincia     
     Length:239499      LIMA       :187104   LIMA    :187104  
     Class :character   CALLAO     : 19431   CALLAO  : 19431  
     Mode  :character   LA LIBERTAD:  6772   TRUJILLO:  6522  
                        LAMBAYEQUE :  5547   CHICLAYO:  5200  
                        ANCASH     :  4955   SANTA   :  4668  
                        PIURA      :  4896   PIURA   :  2905  
                        (Other)    : 10794   (Other) : 13669  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 46843   PCR: 71809   Min.   :  0.00  
     LIMA                  : 24360   PR :167690   1st Qu.: 50.00  
     SAN MARTIN DE PORRES  : 21052                Median : 58.00  
     COMAS                 : 16658                Mean   : 57.78  
     CALLAO                : 16425                3rd Qu.: 66.00  
     VILLA EL SALVADOR     : 12949                Max.   :101.00  
     (Other)               :101212                                
            sexo        fecha_resultado      uuid_fallecimiento
     Femenino : 46532   Min.   :2020-03-07   Length:239499     
     Masculino:192967   1st Qu.:2020-04-29   Class :character  
                        Median :2020-05-18   Mode  :character  
                        Mean   :2020-05-16                     
                        3rd Qu.:2020-06-01                     
                        Max.   :2020-07-21                     
                                                               
     fecha_fallecimiento    fecha_nac            edad_calc      coincidencias  
     Min.   :2020-03-19   Min.   :1919-01-11   Min.   :  0.26   Min.   : 1.00  
     1st Qu.:2020-06-06   1st Qu.:1953-12-21   1st Qu.: 50.28   1st Qu.: 2.00  
     Median :2020-06-21   Median :1962-01-13   Median : 58.42   Median : 4.00  
     Mean   :2020-06-18   Mean   :1962-03-09   Mean   : 58.28   Mean   : 4.97  
     3rd Qu.:2020-07-08   3rd Qu.:1970-03-12   3rd Qu.: 66.50   3rd Qu.: 7.00  
     Max.   :2020-07-22   Max.   :2020-02-12   Max.   :101.48   Max.   :24.00  
                                                                               

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 43648 casos reconstruídos.

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
