[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-07-08 14:56:26 UTC

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
     Length:309278      LIMA       :158761   LIMA            :154333  
     Class :character   CALLAO     : 18510   EN INVESTIGACIÓN: 18754  
     Mode  :character   PIURA      : 18028   CALLAO          : 17547  
                        LAMBAYEQUE : 14454   CHICLAYO        :  9731  
                        LA LIBERTAD: 11171   PIURA           :  8572  
                        LIMA REGION:  9605   TRUJILLO        :  7890  
                        (Other)    : 78749   (Other)         : 92451  
                       distrito      metododx          edad       
     EN INVESTIGACIÓN      : 18754   PCR: 78174   Min.   :  0.00  
     SAN JUAN DE LURIGANCHO: 15042   PR :231104   1st Qu.: 31.00  
     LIMA                  : 13890                Median : 42.00  
     SAN MARTIN DE PORRES  : 11184                Mean   : 43.31  
     CALLAO                : 10204                3rd Qu.: 55.00  
     COMAS                 :  9175                Max.   :120.00  
     (Other)               :231029                NA's   :1551    
            sexo        fecha_resultado     
     Femenino :130568   Min.   :2020-03-06  
     Masculino:175932   1st Qu.:2020-05-10  
     NA's     :  2778   Median :2020-05-27  
                        Mean   :2020-05-26  
                        3rd Qu.:2020-06-13  
                        Max.   :2020-07-06  
                        NA's   :1480        

         uuid           fecha_fallecimiento       edad               sexo     
     Length:10952       Min.   :2020-03-19   Min.   :  0.00   Femenino :3205  
     Class :character   1st Qu.:2020-05-08   1st Qu.: 57.00   Masculino:7747  
     Mode  :character   Median :2020-06-06   Median : 66.00                   
                        Mean   :2020-05-30   Mean   : 65.56                   
                        3rd Qu.:2020-06-21   3rd Qu.: 75.00                   
                        Max.   :2020-07-06   Max.   :107.00                   
                                                                              
       fecha_nac               departamento     provincia   
     Min.   :1912-12-15   LIMA       :5063   LIMA    :4256  
     1st Qu.:1944-06-25   PIURA      : 808   CALLAO  : 518  
     Median :1953-08-02   LAMBAYEQUE : 775   TRUJILLO: 517  
     Mean   :1954-05-22   LA LIBERTAD: 707   PIURA   : 432  
     3rd Qu.:1962-12-12   CALLAO     : 678   CHICLAYO: 326  
     Max.   :2020-02-12   ICA        : 547   (Other) :3565  
     NA's   :783          (Other)    :2374   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 508   Min.   :  0.17  
     SAN MARTIN DE PORRES  : 379   1st Qu.: 57.46  
     CALLAO                : 369   Median : 66.84  
     LIMA                  : 357   Mean   : 66.03  
     COMAS                 : 328   3rd Qu.: 75.93  
     (Other)               :8206   Max.   :107.53  
     NA's                  : 805   NA's   :783     

      uuid_caso              departamento       provincia     
     Length:146669      LIMA       :116172   LIMA    :116172  
     Class :character   CALLAO     : 12969   CALLAO  : 12969  
     Mode  :character   LA LIBERTAD:  3710   TRUJILLO:  3557  
                        PIURA      :  3206   SANTA   :  2746  
                        ANCASH     :  2859   CHICLAYO:  2158  
                        LAMBAYEQUE :  2372   PIURA   :  2028  
                        (Other)    :  5381   (Other) :  7039  
                       distrito     metododx          edad       
     SAN JUAN DE LURIGANCHO:29231   PCR: 42218   Min.   :  0.00  
     LIMA                  :15477   PR :104451   1st Qu.: 50.00  
     SAN MARTIN DE PORRES  :13886                Median : 58.00  
     CALLAO                :11008                Mean   : 57.64  
     COMAS                 :10323                3rd Qu.: 66.00  
     VILLA EL SALVADOR     : 7171                Max.   :101.00  
     (Other)               :59573                                
            sexo        fecha_resultado      uuid_fallecimiento
     Femenino : 28317   Min.   :2020-03-07   Length:146669     
     Masculino:118352   1st Qu.:2020-04-30   Class :character  
                        Median :2020-05-18   Mode  :character  
                        Mean   :2020-05-15                     
                        3rd Qu.:2020-05-29                     
                        Max.   :2020-07-05                     
                                                               
     fecha_fallecimiento    fecha_nac            edad_calc      coincidencias  
     Min.   :2020-03-19   Min.   :1919-01-11   Min.   :  0.39   Min.   : 1.00  
     1st Qu.:2020-06-07   1st Qu.:1953-12-17   1st Qu.: 50.06   1st Qu.: 2.00  
     Median :2020-06-16   Median :1962-01-13   Median : 58.41   Median : 3.00  
     Mean   :2020-06-14   Mean   :1962-04-22   Mean   : 58.15   Mean   : 3.62  
     3rd Qu.:2020-06-26   3rd Qu.:1970-05-30   3rd Qu.: 66.50   3rd Qu.: 5.00  
     Max.   :2020-07-06   Max.   :2020-02-12   Max.   :101.48   Max.   :15.00  
                                                                               

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 36200 casos reconstruídos.

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
