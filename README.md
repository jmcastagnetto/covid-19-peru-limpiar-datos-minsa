**Última actualización**: 2020-06-03 23:39:39 UTC

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
     Length:170039      LIMA       :103020   LIMA            :94120  
     Class :character   CALLAO     : 12495   EN INVESTIGACIÓN:16737  
     Mode  :character   LAMBAYEQUE :  8811   CALLAO          :10842  
                        PIURA      :  8143   CHICLAYO        : 5114  
                        LORETO     :  5133   CORONEL PORTILLO: 3845  
                        LA LIBERTAD:  4898   PIURA           : 3347  
                        (Other)    : 27539   (Other)         :36034  
                       distrito      metododx          edad       
     EN INVESTIGACIÓN      : 16737   PCR: 39716   Min.   :  0.00  
     SAN JUAN DE LURIGANCHO:  9056   PR :130323   1st Qu.: 30.00  
     LIMA                  :  8960                Median : 41.00  
     CALLAO                :  6814                Mean   : 42.41  
     SAN MARTIN DE PORRES  :  6717                3rd Qu.: 53.00  
     ATE                   :  5601                Max.   :120.00  
     (Other)               :116154                NA's   :2672    
            sexo        fecha_resultado     
     Femenino : 65227   Min.   :2020-03-06  
     Masculino:100796   1st Qu.:2020-04-29  
     NA's     :  4016   Median :2020-05-13  
                        Mean   :2020-05-09  
                        3rd Qu.:2020-05-22  
                        Max.   :2020-05-31  
                        NA's   :2572        

    summary(fallecimientos)

         uuid           fecha_fallecimiento       edad                  sexo     
     Length:4767        Min.   :2020-03-19   Min.   : 0.00   Femenino     :1189  
     Class :character   1st Qu.:2020-04-23   1st Qu.:56.00   Indeterminado: 537  
     Mode  :character   Median :2020-05-05   Median :66.00   Masculino    :3041  
                        Mean   :2020-05-05   Mean   :65.23                       
                        3rd Qu.:2020-05-18   3rd Qu.:75.00                       
                        Max.   :2020-06-01   Max.   :99.00                       
                                                                                 
       fecha_nac              departamento     provincia   
     Min.   :1915-06-19   LIMA      :1868   LIMA    :1395  
     1st Qu.:1944-10-21   LAMBAYEQUE: 618   PIURA   : 299  
     Median :1953-10-29   PIURA     : 531   CHICLAYO: 219  
     Mean   :1954-09-29   CALLAO    : 338   CALLAO  : 183  
     3rd Qu.:1963-07-21   LORETO    : 299   TRUJILLO: 131  
     Max.   :2020-02-08   ANCASH    : 277   (Other) :1202  
     NA's   :747          (Other)   : 836   NA's    :1338  
                       distrito      edad_calc     
     CALLAO                : 190   Min.   :  0.17  
     LIMA                  : 151   1st Qu.: 56.77  
     SAN MARTIN DE PORRES  : 149   Median : 66.52  
     SAN JUAN DE LURIGANCHO: 148   Mean   : 65.60  
     CHICLAYO              : 141   3rd Qu.: 75.52  
     (Other)               :3183   Max.   :104.86  
     NA's                  : 805   NA's   :747     

    summary(reconstruido)

      uuid_caso              departamento     provincia   
     Length:10847       LIMA       :8189   LIMA    :8133  
     Class :character   PIURA      : 760   CALLAO  : 752  
     Mode  :character   CALLAO     : 752   PIURA   : 492  
                        LAMBAYEQUE : 405   CHICLAYO: 346  
                        LA LIBERTAD: 222   TRUJILLO: 210  
                        ICA        : 196   SULLANA : 179  
                        (Other)    : 323   (Other) : 735  
                       distrito    metododx        edad                  sexo     
     SAN JUAN DE LURIGANCHO:2094   PCR:3240   Min.   : 1.00   Femenino     :1620  
     LIMA                  :1197   PR :7607   1st Qu.:49.00   Masculino    :9227  
     SAN MARTIN DE PORRES  :1144              Median :57.00   Indeterminado:   0  
     COMAS                 : 747              Mean   :57.05                       
     CALLAO                : 658              3rd Qu.:66.00                       
     LA VICTORIA           : 426              Max.   :98.00                       
     (Other)               :4581                                                  
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:10847       Min.   :2020-03-19  
     1st Qu.:2020-04-16   Class :character   1st Qu.:2020-04-29  
     Median :2020-04-25   Mode  :character   Median :2020-05-10  
     Mean   :2020-04-26                      Mean   :2020-05-11  
     3rd Qu.:2020-05-07                      3rd Qu.:2020-05-27  
     Max.   :2020-05-27                      Max.   :2020-05-28  
                                                                 
       fecha_nac            edad_calc     coincidencias  
     Min.   :1921-09-03   Min.   : 0.66   Min.   :1.000  
     1st Qu.:1953-05-01   1st Qu.:49.34   1st Qu.:1.000  
     Median :1962-08-25   Median :57.73   Median :1.000  
     Mean   :1962-08-30   Mean   :57.70   Mean   :1.519  
     3rd Qu.:1971-01-24   3rd Qu.:67.04   3rd Qu.:2.000  
     Max.   :2019-09-02   Max.   :98.65   Max.   :6.000  
                                                         

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 6841 casos reconstruídos.

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
