[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-07-21 00:57:29 UTC

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
     Length:353590      LIMA       :176221   LIMA            :170742  
     Class :character   CALLAO     : 19794   CALLAO          : 18782  
     Mode  :character   PIURA      : 19463   EN INVESTIGACIÓN: 14004  
                        LAMBAYEQUE : 15753   CHICLAYO        : 10612  
                        LIMA REGION: 13644   TRUJILLO        :  9460  
                        LA LIBERTAD: 13074   PIURA           :  9306  
                        (Other)    : 95641   (Other)         :120684  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 16781   PCR: 95340   Min.   :  0.00  
     LIMA                  : 15378   PR :258250   1st Qu.: 31.00  
     EN INVESTIGACIÓN      : 14004                Median : 42.00  
     SAN MARTIN DE PORRES  : 12291                Mean   : 43.36  
     CALLAO                : 10727                3rd Qu.: 55.00  
     COMAS                 : 10386                Max.   :120.00  
     (Other)               :274023                NA's   :1484    
            sexo        fecha_resultado     
     Femenino :151435   Min.   :2020-03-06  
     Masculino:199469   1st Qu.:2020-05-13  
     NA's     :  2686   Median :2020-05-31  
                        Mean   :2020-06-01  
                        3rd Qu.:2020-06-23  
                        Max.   :2020-07-18  
                        NA's   :1211        

         uuid           fecha_fallecimiento       edad               sexo     
     Length:13187       Min.   :2020-03-19   Min.   :  0.00   Femenino :3872  
     Class :character   1st Qu.:2020-05-14   1st Qu.: 57.00   Masculino:9315  
     Mode  :character   Median :2020-06-12   Median : 66.00                   
                        Mean   :2020-06-06   Mean   : 65.67                   
                        3rd Qu.:2020-06-30   3rd Qu.: 75.00                   
                        Max.   :2020-07-18   Max.   :107.00                   
                                                                              
       fecha_nac               departamento     provincia   
     Min.   :1912-12-15   LIMA       :6122   LIMA    :5172  
     1st Qu.:1944-06-11   LA LIBERTAD: 876   TRUJILLO: 642  
     Median :1953-07-17   PIURA      : 874   CALLAO  : 610  
     Mean   :1954-04-12   LAMBAYEQUE : 819   AREQUIPA: 513  
     3rd Qu.:1962-11-28   CALLAO     : 770   PIURA   : 465  
     Max.   :2020-02-12   ICA        : 678   (Other) :4447  
     NA's   :788          (Other)    :3048   NA's    :1338  
                       distrito       edad_calc     
     SAN JUAN DE LURIGANCHO:  613   Min.   :  0.17  
     SAN MARTIN DE PORRES  :  447   1st Qu.: 57.54  
     COMAS                 :  412   Median : 66.91  
     CALLAO                :  411   Mean   : 66.16  
     LIMA                  :  408   3rd Qu.: 76.00  
     (Other)               :10091   Max.   :107.53  
     NA's                  :  805   NA's   :788     

      uuid_caso              departamento       provincia     
     Length:195292      LIMA       :155232   LIMA    :155232  
     Class :character   CALLAO     : 16003   CALLAO  : 16003  
     Mode  :character   LA LIBERTAD:  5368   TRUJILLO:  5158  
                        ANCASH     :  3664   SANTA   :  3406  
                        PIURA      :  3619   CHICLAYO:  2535  
                        LAMBAYEQUE :  2778   PIURA   :  2338  
                        (Other)    :  8628   (Other) : 10620  
                       distrito     metododx          edad              sexo       
     SAN JUAN DE LURIGANCHO:39544   PCR: 57425   Min.   :  0.0   Femenino : 37603  
     LIMA                  :19334   PR :137867   1st Qu.: 50.0   Masculino:157689  
     SAN MARTIN DE PORRES  :18469                Median : 58.0                     
     COMAS                 :14736                Mean   : 57.7                     
     CALLAO                :13392                3rd Qu.: 66.0                     
     VILLA EL SALVADOR     : 9721                Max.   :101.0                     
     (Other)               :80096                                                  
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:195292      Min.   :2020-03-19  
     1st Qu.:2020-05-02   Class :character   1st Qu.:2020-06-10  
     Median :2020-05-20   Mode  :character   Median :2020-06-23  
     Mean   :2020-05-18                      Mean   :2020-06-21  
     3rd Qu.:2020-06-02                      3rd Qu.:2020-07-06  
     Max.   :2020-07-17                      Max.   :2020-07-18  
                                                                 
       fecha_nac            edad_calc      coincidencias   
     Min.   :1919-01-11   Min.   :  0.39   Min.   : 1.000  
     1st Qu.:1954-01-08   1st Qu.: 50.18   1st Qu.: 2.000  
     Median :1962-01-20   Median : 58.41   Median : 3.000  
     Mean   :1962-04-07   Mean   : 58.21   Mean   : 4.224  
     3rd Qu.:1970-04-14   3rd Qu.: 66.44   3rd Qu.: 6.000  
     Max.   :2020-02-12   Max.   :101.48   Max.   :18.000  
                                                           

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 41136 casos reconstruídos.

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
