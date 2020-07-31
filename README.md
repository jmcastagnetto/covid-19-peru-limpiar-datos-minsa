[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-07-31 23:12:54 UTC

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

**2020-07-28**

-   Luego de varios días sin actualización (al menos 3 días), los datos
    abiertos han sido actualizados.
-   Las fechas en los registros ha cambiado del formato DD/MM/YYY (y
    algunos MM/DD/YYYY) a YYYYMMDD

Información relevante
---------------------

Fuentes de datos:

-   <a href="https://www.datosabiertos.gob.pe/dataset/casos-positivos-por-covid-19-ministerio-de-salud-minsa" class="uri">https://www.datosabiertos.gob.pe/dataset/casos-positivos-por-covid-19-ministerio-de-salud-minsa</a>
-   <a href="https://www.datosabiertos.gob.pe/dataset/fallecidos-por-covid-19-ministerio-de-salud-minsa" class="uri">https://www.datosabiertos.gob.pe/dataset/fallecidos-por-covid-19-ministerio-de-salud-minsa</a>

Luego del primer paso de limpieza de datos:

         uuid                departamento               provincia     
     Length:400683      LIMA       :194179   LIMA            :186939  
     Class :character   CALLAO     : 20898   CALLAO          : 19808  
     Mode  :character   PIURA      : 20802   EN INVESTIGACIÓN: 16678  
                        LIMA REGION: 16985   AREQUIPA        : 11869  
                        LAMBAYEQUE : 16954   CHICLAYO        : 11350  
                        LA LIBERTAD: 14722   TRUJILLO        : 10728  
                        (Other)    :116143   (Other)         :143311  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 18494   PCR:108299   Min.   :  0.00  
     EN INVESTIGACIÓN      : 16678   PR :292384   1st Qu.: 31.00  
     LIMA                  : 16471                Median : 42.00  
     SAN MARTIN DE PORRES  : 13360                Mean   : 43.35  
     COMAS                 : 11511                3rd Qu.: 55.00  
     CALLAO                : 11170                Max.   :120.00  
     (Other)               :312999                NA's   :9       
            sexo        fecha_resultado     
     Femenino :174621   Min.   :2020-03-06  
     Masculino:226062   1st Qu.:2020-05-16  
                        Median :2020-06-06  
                        Mean   :2020-06-07  
                        3rd Qu.:2020-07-03  
                        Max.   :2020-07-28  
                                            

         uuid           fecha_fallecimiento       edad               sexo      
     Length:18816       Min.   :2020-03-18   Min.   :  0.00   Femenino : 5507  
     Class :character   1st Qu.:2020-05-09   1st Qu.: 57.00   Masculino:13309  
     Mode  :character   Median :2020-06-08   Median : 66.00                    
                        Mean   :2020-06-05   Mean   : 65.63                    
                        3rd Qu.:2020-07-01   3rd Qu.: 75.00                    
                        Max.   :2020-07-28   Max.   :107.00                    
                                                                               
       fecha_nac               departamento     provincia   
     Min.   :1912-12-15   LIMA       :8892   LIMA    :7708  
     1st Qu.:1944-07-09   LA LIBERTAD:1327   TRUJILLO: 960  
     Median :1953-07-29   PIURA      :1251   CALLAO  : 860  
     Mean   :1954-04-23   LAMBAYEQUE :1215   CHICLAYO: 675  
     3rd Qu.:1962-11-28   CALLAO     :1020   AREQUIPA: 663  
     Max.   :2020-02-12   ANCASH     : 818   (Other) :6612  
     NA's   :1064         (Other)    :4293   NA's    :1338  
                       distrito       edad_calc     
     SAN JUAN DE LURIGANCHO:  914   Min.   :  0.17  
     LIMA                  :  664   1st Qu.: 57.52  
     CALLAO                :  572   Median : 66.86  
     SAN MARTIN DE PORRES  :  564   Mean   : 66.12  
     VILLA EL SALVADOR     :  542   3rd Qu.: 75.90  
     (Other)               :14755   Max.   :107.53  
     NA's                  :  805   NA's   :1064    

      uuid_caso              departamento       provincia     
     Length:260498      LIMA       :203989   LIMA    :203989  
     Class :character   CALLAO     : 20695   CALLAO  : 20695  
     Mode  :character   LA LIBERTAD:  7481   TRUJILLO:  7209  
                        LAMBAYEQUE :  5645   CHICLAYO:  5279  
                        ANCASH     :  5303   SANTA   :  4998  
                        PIURA      :  5084   PIURA   :  3047  
                        (Other)    : 12301   (Other) : 15281  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 52108   PCR: 78460   Min.   :  0.00  
     LIMA                  : 25733   PR :182038   1st Qu.: 50.00  
     SAN MARTIN DE PORRES  : 22384                Median : 58.00  
     COMAS                 : 17827                Mean   : 57.74  
     CALLAO                : 17532                3rd Qu.: 66.00  
     VILLA EL SALVADOR     : 13870                Max.   :101.00  
     (Other)               :111044                                
            sexo        fecha_resultado      uuid_fallecimiento
     Femenino : 50700   Min.   :2020-03-07   Length:260498     
     Masculino:209798   1st Qu.:2020-04-29   Class :character  
                        Median :2020-05-18   Mode  :character  
                        Mean   :2020-05-18                     
                        3rd Qu.:2020-06-03                     
                        Max.   :2020-07-26                     
                                                               
     fecha_fallecimiento    fecha_nac            edad_calc      coincidencias   
     Min.   :2020-03-19   Min.   :1919-01-11   Min.   :  0.26   Min.   : 1.000  
     1st Qu.:2020-06-07   1st Qu.:1954-01-09   1st Qu.: 50.29   1st Qu.: 2.000  
     Median :2020-06-24   Median :1961-12-29   Median : 58.46   Median : 4.000  
     Mean   :2020-06-21   Mean   :1962-03-24   Mean   : 58.24   Mean   : 5.154  
     3rd Qu.:2020-07-12   3rd Qu.:1970-03-10   3rd Qu.: 66.42   3rd Qu.: 7.000  
     Max.   :2020-07-27   Max.   :2020-02-12   Max.   :101.48   Max.   :25.000  
                                                                                

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 46211 casos reconstruídos.

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
