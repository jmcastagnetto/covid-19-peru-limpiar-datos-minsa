[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-07-04 23:53:11 UTC

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
     Length:295599      LIMA       :162211   LIMA            :149053  
     Class :character   CALLAO     : 18281   CALLAO          : 17333  
     Mode  :character   PIURA      : 17573   EN INVESTIGACIÓN: 10067  
                        LAMBAYEQUE : 14011   CHICLAYO        :  9420  
                        LA LIBERTAD: 10509   PIURA           :  8310  
                        LORETO     :  9280   TRUJILLO        :  7413  
                        (Other)    : 63734   (Other)         : 94003  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 14466   PCR: 74043   Min.   :  0.00  
     LIMA                  : 13482   PR :221556   1st Qu.: 31.00  
     SAN MARTIN DE PORRES  : 10851                Median : 42.00  
     CALLAO                : 10136                Mean   : 43.25  
     EN INVESTIGACIÓN      : 10067                3rd Qu.: 55.00  
     COMAS                 :  8715                Max.   :120.00  
     (Other)               :227882                NA's   :1572    
            sexo        fecha_resultado     
     Femenino :124089   Min.   :2020-03-06  
     Masculino:168702   1st Qu.:2020-05-08  
     NA's     :  2808   Median :2020-05-26  
                        Mean   :2020-05-24  
                        3rd Qu.:2020-06-11  
                        Max.   :2020-07-02  
                        NA's   :1510        

         uuid           fecha_fallecimiento       edad               sexo     
     Length:10226       Min.   :2020-03-19   Min.   :  0.00   Femenino :2984  
     Class :character   1st Qu.:2020-05-06   1st Qu.: 57.00   Masculino:7242  
     Mode  :character   Median :2020-06-04   Median : 66.00                   
                        Mean   :2020-05-28   Mean   : 65.52                   
                        3rd Qu.:2020-06-18   3rd Qu.: 75.00                   
                        Max.   :2020-07-02   Max.   :107.00                   
                                                                              
       fecha_nac               departamento     provincia   
     Min.   :1912-12-15   LIMA       :4725   LIMA    :3982  
     1st Qu.:1944-06-23   PIURA      : 782   CALLAO  : 491  
     Median :1953-08-10   LAMBAYEQUE : 764   TRUJILLO: 466  
     Mean   :1954-06-04   CALLAO     : 646   PIURA   : 424  
     3rd Qu.:1962-12-14   LA LIBERTAD: 632   CHICLAYO: 319  
     Max.   :2020-02-12   ICA        : 502   (Other) :3206  
     NA's   :775          (Other)    :2175   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 478   Min.   :  0.17  
     SAN MARTIN DE PORRES  : 358   1st Qu.: 57.44  
     CALLAO                : 356   Median : 66.80  
     LIMA                  : 341   Mean   : 65.99  
     COMAS                 : 314   3rd Qu.: 75.94  
     (Other)               :7574   Max.   :107.53  
     NA's                  : 805   NA's   :775     

      uuid_caso              departamento       provincia     
     Length:134469      LIMA       :107071   LIMA    :106078  
     Class :character   CALLAO     : 11927   CALLAO  : 11927  
     Mode  :character   LA LIBERTAD:  3034   TRUJILLO:  2922  
                        PIURA      :  2982   SANTA   :  2507  
                        ANCASH     :  2613   CHICLAYO:  2015  
                        LAMBAYEQUE :  2217   PIURA   :  1928  
                        (Other)    :  4625   (Other) :  7092  
                       distrito     metododx         edad               sexo       
     SAN JUAN DE LURIGANCHO:26834   PCR:38815   Min.   :  0.00   Femenino : 25624  
     LIMA                  :13845   PR :95654   1st Qu.: 49.00   Masculino:108845  
     SAN MARTIN DE PORRES  :12760               Median : 58.00                     
     CALLAO                :10113               Mean   : 57.68                     
     COMAS                 : 9620               3rd Qu.: 66.00                     
     VILLA EL SALVADOR     : 6615               Max.   :100.00                     
     (Other)               :54682                                                  
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:134469      Min.   :2020-03-19  
     1st Qu.:2020-04-29   Class :character   1st Qu.:2020-06-06  
     Median :2020-05-17   Mode  :character   Median :2020-06-15  
     Mean   :2020-05-14                      Mean   :2020-06-12  
     3rd Qu.:2020-05-28                      3rd Qu.:2020-06-23  
     Max.   :2020-07-01                      Max.   :2020-07-02  
                                                                 
       fecha_nac            edad_calc      coincidencias   
     Min.   :1919-12-01   Min.   :  0.39   Min.   : 1.000  
     1st Qu.:1953-11-08   1st Qu.: 49.99   1st Qu.: 1.000  
     Median :1961-12-27   Median : 58.46   Median : 3.000  
     Mean   :1962-04-02   Mean   : 58.20   Mean   : 3.432  
     3rd Qu.:1970-06-11   3rd Qu.: 66.60   3rd Qu.: 5.000  
     Max.   :2020-02-12   Max.   :100.51   Max.   :15.000  
                                                           

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 35068 casos reconstruídos.

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
