[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-07-05 23:35:54 UTC

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
     Length:299080      LIMA       :163824   LIMA            :150432  
     Class :character   CALLAO     : 18339   CALLAO          : 17388  
     Mode  :character   PIURA      : 17721   EN INVESTIGACIÓN: 10286  
                        LAMBAYEQUE : 14137   CHICLAYO        :  9510  
                        LA LIBERTAD: 10727   PIURA           :  8398  
                        LORETO     :  9343   TRUJILLO        :  7567  
                        (Other)    : 64989   (Other)         : 95499  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 14637   PCR: 74869   Min.   :  0.00  
     LIMA                  : 13604   PR :224211   1st Qu.: 31.00  
     SAN MARTIN DE PORRES  : 10941                Median : 42.00  
     EN INVESTIGACIÓN      : 10286                Mean   : 43.27  
     CALLAO                : 10157                3rd Qu.: 55.00  
     COMAS                 :  8803                Max.   :120.00  
     (Other)               :230652                NA's   :1573    
            sexo        fecha_resultado     
     Femenino :125724   Min.   :2020-03-06  
     Masculino:170548   1st Qu.:2020-05-09  
     NA's     :  2808   Median :2020-05-26  
                        Mean   :2020-05-25  
                        3rd Qu.:2020-06-11  
                        Max.   :2020-07-03  
                        NA's   :1510        

         uuid           fecha_fallecimiento       edad               sexo     
     Length:10412       Min.   :2020-03-19   Min.   :  0.00   Femenino :3039  
     Class :character   1st Qu.:2020-05-07   1st Qu.: 57.00   Masculino:7373  
     Mode  :character   Median :2020-06-04   Median : 66.00                   
                        Mean   :2020-05-28   Mean   : 65.53                   
                        3rd Qu.:2020-06-19   3rd Qu.: 75.00                   
                        Max.   :2020-07-03   Max.   :107.00                   
                                                                              
       fecha_nac               departamento     provincia   
     Min.   :1912-12-15   LIMA       :4814   LIMA    :4064  
     1st Qu.:1944-07-06   PIURA      : 787   CALLAO  : 495  
     Median :1953-08-07   LAMBAYEQUE : 768   TRUJILLO: 480  
     Mean   :1954-05-31   LA LIBERTAD: 651   PIURA   : 426  
     3rd Qu.:1962-11-29   CALLAO     : 650   CHICLAYO: 322  
     Max.   :2020-02-12   ICA        : 513   (Other) :3287  
     NA's   :775          (Other)    :2229   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 488   Min.   :  0.17  
     SAN MARTIN DE PORRES  : 366   1st Qu.: 57.49  
     CALLAO                : 358   Median : 66.81  
     LIMA                  : 345   Mean   : 66.00  
     COMAS                 : 320   3rd Qu.: 75.90  
     (Other)               :7730   Max.   :107.53  
     NA's                  : 805   NA's   :775     

      uuid_caso              departamento       provincia     
     Length:138174      LIMA       :110019   LIMA    :108991  
     Class :character   CALLAO     : 12032   CALLAO  : 12032  
     Mode  :character   LA LIBERTAD:  3278   TRUJILLO:  3161  
                        PIURA      :  3029   SANTA   :  2567  
                        ANCASH     :  2676   CHICLAYO:  2072  
                        LAMBAYEQUE :  2277   PIURA   :  1937  
                        (Other)    :  4863   (Other) :  7414  
                       distrito     metododx         edad              sexo       
     SAN JUAN DE LURIGANCHO:27568   PCR:39962   Min.   :  0.0   Femenino : 26584  
     LIMA                  :14234   PR :98212   1st Qu.: 50.0   Masculino:111590  
     SAN MARTIN DE PORRES  :13172               Median : 58.0                     
     CALLAO                :10186               Mean   : 57.7                     
     COMAS                 : 9939               3rd Qu.: 66.0                     
     VILLA EL SALVADOR     : 6704               Max.   :100.0                     
     (Other)               :56371                                                 
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:138174      Min.   :2020-03-19  
     1st Qu.:2020-04-30   Class :character   1st Qu.:2020-06-06  
     Median :2020-05-18   Mode  :character   Median :2020-06-15  
     Mean   :2020-05-15                      Mean   :2020-06-13  
     3rd Qu.:2020-05-29                      3rd Qu.:2020-06-24  
     Max.   :2020-07-02                      Max.   :2020-07-03  
                                                                 
       fecha_nac            edad_calc      coincidencias   
     Min.   :1919-12-01   Min.   :  0.39   Min.   : 1.000  
     1st Qu.:1953-11-08   1st Qu.: 50.03   1st Qu.: 1.000  
     Median :1961-12-15   Median : 58.52   Median : 3.000  
     Mean   :1962-03-26   Mean   : 58.22   Mean   : 3.475  
     3rd Qu.:1970-06-05   3rd Qu.: 66.60   3rd Qu.: 5.000  
     Max.   :2020-02-12   Max.   :100.51   Max.   :15.000  
                                                           

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 35514 casos reconstruídos.

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
