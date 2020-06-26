[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-06-26 16:48:01 UTC

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
     Length:268602      LIMA       :151225   LIMA            :139845  
     Class :character   CALLAO     : 17449   CALLAO          : 16541  
     Mode  :character   PIURA      : 16101   CHICLAYO        :  8652  
                        LAMBAYEQUE : 12892   EN INVESTIGACIÓN:  8296  
                        LA LIBERTAD:  9090   PIURA           :  7589  
                        LORETO     :  8743   CORONEL PORTILLO:  6650  
                        (Other)    : 53102   (Other)         : 81029  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 13598   PCR: 66001   Min.   :  0.00  
     LIMA                  : 12736   PR :202601   1st Qu.: 30.00  
     SAN MARTIN DE PORRES  : 10222                Median : 42.00  
     CALLAO                :  9771                Mean   : 43.15  
     EN INVESTIGACIÓN      :  8296                3rd Qu.: 55.00  
     COMAS                 :  7977                Max.   :120.00  
     (Other)               :206002                NA's   :1559    
            sexo        fecha_resultado     
     Femenino :111612   Min.   :2020-03-06  
     Masculino:154182   1st Qu.:2020-05-07  
     NA's     :  2808   Median :2020-05-23  
                        Mean   :2020-05-21  
                        3rd Qu.:2020-06-06  
                        Max.   :2020-06-24  
                        NA's   :1510        

         uuid           fecha_fallecimiento       edad              sexo     
     Length:8761        Min.   :2020-03-19   Min.   :  0.0   Femenino :2541  
     Class :character   1st Qu.:2020-05-03   1st Qu.: 57.0   Masculino:6220  
     Mode  :character   Median :2020-05-29   Median : 66.0                   
                        Mean   :2020-05-23   Mean   : 65.4                   
                        3rd Qu.:2020-06-12   3rd Qu.: 75.0                   
                        Max.   :2020-06-24   Max.   :101.0                   
                                                                             
       fecha_nac               departamento     provincia   
     Min.   :1915-06-19   LIMA       :4029   LIMA    :3374  
     1st Qu.:1944-08-25   PIURA      : 725   CALLAO  : 417  
     Median :1953-10-20   LAMBAYEQUE : 722   PIURA   : 396  
     Mean   :1954-07-21   CALLAO     : 572   TRUJILLO: 378  
     3rd Qu.:1963-01-27   LA LIBERTAD: 515   CHICLAYO: 289  
     Max.   :2020-02-08   ICA        : 442   (Other) :2569  
     NA's   :768          (Other)    :1756   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 396   Min.   :  0.17  
     CALLAO                : 319   1st Qu.: 57.31  
     SAN MARTIN DE PORRES  : 316   Median : 66.62  
     LIMA                  : 290   Mean   : 65.84  
     COMAS                 : 270   3rd Qu.: 75.78  
     (Other)               :6365   Max.   :104.86  
     NA's                  : 805   NA's   :768     

      uuid_caso              departamento      provincia    
     Length:103629      LIMA       :82675   LIMA    :81952  
     Class :character   CALLAO     : 9397   CALLAO  : 9397  
     Mode  :character   PIURA      : 2589   TRUJILLO: 2066  
                        LA LIBERTAD: 2154   SANTA   : 2002  
                        ANCASH     : 2058   PIURA   : 1630  
                        LAMBAYEQUE : 1701   CHICLAYO: 1525  
                        (Other)    : 3055   (Other) : 5057  
                       distrito     metododx         edad              sexo      
     SAN JUAN DE LURIGANCHO:19714   PCR:29903   Min.   :  0.0   Femenino :19218  
     LIMA                  :10530   PR :73726   1st Qu.: 50.0   Masculino:84411  
     SAN MARTIN DE PORRES  :10480               Median : 58.0                    
     CALLAO                : 7897               Mean   : 57.7                    
     COMAS                 : 7558               3rd Qu.: 66.0                    
     VILLA EL SALVADOR     : 5233               Max.   :100.0                    
     (Other)               :42217                                                
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:103629      Min.   :2020-03-19  
     1st Qu.:2020-04-28   Class :character   1st Qu.:2020-06-03  
     Median :2020-05-15   Mode  :character   Median :2020-06-11  
     Mean   :2020-05-12                      Mean   :2020-06-08  
     3rd Qu.:2020-05-27                      3rd Qu.:2020-06-17  
     Max.   :2020-06-23                      Max.   :2020-06-24  
                                                                 
       fecha_nac            edad_calc      coincidencias   
     Min.   :1919-12-01   Min.   :  0.57   Min.   : 1.000  
     1st Qu.:1953-12-18   1st Qu.: 50.25   1st Qu.: 1.000  
     Median :1961-11-11   Median : 58.60   Median : 2.000  
     Mean   :1962-03-21   Mean   : 58.22   Mean   : 2.985  
     3rd Qu.:1970-03-03   3rd Qu.: 66.46   3rd Qu.: 4.000  
     Max.   :2019-11-10   Max.   :100.51   Max.   :12.000  
                                                           

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 30593 casos reconstruídos.

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
