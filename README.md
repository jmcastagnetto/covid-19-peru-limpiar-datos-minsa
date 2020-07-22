[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-07-22 21:02:35 UTC

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
     Length:362087      LIMA       :179560   LIMA            :173811  
     Class :character   CALLAO     : 19966   CALLAO          : 18932  
     Mode  :character   PIURA      : 19782   EN INVESTIGACIÓN: 13950  
                        LAMBAYEQUE : 15922   CHICLAYO        : 10703  
                        LIMA REGION: 13980   PIURA           :  9749  
                        LA LIBERTAD: 13355   TRUJILLO        :  9672  
                        (Other)    : 99522   (Other)         :125270  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 17146   PCR: 97634   Min.   :  0.00  
     LIMA                  : 15575   PR :264453   1st Qu.: 31.00  
     EN INVESTIGACIÓN      : 13950                Median : 42.00  
     SAN MARTIN DE PORRES  : 12506                Mean   : 43.36  
     CALLAO                : 10791                3rd Qu.: 55.00  
     COMAS                 : 10575                Max.   :120.00  
     (Other)               :281544                NA's   :838     
            sexo        fecha_resultado     
     Femenino :155658   Min.   :2020-03-06  
     Masculino:204382   1st Qu.:2020-05-14  
     NA's     :  2047   Median :2020-06-01  
                        Mean   :2020-06-02  
                        3rd Qu.:2020-06-24  
                        Max.   :2020-07-20  
                        NA's   :571         

         uuid           fecha_fallecimiento       edad              sexo     
     Length:13579       Min.   :2020-03-19   Min.   :  0.0   Femenino :4001  
     Class :character   1st Qu.:2020-05-15   1st Qu.: 57.0   Masculino:9578  
     Mode  :character   Median :2020-06-13   Median : 66.0                   
                        Mean   :2020-06-07   Mean   : 65.7                   
                        3rd Qu.:2020-07-01   3rd Qu.: 76.0                   
                        Max.   :2020-07-20   Max.   :107.0                   
                                                                             
       fecha_nac               departamento     provincia   
     Min.   :1912-12-15   LIMA       :6320   LIMA    :5325  
     1st Qu.:1944-05-31   LA LIBERTAD: 917   TRUJILLO: 669  
     Median :1953-06-30   PIURA      : 886   CALLAO  : 622  
     Mean   :1954-03-30   LAMBAYEQUE : 829   AREQUIPA: 541  
     3rd Qu.:1962-11-22   CALLAO     : 782   PIURA   : 470  
     Max.   :2020-02-12   ICA        : 696   (Other) :4614  
     NA's   :793          (Other)    :3149   NA's    :1338  
                       distrito       edad_calc     
     SAN JUAN DE LURIGANCHO:  629   Min.   :  0.17  
     SAN MARTIN DE PORRES  :  458   1st Qu.: 57.55  
     COMAS                 :  419   Median : 66.96  
     LIMA                  :  419   Mean   : 66.19  
     CALLAO                :  416   3rd Qu.: 76.04  
     (Other)               :10433   Max.   :107.53  
     NA's                  :  805   NA's   :793     

      uuid_caso              departamento       provincia     
     Length:203192      LIMA       :161770   LIMA    :161770  
     Class :character   CALLAO     : 16385   CALLAO  : 16385  
     Mode  :character   LA LIBERTAD:  5565   TRUJILLO:  5346  
                        PIURA      :  3715   SANTA   :  3430  
                        ANCASH     :  3699   CHICLAYO:  2726  
                        LAMBAYEQUE :  2971   PIURA   :  2417  
                        (Other)    :  9087   (Other) : 11118  
                       distrito     metododx          edad       
     SAN JUAN DE LURIGANCHO:40929   PCR: 59970   Min.   :  0.00  
     LIMA                  :20036   PR :143222   1st Qu.: 50.00  
     SAN MARTIN DE PORRES  :19342                Median : 58.00  
     COMAS                 :15061                Mean   : 57.76  
     CALLAO                :13626                3rd Qu.: 66.00  
     VILLA EL SALVADOR     :10163                Max.   :101.00  
     (Other)               :84035                                
            sexo        fecha_resultado      uuid_fallecimiento
     Femenino : 39356   Min.   :2020-03-07   Length:203192     
     Masculino:163836   1st Qu.:2020-05-02   Class :character  
                        Median :2020-05-20   Mode  :character  
                        Mean   :2020-05-19                     
                        3rd Qu.:2020-06-03                     
                        Max.   :2020-07-19                     
                                                               
     fecha_fallecimiento    fecha_nac            edad_calc      coincidencias   
     Min.   :2020-03-19   Min.   :1919-01-11   Min.   :  0.39   Min.   : 1.000  
     1st Qu.:2020-06-11   1st Qu.:1953-12-21   1st Qu.: 50.18   1st Qu.: 2.000  
     Median :2020-06-24   Median :1962-01-04   Median : 58.45   Median : 3.000  
     Mean   :2020-06-22   Mean   :1962-03-18   Mean   : 58.27   Mean   : 4.284  
     3rd Qu.:2020-07-08   3rd Qu.:1970-04-14   3rd Qu.: 66.50   3rd Qu.: 6.000  
     Max.   :2020-07-20   Max.   :2020-02-12   Max.   :101.48   Max.   :18.000  
                                                                                

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 42285 casos reconstruídos.

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
