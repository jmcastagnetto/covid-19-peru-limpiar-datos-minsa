[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-07-17 15:26:10 UTC

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
     Length:341586      LIMA       :170793   LIMA            :165943  
     Class :character   CALLAO     : 19444   CALLAO          : 18441  
     Mode  :character   PIURA      : 19190   EN INVESTIGACIÓN: 12981  
                        LAMBAYEQUE : 15395   CHICLAYO        : 10370  
                        LIMA REGION: 12632   PIURA           :  9135  
                        LA LIBERTAD: 12626   TRUJILLO        :  9055  
                        (Other)    : 91506   (Other)         :115661  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 16248   PCR: 90047   Min.   :  0.00  
     LIMA                  : 15039   PR :251539   1st Qu.: 31.00  
     EN INVESTIGACIÓN      : 12981                Median : 42.00  
     SAN MARTIN DE PORRES  : 11954                Mean   : 43.37  
     CALLAO                : 10588                3rd Qu.: 55.00  
     COMAS                 : 10047                Max.   :120.00  
     (Other)               :264729                NA's   :1522    
            sexo        fecha_resultado     
     Femenino :145717   Min.   :2020-03-06  
     Masculino:193142   1st Qu.:2020-05-12  
     NA's     :  2727   Median :2020-05-29  
                        Mean   :2020-05-30  
                        3rd Qu.:2020-06-20  
                        Max.   :2020-07-15  
                        NA's   :1252        

         uuid           fecha_fallecimiento       edad               sexo     
     Length:12615       Min.   :2020-03-19   Min.   :  0.00   Femenino :3702  
     Class :character   1st Qu.:2020-05-12   1st Qu.: 57.00   Masculino:8913  
     Mode  :character   Median :2020-06-10   Median : 66.00                   
                        Mean   :2020-06-04   Mean   : 65.68                   
                        3rd Qu.:2020-06-27   3rd Qu.: 75.00                   
                        Max.   :2020-07-15   Max.   :107.00                   
                                                                              
       fecha_nac               departamento     provincia   
     Min.   :1912-12-15   LIMA       :5856   LIMA    :4932  
     1st Qu.:1944-06-10   PIURA      : 860   TRUJILLO: 613  
     Median :1953-07-06   LA LIBERTAD: 841   CALLAO  : 588  
     Mean   :1954-04-06   LAMBAYEQUE : 808   PIURA   : 460  
     3rd Qu.:1962-11-24   CALLAO     : 748   AREQUIPA: 455  
     Max.   :2020-02-12   ICA        : 652   (Other) :4229  
     NA's   :788          (Other)    :2850   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 590   Min.   :  0.17  
     SAN MARTIN DE PORRES  : 425   1st Qu.: 57.55  
     CALLAO                : 399   Median : 66.93  
     COMAS                 : 398   Mean   : 66.17  
     LIMA                  : 387   3rd Qu.: 75.99  
     (Other)               :9611   Max.   :107.53  
     NA's                  : 805   NA's   :788     

      uuid_caso              departamento       provincia     
     Length:181365      LIMA       :144354   LIMA    :144354  
     Class :character   CALLAO     : 14942   CALLAO  : 14942  
     Mode  :character   LA LIBERTAD:  4924   TRUJILLO:  4723  
                        PIURA      :  3516   SANTA   :  3141  
                        ANCASH     :  3378   PIURA   :  2276  
                        LAMBAYEQUE :  2509   CHICLAYO:  2269  
                        (Other)    :  7742   (Other) :  9660  
                       distrito     metododx          edad       
     SAN JUAN DE LURIGANCHO:36759   PCR: 53171   Min.   :  0.00  
     LIMA                  :17522   PR :128194   1st Qu.: 50.00  
     SAN MARTIN DE PORRES  :16842                Median : 58.00  
     COMAS                 :13908                Mean   : 57.83  
     CALLAO                :12446                3rd Qu.: 66.00  
     VILLA EL SALVADOR     : 9209                Max.   :101.00  
     (Other)               :74679                                
            sexo        fecha_resultado      uuid_fallecimiento
     Femenino : 35211   Min.   :2020-03-07   Length:181365     
     Masculino:146154   1st Qu.:2020-05-01   Class :character  
                        Median :2020-05-20   Mode  :character  
                        Mean   :2020-05-17                     
                        3rd Qu.:2020-06-01                     
                        Max.   :2020-07-14                     
                                                               
     fecha_fallecimiento    fecha_nac            edad_calc      coincidencias   
     Min.   :2020-03-19   Min.   :1919-01-11   Min.   :  0.39   Min.   : 1.000  
     1st Qu.:2020-06-10   1st Qu.:1953-11-25   1st Qu.: 50.49   1st Qu.: 2.000  
     Median :2020-06-21   Median :1961-12-25   Median : 58.52   Median : 3.000  
     Mean   :2020-06-19   Mean   :1962-02-15   Mean   : 58.34   Mean   : 4.085  
     3rd Qu.:2020-07-03   3rd Qu.:1969-12-13   3rd Qu.: 66.54   3rd Qu.: 6.000  
     Max.   :2020-07-15   Max.   :2020-02-12   Max.   :101.48   Max.   :17.000  
                                                                                

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 39152 casos reconstruídos.

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
