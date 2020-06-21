[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-06-21 16:59:59 UTC

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

Información relevante
---------------------

Fuentes de datos:

-   <a href="https://www.datosabiertos.gob.pe/dataset/casos-positivos-por-covid-19-ministerio-de-salud-minsa" class="uri">https://www.datosabiertos.gob.pe/dataset/casos-positivos-por-covid-19-ministerio-de-salud-minsa</a>
-   <a href="https://www.datosabiertos.gob.pe/dataset/fallecidos-por-covid-19-ministerio-de-salud-minsa" class="uri">https://www.datosabiertos.gob.pe/dataset/fallecidos-por-covid-19-ministerio-de-salud-minsa</a>

Luego del primer paso de limpieza de datos:

    summary(casos)

         uuid                departamento               provincia     
     Length:251338      LIMA       :143017   LIMA            :133012  
     Class :character   CALLAO     : 16844   CALLAO          : 15979  
     Mode  :character   PIURA      : 15123   EN INVESTIGACIÓN:  8390  
                        LAMBAYEQUE : 12175   CHICLAYO        :  8171  
                        LORETO     :  8195   PIURA           :  7185  
                        LA LIBERTAD:  8185   CORONEL PORTILLO:  6301  
                        (Other)    : 47799   (Other)         : 72300  
                       distrito      metododx          edad      
     SAN JUAN DE LURIGANCHO: 12912   PCR: 59886   Min.   :  0.0  
     LIMA                  : 12213   PR :191452   1st Qu.: 30.0  
     SAN MARTIN DE PORRES  :  9804                Median : 42.0  
     CALLAO                :  9495                Mean   : 43.1  
     EN INVESTIGACIÓN      :  8390                3rd Qu.: 55.0  
     COMAS                 :  7511                Max.   :120.0  
     (Other)               :191013                NA's   :1546   
            sexo        fecha_resultado     
     Femenino :103546   Min.   :2020-03-06  
     Masculino:144984   1st Qu.:2020-05-05  
     NA's     :  2808   Median :2020-05-22  
                        Mean   :2020-05-19  
                        3rd Qu.:2020-06-04  
                        Max.   :2020-12-06  
                        NA's   :1339        

    summary(fallecimientos)

         uuid           fecha_fallecimiento       edad               sexo     
     Length:7861        Min.   :2020-03-19   Min.   :  0.00   Femenino :2297  
     Class :character   1st Qu.:2020-05-02   1st Qu.: 57.00   Masculino:5564  
     Mode  :character   Median :2020-05-24   Median : 66.00                   
                        Mean   :2020-05-19   Mean   : 65.35                   
                        3rd Qu.:2020-06-09   3rd Qu.: 75.00                   
                        Max.   :2020-06-19   Max.   :101.00                   
                                                                              
       fecha_nac               departamento     provincia   
     Min.   :1915-06-19   LIMA       :3580   LIMA    :2976  
     1st Qu.:1944-10-03   LAMBAYEQUE : 700   PIURA   : 375  
     Median :1953-10-31   PIURA      : 683   CALLAO  : 372  
     Mean   :1954-08-07   CALLAO     : 527   TRUJILLO: 313  
     3rd Qu.:1963-03-21   LA LIBERTAD: 431   CHICLAYO: 273  
     Max.   :2020-02-08   ANCASH     : 411   (Other) :2214  
     NA's   :750          (Other)    :1529   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 347   Min.   :  0.17  
     CALLAO                : 289   1st Qu.: 57.17  
     SAN MARTIN DE PORRES  : 281   Median : 66.55  
     LIMA                  : 264   Mean   : 65.79  
     COMAS                 : 232   3rd Qu.: 75.60  
     (Other)               :5643   Max.   :104.86  
     NA's                  : 805   NA's   :750     

    summary(reconstruido)

      uuid_caso              departamento      provincia    
     Length:85338       LIMA       :68337   LIMA    :67794  
     Class :character   CALLAO     : 7551   CALLAO  : 7551  
     Mode  :character   PIURA      : 2317   SANTA   : 1672  
                        ANCASH     : 1714   TRUJILLO: 1495  
                        LA LIBERTAD: 1560   PIURA   : 1473  
                        LAMBAYEQUE : 1477   CHICLAYO: 1324  
                        (Other)    : 2382   (Other) : 4029  
                       distrito     metododx         edad               sexo      
     SAN JUAN DE LURIGANCHO:16606   PCR:24565   Min.   :  0.00   Femenino :16263  
     LIMA                  : 8889   PR :60773   1st Qu.: 50.00   Masculino:69075  
     SAN MARTIN DE PORRES  : 8628               Median : 58.00                    
     CALLAO                : 6274               Mean   : 57.64                    
     COMAS                 : 5809               3rd Qu.: 66.00                    
     VILLA EL SALVADOR     : 4421               Max.   :100.00                    
     (Other)               :34711                                                 
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:85338       Min.   :2020-03-19  
     1st Qu.:2020-04-27   Class :character   1st Qu.:2020-06-01  
     Median :2020-05-14   Mode  :character   Median :2020-06-09  
     Mean   :2020-05-11                      Mean   :2020-06-05  
     3rd Qu.:2020-05-26                      3rd Qu.:2020-06-14  
     Max.   :2020-06-18                      Max.   :2020-06-19  
                                                                 
       fecha_nac            edad_calc      coincidencias   
     Min.   :1919-12-01   Min.   :  0.57   Min.   : 1.000  
     1st Qu.:1954-01-04   1st Qu.: 50.18   1st Qu.: 1.000  
     Median :1962-01-04   Median : 58.43   Median : 2.000  
     Mean   :1962-04-08   Mean   : 58.16   Mean   : 2.671  
     3rd Qu.:1970-04-14   3rd Qu.: 66.44   3rd Qu.: 4.000  
     Max.   :2019-11-10   Max.   :100.51   Max.   :11.000  
                                                           

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 28847 casos reconstruídos.

    ## [1] "es_PE.utf8"

![“Positivos por día. MINSA”](plots/positivos-por-dia-minsa.png)

![“Positivos acumulados. MINSA”](plots/positivos-acumulados-minsa.png)

![“Fallecimientos por día.
MINSA”](plots/fallecimientos-por-dia-minsa.png)

![“Fallecimientos acumulados.
MINSA”](plots/fallecimientos-acumulados-minsa.png)

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
