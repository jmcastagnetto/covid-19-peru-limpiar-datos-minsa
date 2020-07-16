[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-07-16 23:11:48 UTC

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
     Length:337724      LIMA       :169017   LIMA            :164365  
     Class :character   CALLAO     : 19307   CALLAO          : 18304  
     Mode  :character   PIURA      : 19096   EN INVESTIGACIÓN: 12628  
                        LAMBAYEQUE : 15308   CHICLAYO        : 10306  
                        LA LIBERTAD: 12430   PIURA           :  9082  
                        LIMA REGION: 12114   TRUJILLO        :  8864  
                        (Other)    : 90452   (Other)         :114175  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 16087   PCR: 88275   Min.   :  0.00  
     LIMA                  : 14953   PR :249449   1st Qu.: 31.00  
     EN INVESTIGACIÓN      : 12628                Median : 42.00  
     SAN MARTIN DE PORRES  : 11827                Mean   : 43.37  
     CALLAO                : 10514                3rd Qu.: 55.00  
     COMAS                 :  9893                Max.   :120.00  
     (Other)               :261822                NA's   :1576    
            sexo        fecha_resultado     
     Femenino :143878   Min.   :2020-03-06  
     Masculino:191062   1st Qu.:2020-05-12  
     NA's     :  2784   Median :2020-05-29  
                        Mean   :2020-05-30  
                        3rd Qu.:2020-06-19  
                        Max.   :2020-07-14  
                        NA's   :1309        

         uuid           fecha_fallecimiento       edad               sexo     
     Length:12417       Min.   :2020-03-19   Min.   :  0.00   Femenino :3633  
     Class :character   1st Qu.:2020-05-12   1st Qu.: 57.00   Masculino:8784  
     Mode  :character   Median :2020-06-10   Median : 66.00                   
                        Mean   :2020-06-04   Mean   : 65.66                   
                        3rd Qu.:2020-06-26   3rd Qu.: 75.00                   
                        Max.   :2020-07-14   Max.   :107.00                   
                                                                              
       fecha_nac               departamento     provincia   
     Min.   :1912-12-15   LIMA       :5763   LIMA    :4849  
     1st Qu.:1944-06-11   PIURA      : 853   TRUJILLO: 599  
     Median :1953-07-07   LA LIBERTAD: 827   CALLAO  : 575  
     Mean   :1954-04-12   LAMBAYEQUE : 805   PIURA   : 457  
     3rd Qu.:1962-11-25   CALLAO     : 735   AREQUIPA: 435  
     Max.   :2020-02-12   ICA        : 644   (Other) :4164  
     NA's   :787          (Other)    :2790   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 577   Min.   :  0.17  
     SAN MARTIN DE PORRES  : 416   1st Qu.: 57.55  
     CALLAO                : 394   Median : 66.92  
     COMAS                 : 391   Mean   : 66.15  
     LIMA                  : 385   3rd Qu.: 75.99  
     (Other)               :9449   Max.   :107.53  
     NA's                  : 805   NA's   :787     

      uuid_caso              departamento       provincia     
     Length:176652      LIMA       :140709   LIMA    :140709  
     Class :character   CALLAO     : 14499   CALLAO  : 14499  
     Mode  :character   LA LIBERTAD:  4704   TRUJILLO:  4503  
                        PIURA      :  3488   SANTA   :  3061  
                        ANCASH     :  3266   PIURA   :  2258  
                        LAMBAYEQUE :  2491   CHICLAYO:  2252  
                        (Other)    :  7495   (Other) :  9370  
                       distrito     metododx          edad       
     SAN JUAN DE LURIGANCHO:35590   PCR: 51772   Min.   :  0.00  
     LIMA                  :17296   PR :124880   1st Qu.: 50.00  
     SAN MARTIN DE PORRES  :16145                Median : 58.00  
     COMAS                 :13516                Mean   : 57.85  
     CALLAO                :12148                3rd Qu.: 66.00  
     VILLA EL SALVADOR     : 9075                Max.   :101.00  
     (Other)               :72882                                
            sexo        fecha_resultado      uuid_fallecimiento
     Femenino : 34108   Min.   :2020-03-07   Length:176652     
     Masculino:142544   1st Qu.:2020-05-01   Class :character  
                        Median :2020-05-19   Mode  :character  
                        Mean   :2020-05-17                     
                        3rd Qu.:2020-06-01                     
                        Max.   :2020-07-13                     
                                                               
     fecha_fallecimiento    fecha_nac            edad_calc      coincidencias   
     Min.   :2020-03-19   Min.   :1919-01-11   Min.   :  0.39   Min.   : 1.000  
     1st Qu.:2020-06-10   1st Qu.:1953-11-23   1st Qu.: 50.56   1st Qu.: 2.000  
     Median :2020-06-20   Median :1961-12-13   Median : 58.54   Median : 3.000  
     Mean   :2020-06-19   Mean   :1962-02-08   Mean   : 58.36   Mean   : 4.017  
     3rd Qu.:2020-07-02   3rd Qu.:1969-11-27   3rd Qu.: 66.54   3rd Qu.: 6.000  
     Max.   :2020-07-14   Max.   :2020-02-12   Max.   :101.48   Max.   :16.000  
                                                                                

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 38797 casos reconstruídos.

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
