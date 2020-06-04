**Última actualización**: 2020-06-04 23:10:45 UTC

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
     Length:178914      LIMA       :108323   LIMA            :94383  
     Class :character   CALLAO     : 13171   EN INVESTIGACIÓN:21340  
     Mode  :character   LAMBAYEQUE :  9348   CALLAO          :11377  
                        PIURA      :  7890   CHICLAYO        : 5320  
                        LORETO     :  5517   CORONEL PORTILLO: 4118  
                        LA LIBERTAD:  5351   PIURA           : 3648  
                        (Other)    : 29314   (Other)         :38728  
                       distrito      metododx          edad       
     EN INVESTIGACIÓN      : 21340   PCR: 40601   Min.   :  0.00  
     LIMA                  :  9507   PR :138313   1st Qu.: 30.00  
     SAN JUAN DE LURIGANCHO:  8767                Median : 41.00  
     CALLAO                :  7187                Mean   : 42.71  
     SAN MARTIN DE PORRES  :  6509                3rd Qu.: 54.00  
     ATE                   :  5686                Max.   :106.00  
     (Other)               :119918                NA's   :1031    
            sexo        fecha_resultado     
     Femenino : 70823   Min.   :2020-03-06  
     Masculino:105722   1st Qu.:2020-04-30  
     NA's     :  2369   Median :2020-05-14  
                        Mean   :2020-05-10  
                        3rd Qu.:2020-05-25  
                        Max.   :2020-06-02  
                        NA's   :919         

    summary(fallecimientos)

         uuid           fecha_fallecimiento       edad                 sexo     
     Length:4894        Min.   :2020-03-19   Min.   : 0.0   Femenino     :1189  
     Class :character   1st Qu.:2020-04-24   1st Qu.:56.0   Indeterminado: 664  
     Mode  :character   Median :2020-05-05   Median :66.0   Masculino    :3041  
                        Mean   :2020-05-05   Mean   :65.2                       
                        3rd Qu.:2020-05-19   3rd Qu.:75.0                       
                        Max.   :2020-06-02   Max.   :99.0                       
                                                                                
       fecha_nac              departamento     provincia   
     Min.   :1915-06-19   LIMA      :1947   LIMA    :1469  
     1st Qu.:1944-10-31   LAMBAYEQUE: 621   PIURA   : 302  
     Median :1953-11-21   PIURA     : 538   CHICLAYO: 221  
     Mean   :1954-10-11   CALLAO    : 346   CALLAO  : 191  
     3rd Qu.:1963-08-06   LORETO    : 300   TRUJILLO: 134  
     Max.   :2020-02-08   ANCASH    : 286   (Other) :1239  
     NA's   :747          (Other)   : 856   NA's    :1338  
                       distrito      edad_calc     
     CALLAO                : 193   Min.   :  0.17  
     SAN JUAN DE LURIGANCHO: 159   1st Qu.: 56.74  
     LIMA                  : 155   Median : 66.46  
     SAN MARTIN DE PORRES  : 152   Mean   : 65.57  
     CHIMBOTE              : 146   3rd Qu.: 75.48  
     (Other)               :3284   Max.   :104.86  
     NA's                  : 805   NA's   :747     

    summary(reconstruido)

      uuid_caso              departamento     provincia   
     Length:10786       LIMA       :8112   LIMA    :8055  
     Class :character   PIURA      : 769   CALLAO  : 755  
     Mode  :character   CALLAO     : 755   PIURA   : 497  
                        LAMBAYEQUE : 405   CHICLAYO: 346  
                        LA LIBERTAD: 219   TRUJILLO: 207  
                        ICA        : 196   SULLANA : 183  
                        (Other)    : 330   (Other) : 743  
                       distrito    metododx        edad                  sexo     
     SAN JUAN DE LURIGANCHO:2042   PCR:3240   Min.   : 4.00   Femenino     :1625  
     LIMA                  :1208   PR :7546   1st Qu.:49.00   Masculino    :9161  
     SAN MARTIN DE PORRES  :1129              Median :57.00   Indeterminado:   0  
     COMAS                 : 745              Mean   :57.19                       
     CALLAO                : 661              3rd Qu.:66.00                       
     LA VICTORIA           : 422              Max.   :98.00                       
     (Other)               :4579                                                  
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:10786       Min.   :2020-03-19  
     1st Qu.:2020-04-16   Class :character   1st Qu.:2020-04-29  
     Median :2020-04-25   Mode  :character   Median :2020-05-10  
     Mean   :2020-04-26                      Mean   :2020-05-11  
     3rd Qu.:2020-05-07                      3rd Qu.:2020-05-27  
     Max.   :2020-05-27                      Max.   :2020-05-28  
                                                                 
       fecha_nac            edad_calc     coincidencias  
     Min.   :1921-09-03   Min.   : 0.66   Min.   :1.000  
     1st Qu.:1953-04-21   1st Qu.:49.44   1st Qu.:1.000  
     Median :1962-08-11   Median :57.75   Median :1.000  
     Mean   :1962-07-13   Mean   :57.83   Mean   :1.519  
     3rd Qu.:1970-11-07   3rd Qu.:67.07   3rd Qu.:2.000  
     Max.   :2019-09-02   Max.   :98.65   Max.   :6.000  
                                                         

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 6815 casos reconstruídos.

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
