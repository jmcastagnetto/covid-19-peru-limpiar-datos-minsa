[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-07-19 14:22:51 UTC

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
     Length:349500      LIMA       :174570   LIMA            :169267  
     Class :character   CALLAO     : 19694   CALLAO          : 18688  
     Mode  :character   PIURA      : 19324   EN INVESTIGACIÓN: 13724  
                        LAMBAYEQUE : 15581   CHICLAYO        : 10478  
                        LIMA REGION: 13285   TRUJILLO        :  9294  
                        LA LIBERTAD: 12888   PIURA           :  9207  
                        (Other)    : 94158   (Other)         :118842  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 16637   PCR: 93816   Min.   :  0.00  
     LIMA                  : 15256   PR :255684   1st Qu.: 31.00  
     EN INVESTIGACIÓN      : 13724                Median : 42.00  
     SAN MARTIN DE PORRES  : 12204                Mean   : 43.36  
     CALLAO                : 10696                3rd Qu.: 55.00  
     COMAS                 : 10309                Max.   :120.00  
     (Other)               :270674                NA's   :1484    
            sexo        fecha_resultado     
     Femenino :149493   Min.   :2020-03-06  
     Masculino:197321   1st Qu.:2020-05-13  
     NA's     :  2686   Median :2020-05-30  
                        Mean   :2020-05-31  
                        3rd Qu.:2020-06-22  
                        Max.   :2020-07-17  
                        NA's   :1211        

         uuid           fecha_fallecimiento       edad               sexo     
     Length:12998       Min.   :2020-03-19   Min.   :  0.00   Femenino :3815  
     Class :character   1st Qu.:2020-05-13   1st Qu.: 57.00   Masculino:9183  
     Mode  :character   Median :2020-06-11   Median : 66.00                   
                        Mean   :2020-06-05   Mean   : 65.67                   
                        3rd Qu.:2020-06-29   3rd Qu.: 75.00                   
                        Max.   :2020-07-17   Max.   :107.00                   
                                                                              
       fecha_nac               departamento     provincia   
     Min.   :1912-12-15   LIMA       :6032   LIMA    :5093  
     1st Qu.:1944-06-14   PIURA      : 868   TRUJILLO: 634  
     Median :1953-07-06   LA LIBERTAD: 866   CALLAO  : 604  
     Mean   :1954-04-11   LAMBAYEQUE : 817   AREQUIPA: 494  
     3rd Qu.:1962-11-28   CALLAO     : 764   PIURA   : 463  
     Max.   :2020-02-12   ICA        : 673   (Other) :4372  
     NA's   :788          (Other)    :2978   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 605   Min.   :  0.17  
     SAN MARTIN DE PORRES  : 436   1st Qu.: 57.54  
     COMAS                 : 409   Median : 66.93  
     CALLAO                : 408   Mean   : 66.16  
     LIMA                  : 401   3rd Qu.: 75.97  
     (Other)               :9934   Max.   :107.53  
     NA's                  : 805   NA's   :788     

      uuid_caso              departamento       provincia     
     Length:190617      LIMA       :151513   LIMA    :151513  
     Class :character   CALLAO     : 15703   CALLAO  : 15703  
     Mode  :character   LA LIBERTAD:  5193   TRUJILLO:  4988  
                        ANCASH     :  3592   SANTA   :  3341  
                        PIURA      :  3583   CHICLAYO:  2437  
                        LAMBAYEQUE :  2679   PIURA   :  2304  
                        (Other)    :  8354   (Other) : 10331  
                       distrito     metododx          edad       
     SAN JUAN DE LURIGANCHO:38643   PCR: 55934   Min.   :  0.00  
     LIMA                  :18817   PR :134683   1st Qu.: 50.00  
     SAN MARTIN DE PORRES  :17686                Median : 58.00  
     COMAS                 :14494                Mean   : 57.75  
     CALLAO                :13138                3rd Qu.: 66.00  
     VILLA EL SALVADOR     : 9476                Max.   :101.00  
     (Other)               :78363                                
            sexo        fecha_resultado      uuid_fallecimiento
     Femenino : 36692   Min.   :2020-03-07   Length:190617     
     Masculino:153925   1st Qu.:2020-05-02   Class :character  
                        Median :2020-05-20   Mode  :character  
                        Mean   :2020-05-18                     
                        3rd Qu.:2020-06-02                     
                        Max.   :2020-07-16                     
                                                               
     fecha_fallecimiento    fecha_nac            edad_calc      coincidencias   
     Min.   :2020-03-19   Min.   :1919-01-11   Min.   :  0.39   Min.   : 1.000  
     1st Qu.:2020-06-10   1st Qu.:1953-12-17   1st Qu.: 50.34   1st Qu.: 2.000  
     Median :2020-06-22   Median :1961-12-29   Median : 58.46   Median : 3.000  
     Mean   :2020-06-21   Mean   :1962-03-19   Mean   : 58.26   Mean   : 4.176  
     3rd Qu.:2020-07-05   3rd Qu.:1970-02-22   3rd Qu.: 66.52   3rd Qu.: 6.000  
     Max.   :2020-07-17   Max.   :2020-02-12   Max.   :101.48   Max.   :18.000  
                                                                                

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 40646 casos reconstruídos.

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
