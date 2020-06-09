[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-06-09 15:50:09 UTC

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

Información relevante
---------------------

Fuentes de datos:

-   <a href="https://www.datosabiertos.gob.pe/dataset/casos-positivos-por-covid-19-ministerio-de-salud-minsa" class="uri">https://www.datosabiertos.gob.pe/dataset/casos-positivos-por-covid-19-ministerio-de-salud-minsa</a>
-   <a href="https://www.datosabiertos.gob.pe/dataset/fallecidos-por-covid-19-ministerio-de-salud-minsa" class="uri">https://www.datosabiertos.gob.pe/dataset/fallecidos-por-covid-19-ministerio-de-salud-minsa</a>

Luego del primer paso de limpieza de datos:

    summary(casos)

         uuid                departamento               provincia     
     Length:199696      LIMA       :118036   LIMA            :100483  
     Class :character   CALLAO     : 14017   EN INVESTIGACIÓN: 16117  
     Mode  :character   PIURA      : 10886   CALLAO          : 13857  
                        LAMBAYEQUE :  9933   CHICLAYO        :  6564  
                        LORETO     :  6349   PIURA           :  5124  
                        LA LIBERTAD:  5916   CORONEL PORTILLO:  5033  
                        (Other)    : 34559   (Other)         : 52518  
                       distrito      metododx          edad       
     EN INVESTIGACIÓN      : 16117   PCR: 47253   Min.   :  0.00  
     LIMA                  : 10227   PR :152443   1st Qu.: 30.00  
     SAN JUAN DE LURIGANCHO:  9175                Median : 42.00  
     CALLAO                :  7940                Mean   : 42.93  
     SAN MARTIN DE PORRES  :  6814                3rd Qu.: 54.00  
     COMAS                 :  6195                Max.   :120.00  
     (Other)               :143228                NA's   :1660    
            sexo        fecha_resultado     
     Femenino : 79910   Min.   :2020-03-06  
     Masculino:116857   1st Qu.:2020-05-01  
     NA's     :  2929   Median :2020-05-16  
                        Mean   :2020-05-13  
                        3rd Qu.:2020-05-26  
                        Max.   :2020-06-07  
                        NA's   :1465        

    summary(fallecimientos)

         uuid           fecha_fallecimiento       edad              sexo     
     Length:5571        Min.   :2020-03-19   Min.   :  0.0   Femenino :1603  
     Class :character   1st Qu.:2020-04-26   1st Qu.: 56.0   Masculino:3968  
     Mode  :character   Median :2020-05-08   Median : 66.0                   
                        Mean   :2020-05-09   Mean   : 65.1                   
                        3rd Qu.:2020-05-28   3rd Qu.: 75.0                   
                        Max.   :2020-06-07   Max.   :100.0                   
                                                                             
       fecha_nac              departamento     provincia   
     Min.   :1915-06-19   LIMA      :2349   LIMA    :1843  
     1st Qu.:1944-11-25   LAMBAYEQUE: 635   PIURA   : 315  
     Median :1954-01-08   PIURA     : 573   CALLAO  : 236  
     Mean   :1954-11-17   CALLAO    : 391   CHICLAYO: 232  
     3rd Qu.:1963-09-09   ANCASH    : 318   TRUJILLO: 168  
     Max.   :2020-02-08   LORETO    : 307   (Other) :1439  
     NA's   :747          (Other)   : 998   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 215   Min.   :  0.17  
     CALLAO                : 210   1st Qu.: 56.68  
     LIMA                  : 180   Median : 66.31  
     SAN MARTIN DE PORRES  : 178   Mean   : 65.48  
     CHIMBOTE              : 167   3rd Qu.: 75.43  
     (Other)               :3816   Max.   :104.86  
     NA's                  : 805   NA's   :747     

    summary(reconstruido)

      uuid_caso              departamento      provincia    
     Length:35894       LIMA       :27749   LIMA    :27482  
     Class :character   CALLAO     : 3111   CALLAO  : 3111  
     Mode  :character   PIURA      : 1568   PIURA   :  994  
                        ANCASH     :  928   SANTA   :  912  
                        LAMBAYEQUE :  881   CHICLAYO:  779  
                        LA LIBERTAD:  606   TRUJILLO:  579  
                        (Other)    : 1051   (Other) : 2037  
                       distrito     metododx         edad               sexo      
     SAN JUAN DE LURIGANCHO: 6965   PCR:10992   Min.   :  0.00   Femenino : 6881  
     LIMA                  : 3744   PR :24902   1st Qu.: 49.00   Masculino:29013  
     SAN MARTIN DE PORRES  : 2675               Median : 57.00                    
     COMAS                 : 2487               Mean   : 57.05                    
     CALLAO                : 2341               3rd Qu.: 66.00                    
     VILLA EL SALVADOR     : 1604               Max.   :100.00                    
     (Other)               :16078                                                 
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:35894       Min.   :2020-03-19  
     1st Qu.:2020-04-22   Class :character   1st Qu.:2020-05-27  
     Median :2020-05-05   Mode  :character   Median :2020-05-31  
     Mean   :2020-05-05                      Mean   :2020-05-26  
     3rd Qu.:2020-05-20                      3rd Qu.:2020-06-04  
     Max.   :2020-06-06                      Max.   :2020-06-07  
                                                                 
       fecha_nac            edad_calc      coincidencias  
     Min.   :1919-12-01   Min.   :  0.57   Min.   :1.000  
     1st Qu.:1954-05-08   1st Qu.: 49.98   1st Qu.:1.000  
     Median :1962-10-15   Median : 57.61   Median :2.000  
     Mean   :1962-10-19   Mean   : 57.60   Mean   :1.876  
     3rd Qu.:1970-06-13   3rd Qu.: 66.05   3rd Qu.:2.000  
     Max.   :2019-11-10   Max.   :100.51   Max.   :7.000  
                                                          

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 17805 casos reconstruídos.

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

-   datos/DATOSABIERTOS\_SISCOVID-utf8-limpio.csv.gz
-   datos/FALLECIDOS\_CDC-utf8-limpio.csv.gz

Y algunos reconstruidos con los anteriores:

-   datos/casos\_fallecimientos\_reconstruccion\_posible.csv.gz
-   datos/timeseries-casos.csv.gz
-   datos/timeseries-casos-lugares.csv.gz
-   datos/timeseries-fallecimientos.csv.gz
-   datos/timeseries-fallecimientos-lugares.csv.gz
