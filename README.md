[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-07-28 15:28:32 UTC

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
     Length:389717      LIMA       :190422   LIMA            :183545  
     Class :character   CALLAO     : 20679   CALLAO          : 19605  
     Mode  :character   PIURA      : 20498   EN INVESTIGACIÓN: 16062  
                        LAMBAYEQUE : 16604   AREQUIPA        : 11270  
                        LIMA REGION: 16292   CHICLAYO        : 11144  
                        LA LIBERTAD: 14377   TRUJILLO        : 10489  
                        (Other)    :110845   (Other)         :137602  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 18134   PCR:106210   Min.   :  0.00  
     LIMA                  : 16237   PR :283507   1st Qu.: 31.00  
     EN INVESTIGACIÓN      : 16062                Median : 42.00  
     SAN MARTIN DE PORRES  : 13124                Mean   : 43.37  
     COMAS                 : 11278                3rd Qu.: 55.00  
     CALLAO                : 11085                Max.   :120.00  
     (Other)               :303797                NA's   :803     
            sexo        fecha_resultado     
     Femenino :168543   Min.   :2020-03-06  
     Masculino:219176   1st Qu.:2020-05-15  
     NA's     :  1998   Median :2020-06-05  
                        Mean   :2020-06-05  
                        3rd Qu.:2020-06-30  
                        Max.   :2020-07-26  
                        NA's   :522         

         uuid           fecha_fallecimiento       edad               sexo      
     Length:18418       Min.   :2020-03-18   Min.   :  0.00   Femenino : 5388  
     Class :character   1st Qu.:2020-05-09   1st Qu.: 57.00   Masculino:13030  
     Mode  :character   Median :2020-06-07   Median : 66.00                    
                        Mean   :2020-06-04   Mean   : 65.62                    
                        3rd Qu.:2020-06-30   3rd Qu.: 75.00                    
                        Max.   :2020-07-26   Max.   :107.00                    
                                                                               
       fecha_nac               departamento     provincia   
     Min.   :1912-12-15   LIMA       :8699   LIMA    :7569  
     1st Qu.:1944-07-11   LA LIBERTAD:1294   TRUJILLO: 937  
     Median :1953-07-28   PIURA      :1246   CALLAO  : 852  
     Mean   :1954-04-24   LAMBAYEQUE :1207   CHICLAYO: 668  
     3rd Qu.:1962-12-02   CALLAO     :1012   AREQUIPA: 643  
     Max.   :2020-02-12   ANCASH     : 810   (Other) :6411  
     NA's   :853          (Other)    :4150   NA's    :1338  
                       distrito       edad_calc     
     SAN JUAN DE LURIGANCHO:  896   Min.   :  0.17  
     LIMA                  :  656   1st Qu.: 57.49  
     CALLAO                :  570   Median : 66.86  
     SAN MARTIN DE PORRES  :  556   Mean   : 66.12  
     VILLA EL SALVADOR     :  534   3rd Qu.: 75.90  
     (Other)               :14401   Max.   :107.53  
     NA's                  :  805   NA's   :853     

      uuid_caso              departamento       provincia     
     Length:255779      LIMA       :200138   LIMA    :200138  
     Class :character   CALLAO     : 20516   CALLAO  : 20516  
     Mode  :character   LA LIBERTAD:  7253   TRUJILLO:  6990  
                        LAMBAYEQUE :  5605   CHICLAYO:  5239  
                        ANCASH     :  5250   SANTA   :  4949  
                        PIURA      :  5011   PIURA   :  2981  
                        (Other)    : 12006   (Other) : 14966  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 50778   PCR: 77179   Min.   :  0.00  
     LIMA                  : 25336   PR :178600   1st Qu.: 50.00  
     SAN MARTIN DE PORRES  : 21847                Median : 58.00  
     COMAS                 : 17481                Mean   : 57.76  
     CALLAO                : 17417                3rd Qu.: 66.00  
     VILLA EL SALVADOR     : 13741                Max.   :101.00  
     (Other)               :109179                                
            sexo        fecha_resultado      uuid_fallecimiento
     Femenino : 49936   Min.   :2020-03-07   Length:255779     
     Masculino:205843   1st Qu.:2020-04-29   Class :character  
                        Median :2020-05-18   Mode  :character  
                        Mean   :2020-05-17                     
                        3rd Qu.:2020-06-02                     
                        Max.   :2020-07-25                     
                                                               
     fecha_fallecimiento    fecha_nac            edad_calc      coincidencias   
     Min.   :2020-03-19   Min.   :1919-01-11   Min.   :  0.26   Min.   : 1.000  
     1st Qu.:2020-06-07   1st Qu.:1953-12-25   1st Qu.: 50.28   1st Qu.: 2.000  
     Median :2020-06-24   Median :1961-12-25   Median : 58.46   Median : 4.000  
     Mean   :2020-06-21   Mean   :1962-03-15   Mean   : 58.27   Mean   : 5.108  
     3rd Qu.:2020-07-11   3rd Qu.:1970-03-24   3rd Qu.: 66.46   3rd Qu.: 7.000  
     Max.   :2020-07-26   Max.   :2020-02-12   Max.   :101.48   Max.   :25.000  
                                                                                

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 45651 casos reconstruídos.

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
