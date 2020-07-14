[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-07-14 20:59:18 UTC

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
     Length:330123      LIMA       :165611   LIMA            :161405  
     Class :character   CALLAO     : 19167   CALLAO          : 18164  
     Mode  :character   PIURA      : 18889   EN INVESTIGACIÓN: 11903  
                        LAMBAYEQUE : 15129   CHICLAYO        : 10189  
                        LA LIBERTAD: 12128   PIURA           :  8979  
                        LIMA REGION: 11513   TRUJILLO        :  8632  
                        (Other)    : 87686   (Other)         :110851  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 15829   PCR: 85095   Min.   :  0.00  
     LIMA                  : 14617   PR :245028   1st Qu.: 31.00  
     EN INVESTIGACIÓN      : 11903                Median : 42.00  
     SAN MARTIN DE PORRES  : 11612                Mean   : 43.37  
     CALLAO                : 10450                3rd Qu.: 55.00  
     COMAS                 :  9645                Max.   :120.00  
     (Other)               :256067                NA's   :1573    
            sexo        fecha_resultado     
     Femenino :140373   Min.   :2020-03-06  
     Masculino:186966   1st Qu.:2020-05-12  
     NA's     :  2784   Median :2020-05-28  
                        Mean   :2020-05-29  
                        3rd Qu.:2020-06-17  
                        Max.   :2020-07-12  
                        NA's   :1309        

         uuid           fecha_fallecimiento       edad               sexo     
     Length:12054       Min.   :2020-03-19   Min.   :  0.00   Femenino :3526  
     Class :character   1st Qu.:2020-05-11   1st Qu.: 57.00   Masculino:8528  
     Mode  :character   Median :2020-06-09   Median : 66.00                   
                        Mean   :2020-06-02   Mean   : 65.66                   
                        3rd Qu.:2020-06-25   3rd Qu.: 75.00                   
                        Max.   :2020-07-12   Max.   :107.00                   
                                                                              
       fecha_nac               departamento     provincia   
     Min.   :1912-12-15   LIMA       :5611   LIMA    :4716  
     1st Qu.:1944-06-01   PIURA      : 845   TRUJILLO: 572  
     Median :1953-07-03   LAMBAYEQUE : 799   CALLAO  : 562  
     Mean   :1954-04-14   LA LIBERTAD: 788   PIURA   : 453  
     3rd Qu.:1962-11-29   CALLAO     : 722   AREQUIPA: 392  
     Max.   :2020-02-12   ICA        : 621   (Other) :4021  
     NA's   :787          (Other)    :2668   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 566   Min.   :  0.17  
     SAN MARTIN DE PORRES  : 409   1st Qu.: 57.52  
     CALLAO                : 385   Median : 66.94  
     LIMA                  : 381   Mean   : 66.14  
     COMAS                 : 379   3rd Qu.: 76.02  
     (Other)               :9129   Max.   :107.53  
     NA's                  : 805   NA's   :787     

      uuid_caso              departamento       provincia     
     Length:170179      LIMA       :136021   LIMA    :136020  
     Class :character   CALLAO     : 13991   CALLAO  : 13991  
     Mode  :character   LA LIBERTAD:  4330   TRUJILLO:  4143  
                        PIURA      :  3441   SANTA   :  3002  
                        ANCASH     :  3180   PIURA   :  2234  
                        LAMBAYEQUE :  2418   CHICLAYO:  2187  
                        (Other)    :  6798   (Other) :  8602  
                       distrito     metododx          edad       
     SAN JUAN DE LURIGANCHO:34608   PCR: 49692   Min.   :  0.00  
     LIMA                  :17094   PR :120487   1st Qu.: 50.00  
     SAN MARTIN DE PORRES  :15730                Median : 58.00  
     COMAS                 :12937                Mean   : 57.76  
     CALLAO                :11660                3rd Qu.: 66.00  
     VILLA EL SALVADOR     : 8685                Max.   :101.00  
     (Other)               :69465                                
            sexo        fecha_resultado      uuid_fallecimiento
     Femenino : 32639   Min.   :2020-03-07   Length:170179     
     Masculino:137540   1st Qu.:2020-05-01   Class :character  
                        Median :2020-05-19   Mode  :character  
                        Mean   :2020-05-17                     
                        3rd Qu.:2020-05-31                     
                        Max.   :2020-07-11                     
                                                               
     fecha_fallecimiento    fecha_nac            edad_calc      coincidencias  
     Min.   :2020-03-19   Min.   :1919-01-11   Min.   :  0.39   Min.   : 1.00  
     1st Qu.:2020-06-09   1st Qu.:1953-12-17   1st Qu.: 50.41   1st Qu.: 2.00  
     Median :2020-06-19   Median :1962-01-07   Median : 58.45   Median : 3.00  
     Mean   :2020-06-18   Mean   :1962-03-09   Mean   : 58.28   Mean   : 3.94  
     3rd Qu.:2020-07-01   3rd Qu.:1970-01-22   3rd Qu.: 66.50   3rd Qu.: 5.00  
     Max.   :2020-07-12   Max.   :2020-02-12   Max.   :101.48   Max.   :16.00  
                                                                               

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 38272 casos reconstruídos.

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
