[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-06-17 22:13:31 UTC

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
     Length:237156      LIMA       :136464   LIMA            :127676  
     Class :character   CALLAO     : 16115   CALLAO          : 15267  
     Mode  :character   PIURA      : 14220   CHICLAYO        :  7783  
                        LAMBAYEQUE : 11576   EN INVESTIGACIÓN:  7253  
                        LORETO     :  7781   PIURA           :  6820  
                        LA LIBERTAD:  7579   CORONEL PORTILLO:  5939  
                        (Other)    : 43421   (Other)         : 66418  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 12268   PCR: 56097   Min.   :  0.00  
     LIMA                  : 11770   PR :181059   1st Qu.: 30.00  
     SAN MARTIN DE PORRES  :  9492                Median : 42.00  
     CALLAO                :  9135                Mean   : 43.04  
     EN INVESTIGACIÓN      :  7253                3rd Qu.: 54.00  
     COMAS                 :  7206                Max.   :120.00  
     (Other)               :180032                NA's   :1535    
            sexo        fecha_resultado     
     Femenino : 97069   Min.   :2020-03-06  
     Masculino:137284   1st Qu.:2020-05-05  
     NA's     :  2803   Median :2020-05-20  
                        Mean   :2020-05-17  
                        3rd Qu.:2020-06-01  
                        Max.   :2020-06-15  
                        NA's   :1339        

    summary(fallecimientos)

         uuid           fecha_fallecimiento       edad               sexo     
     Length:7056        Min.   :2020-03-19   Min.   :  0.00   Femenino :2042  
     Class :character   1st Qu.:2020-04-30   1st Qu.: 57.00   Masculino:5014  
     Mode  :character   Median :2020-05-18   Median : 66.00                   
                        Mean   :2020-05-16   Mean   : 65.21                   
                        3rd Qu.:2020-06-05   3rd Qu.: 75.00                   
                        Max.   :2020-06-15   Max.   :101.00                   
                                                                              
       fecha_nac               departamento     provincia   
     Min.   :1915-06-19   LIMA       :3196   LIMA    :2627  
     1st Qu.:1944-11-20   LAMBAYEQUE : 674   PIURA   : 351  
     Median :1953-12-15   PIURA      : 642   CALLAO  : 322  
     Mean   :1954-10-01   CALLAO     : 477   TRUJILLO: 259  
     3rd Qu.:1963-06-17   ANCASH     : 387   CHICLAYO: 256  
     Max.   :2020-02-08   LA LIBERTAD: 365   (Other) :1903  
     NA's   :748          (Other)    :1315   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 304   Min.   :  0.17  
     CALLAO                : 258   1st Qu.: 56.93  
     SAN MARTIN DE PORRES  : 258   Median : 66.42  
     LIMA                  : 234   Mean   : 65.63  
     CHIMBOTE              : 205   3rd Qu.: 75.47  
     (Other)               :4992   Max.   :104.86  
     NA's                  : 805   NA's   :748     

    summary(reconstruido)

      uuid_caso              departamento      provincia    
     Length:69702       LIMA       :56153   LIMA    :55718  
     Class :character   CALLAO     : 5753   CALLAO  : 5753  
     Mode  :character   PIURA      : 2033   SANTA   : 1526  
                        ANCASH     : 1559   PIURA   : 1281  
                        LAMBAYEQUE : 1242   TRUJILLO: 1170  
                        LA LIBERTAD: 1220   CHICLAYO: 1102  
                        (Other)    : 1742   (Other) : 3152  
                       distrito     metododx         edad               sexo      
     SAN JUAN DE LURIGANCHO:13499   PCR:19962   Min.   :  0.00   Femenino :13227  
     SAN MARTIN DE PORRES  : 7519   PR :49740   1st Qu.: 50.00   Masculino:56475  
     LIMA                  : 7128               Median : 57.00                    
     COMAS                 : 4718               Mean   : 57.38                    
     CALLAO                : 4674               3rd Qu.: 66.00                    
     VILLA EL SALVADOR     : 3505               Max.   :100.00                    
     (Other)               :28659                                                 
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:69702       Min.   :2020-03-19  
     1st Qu.:2020-04-27   Class :character   1st Qu.:2020-05-31  
     Median :2020-05-13   Mode  :character   Median :2020-06-06  
     Mean   :2020-05-10                      Mean   :2020-06-02  
     3rd Qu.:2020-05-25                      3rd Qu.:2020-06-11  
     Max.   :2020-06-14                      Max.   :2020-06-15  
                                                                 
       fecha_nac            edad_calc      coincidencias   
     Min.   :1919-12-01   Min.   :  0.57   Min.   : 1.000  
     1st Qu.:1954-04-12   1st Qu.: 50.01   1st Qu.: 1.000  
     Median :1962-06-21   Median : 57.92   Median : 2.000  
     Mean   :1962-07-07   Mean   : 57.91   Mean   : 2.429  
     3rd Qu.:1970-06-05   3rd Qu.: 66.14   3rd Qu.: 3.000  
     Max.   :2019-11-10   Max.   :100.51   Max.   :10.000  
                                                           

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 26017 casos reconstruídos.

    ## [1] "es_PE.utf8"

![“Positivos por día. MINSA”](positivos-por-dia-minsa.png)

![“Positivos acumulados. MINSA”](positivos-acumulados-minsa.png)

![“Fallecimientos por día. MINSA”](fallecimientos-por-dia-minsa.png)

![“Fallecimientos acumulados.
MINSA”](fallecimientos-acumulados-minsa.png)

![“Distribución de tiempos desde detección a fallecimiento, por número
de registros
coincidentes”](deteccion-fallecimiento-por-coincidentes.png)

Los archivos “limpios” son:

-   [datos/fallecidos\_covid-utf8-limpio.csv](datos/fallecidos_covid-utf8-limpio.csv)
-   [datos/positivos\_covid-utf8-limpio.csv](datos/positivos_covid-utf8-limpio.csv)

Y algunos reconstruidos a partir de los anteriores:

-   [datos/casos\_fallecimientos\_reconstruccion\_posible.csv](datos/casos_fallecimientos_reconstruccion_posible.csv)
-   [datos/timeseries-casos.csv](datos/timeseries-casos.csv)
-   [datos/timeseries-casos-lugares.csv](datos/timeseries-casos-lugares.csv)
-   [datos/timeseries-fallecimientos.csv](datos/timeseries-fallecimientos.csv)
-   [datos/timeseries-fallecimientos-lugares.csv](datos/timeseries-fallecimientos-lugares.csv)
