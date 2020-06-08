**Última actualización**: 2020-06-08 16:32:28 UTC

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
     Length:196515      LIMA       :116159   LIMA            :99332  
     Class :character   CALLAO     : 13865   EN INVESTIGACIÓN:15275  
     Mode  :character   PIURA      : 10716   CALLAO          :13708  
                        LAMBAYEQUE :  9829   CHICLAYO        : 6525  
                        LORETO     :  6225   PIURA           : 5048  
                        LA LIBERTAD:  5841   CORONEL PORTILLO: 4935  
                        (Other)    : 33880   (Other)         :51692  
                       distrito      metododx          edad       
     EN INVESTIGACIÓN      : 15275   PCR: 45884   Min.   :  0.00  
     LIMA                  : 10108   PR :150631   1st Qu.: 30.00  
     SAN JUAN DE LURIGANCHO:  9093                Median : 42.00  
     CALLAO                :  7905                Mean   : 42.93  
     SAN MARTIN DE PORRES  :  6709                3rd Qu.: 54.00  
     COMAS                 :  6036                Max.   :120.00  
     (Other)               :141389                NA's   :1654    
            sexo        fecha_resultado     
     Femenino : 78528   Min.   :2020-03-06  
     Masculino:115058   1st Qu.:2020-05-01  
     NA's     :  2929   Median :2020-05-16  
                        Mean   :2020-05-12  
                        3rd Qu.:2020-05-26  
                        Max.   :2020-06-06  
                        NA's   :1465        

    summary(fallecimientos)

         uuid           fecha_fallecimiento       edad              sexo     
     Length:5465        Min.   :2020-03-19   Min.   :  0.0   Femenino :1569  
     Class :character   1st Qu.:2020-04-26   1st Qu.: 56.0   Masculino:3896  
     Mode  :character   Median :2020-05-08   Median : 66.0                   
                        Mean   :2020-05-09   Mean   : 65.1                   
                        3rd Qu.:2020-05-27   3rd Qu.: 75.0                   
                        Max.   :2020-06-06   Max.   :100.0                   
                                                                             
       fecha_nac              departamento     provincia   
     Min.   :1915-06-19   LIMA      :2283   LIMA    :1782  
     1st Qu.:1944-11-25   LAMBAYEQUE: 634   PIURA   : 314  
     Median :1954-01-17   PIURA     : 568   CALLAO  : 234  
     Mean   :1954-11-19   CALLAO    : 389   CHICLAYO: 232  
     3rd Qu.:1963-09-09   ANCASH    : 312   TRUJILLO: 160  
     Max.   :2020-02-08   LORETO    : 305   (Other) :1405  
     NA's   :747          (Other)   : 974   NA's    :1338  
                       distrito      edad_calc     
     CALLAO                : 210   Min.   :  0.17  
     SAN JUAN DE LURIGANCHO: 208   1st Qu.: 56.67  
     LIMA                  : 175   Median : 66.28  
     SAN MARTIN DE PORRES  : 174   Mean   : 65.47  
     CHIMBOTE              : 162   3rd Qu.: 75.44  
     (Other)               :3731   Max.   :104.86  
     NA's                  : 805   NA's   :747     

    summary(reconstruido)

      uuid_caso              departamento      provincia    
     Length:33847       LIMA       :25945   LIMA    :25696  
     Class :character   CALLAO     : 3065   CALLAO  : 3065  
     Mode  :character   PIURA      : 1525   PIURA   :  991  
                        LAMBAYEQUE :  879   SANTA   :  845  
                        ANCASH     :  861   CHICLAYO:  779  
                        LA LIBERTAD:  541   TRUJILLO:  514  
                        (Other)    : 1031   (Other) : 1957  
                       distrito     metododx         edad               sexo      
     SAN JUAN DE LURIGANCHO: 6508   PCR:10304   Min.   :  0.00   Femenino : 6370  
     LIMA                  : 3448   PR :23543   1st Qu.: 49.00   Masculino:27477  
     SAN MARTIN DE PORRES  : 2598               Median : 57.00                    
     CALLAO                : 2341               Mean   : 57.13                    
     COMAS                 : 2277               3rd Qu.: 66.00                    
     VILLA EL SALVADOR     : 1413               Max.   :100.00                    
     (Other)               :15262                                                 
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:33847       Min.   :2020-03-19  
     1st Qu.:2020-04-22   Class :character   1st Qu.:2020-05-27  
     Median :2020-05-05   Mode  :character   Median :2020-05-31  
     Mean   :2020-05-04                      Mean   :2020-05-25  
     3rd Qu.:2020-05-20                      3rd Qu.:2020-06-03  
     Max.   :2020-06-05                      Max.   :2020-06-06  
                                                                 
       fecha_nac            edad_calc      coincidencias  
     Min.   :1919-12-01   Min.   :  0.57   Min.   :1.000  
     1st Qu.:1954-05-08   1st Qu.: 49.99   1st Qu.:1.000  
     Median :1962-09-22   Median : 57.68   Median :2.000  
     Mean   :1962-09-18   Mean   : 57.68   Mean   :1.866  
     3rd Qu.:1970-06-05   3rd Qu.: 66.05   3rd Qu.:2.000  
     Max.   :2019-11-10   Max.   :100.51   Max.   :7.000  
                                                          

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 16692 casos reconstruídos.

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
