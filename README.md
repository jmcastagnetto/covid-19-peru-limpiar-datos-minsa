[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-07-01 20:05:39 UTC

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
     Length:285213      LIMA       :158189   LIMA            :145681  
     Class :character   CALLAO     : 17984   CALLAO          : 17042  
     Mode  :character   PIURA      : 16923   EN INVESTIGACIÓN:  9407  
                        LAMBAYEQUE : 13657   CHICLAYO        :  9178  
                        LA LIBERTAD:  9962   PIURA           :  7944  
                        LORETO     :  9023   TRUJILLO        :  7036  
                        (Other)    : 59475   (Other)         : 88925  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 14095   PCR: 71129   Min.   :  0.00  
     LIMA                  : 13175   PR :214084   1st Qu.: 31.00  
     SAN MARTIN DE PORRES  : 10629                Median : 42.00  
     CALLAO                : 10029                Mean   : 43.22  
     EN INVESTIGACIÓN      :  9407                3rd Qu.: 55.00  
     COMAS                 :  8466                Max.   :120.00  
     (Other)               :219412                NA's   :1568    
            sexo        fecha_resultado     
     Femenino :119336   Min.   :2020-03-06  
     Masculino:163069   1st Qu.:2020-05-08  
     NA's     :  2808   Median :2020-05-25  
                        Mean   :2020-05-23  
                        3rd Qu.:2020-06-09  
                        Max.   :2020-06-29  
                        NA's   :1510        

         uuid           fecha_fallecimiento       edad               sexo     
     Length:9677        Min.   :2020-03-19   Min.   :  0.00   Femenino :2812  
     Class :character   1st Qu.:2020-05-05   1st Qu.: 57.00   Masculino:6865  
     Mode  :character   Median :2020-06-02   Median : 66.00                   
                        Mean   :2020-05-26   Mean   : 65.48                   
                        3rd Qu.:2020-06-16   3rd Qu.: 75.00                   
                        Max.   :2020-06-29   Max.   :107.00                   
                                                                              
       fecha_nac               departamento     provincia   
     Min.   :1912-12-15   LIMA       :4489   LIMA    :3771  
     1st Qu.:1944-06-29   PIURA      : 754   CALLAO  : 470  
     Median :1953-09-22   LAMBAYEQUE : 747   TRUJILLO: 432  
     Mean   :1954-06-21   CALLAO     : 625   PIURA   : 411  
     3rd Qu.:1963-01-05   LA LIBERTAD: 585   CHICLAYO: 305  
     Max.   :2020-02-08   ICA        : 476   (Other) :2950  
     NA's   :775          (Other)    :2001   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 448   Min.   :  0.17  
     CALLAO                : 350   1st Qu.: 57.39  
     SAN MARTIN DE PORRES  : 349   Median : 66.68  
     LIMA                  : 324   Mean   : 65.93  
     COMAS                 : 296   3rd Qu.: 75.91  
     (Other)               :7105   Max.   :107.53  
     NA's                  : 805   NA's   :775     

      uuid_caso              departamento      provincia    
     Length:124289      LIMA       :99209   LIMA    :98284  
     Class :character   CALLAO     :11202   CALLAO  :11202  
     Mode  :character   PIURA      : 2800   TRUJILLO: 2650  
                        LA LIBERTAD: 2750   SANTA   : 2311  
                        ANCASH     : 2399   CHICLAYO: 1886  
                        LAMBAYEQUE : 2079   PIURA   : 1806  
                        (Other)    : 3850   (Other) : 6150  
                       distrito     metododx         edad               sexo       
     SAN JUAN DE LURIGANCHO:24553   PCR:35878   Min.   :  0.00   Femenino : 23444  
     LIMA                  :12903   PR :88411   1st Qu.: 49.00   Masculino:100845  
     SAN MARTIN DE PORRES  :12343               Median : 58.00                     
     CALLAO                : 9502               Mean   : 57.56                     
     COMAS                 : 8660               3rd Qu.: 66.00                     
     VILLA EL SALVADOR     : 6206               Max.   :100.00                     
     (Other)               :50122                                                  
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:124289      Min.   :2020-03-19  
     1st Qu.:2020-04-29   Class :character   1st Qu.:2020-06-05  
     Median :2020-05-16   Mode  :character   Median :2020-06-14  
     Mean   :2020-05-14                      Mean   :2020-06-11  
     3rd Qu.:2020-05-28                      3rd Qu.:2020-06-21  
     Max.   :2020-06-28                      Max.   :2020-06-29  
                                                                 
       fecha_nac            edad_calc      coincidencias   
     Min.   :1919-12-01   Min.   :  0.57   Min.   : 1.000  
     1st Qu.:1954-01-20   1st Qu.: 49.87   1st Qu.: 1.000  
     Median :1962-01-30   Median : 58.40   Median : 3.000  
     Mean   :1962-05-14   Mean   : 58.08   Mean   : 3.286  
     3rd Qu.:1970-07-26   3rd Qu.: 66.41   3rd Qu.: 5.000  
     Max.   :2019-11-10   Max.   :100.51   Max.   :14.000  
                                                           

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 33767 casos reconstruídos.

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
