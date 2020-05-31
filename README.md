**Última actualización**: 2020-05-31 22:20:24 UTC

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

         uuid                departamento              provincia    
     Length:155671      LIMA       :96583   LIMA            :91252  
     Class :character   CALLAO     :12105   CALLAO          :12031  
     Mode  :character   PIURA      : 7180   CHICLAYO        : 4754  
                        LAMBAYEQUE : 7020   EN INVESTIGACIÓN: 3747  
                        LORETO     : 4635   MAYNAS          : 3603  
                        LA LIBERTAD: 3998   CORONEL PORTILLO: 3475  
                        (Other)    :24150   (Other)         :36809  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO:  8916   PCR: 37650   Min.   :  0.00  
     LIMA                  :  8373   PR :118021   1st Qu.: 30.00  
     CALLAO                :  7360                Median : 41.00  
     SAN MARTIN DE PORRES  :  6614                Mean   : 42.37  
     ATE                   :  5300                3rd Qu.: 53.00  
     COMAS                 :  5006                Max.   :120.00  
     (Other)               :114102                NA's   :296     
            sexo       fecha_resultado     
     Femenino :60260   Min.   :2020-03-06  
     Masculino:93739   1st Qu.:2020-04-29  
     NA's     : 1672   Median :2020-05-12  
                       Mean   :2020-05-08  
                       3rd Qu.:2020-05-21  
                       Max.   :2020-05-29  
                       NA's   :215         

    summary(fallecimientos)

         uuid           fecha_fallecimiento       edad                  sexo     
     Length:4371        Min.   :2020-03-19   Min.   : 0.00   Femenino     :1189  
     Class :character   1st Qu.:2020-04-22   1st Qu.:56.00   Indeterminado: 141  
     Mode  :character   Median :2020-05-03   Median :66.00   Masculino    :3041  
                        Mean   :2020-05-02   Mean   :65.18                       
                        3rd Qu.:2020-05-14   3rd Qu.:75.00                       
                        Max.   :2020-05-29   Max.   :99.00                       
                                                                                 
       fecha_nac              departamento     provincia   
     Min.   :1915-06-19   LIMA      :1625   LIMA    :1166  
     1st Qu.:1944-11-10   LAMBAYEQUE: 611   PIURA   : 287  
     Median :1953-10-21   PIURA     : 510   CHICLAYO: 214  
     Mean   :1954-10-22   CALLAO    : 312   CALLAO  : 157  
     3rd Qu.:1963-08-15   LORETO    : 295   TRUJILLO: 116  
     Max.   :2020-02-08   ANCASH    : 262   (Other) :1093  
     NA's   :749          (Other)   : 756   NA's    :1338  
                     distrito      edad_calc     
     CALLAO              : 178   Min.   :  0.17  
     CHICLAYO            : 139   1st Qu.: 56.70  
     SAN MARTIN DE PORRES: 137   Median : 66.53  
     CHIMBOTE            : 133   Mean   : 65.53  
     LIMA                : 128   3rd Qu.: 75.45  
     (Other)             :2851   Max.   :104.86  
     NA's                : 805   NA's   :749     

    summary(reconstruido)

      uuid_caso              departamento     provincia   
     Length:11403       LIMA       :8112   LIMA    :8021  
     Class :character   CALLAO     :1014   CALLAO  :1014  
     Mode  :character   PIURA      : 847   PIURA   : 552  
                        LAMBAYEQUE : 584   CHICLAYO: 512  
                        LA LIBERTAD: 228   TRUJILLO: 220  
                        ICA        : 207   SULLANA : 199  
                        (Other)    : 411   (Other) : 885  
                       distrito    metododx        edad                  sexo     
     SAN JUAN DE LURIGANCHO:2031   PCR:3858   Min.   : 1.00   Femenino     :1736  
     LIMA                  :1187   PR :7545   1st Qu.:49.00   Masculino    :9667  
     SAN MARTIN DE PORRES  :1106              Median :57.00   Indeterminado:   0  
     CALLAO                : 885              Mean   :57.12                       
     COMAS                 : 746              3rd Qu.:66.00                       
     CHICLAYO              : 445              Max.   :98.00                       
     (Other)               :5003                                                  
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:11403       Min.   :2020-03-19  
     1st Qu.:2020-04-14   Class :character   1st Qu.:2020-04-28  
     Median :2020-04-24   Mode  :character   Median :2020-05-09  
     Mean   :2020-04-25                      Mean   :2020-05-10  
     3rd Qu.:2020-05-06                      3rd Qu.:2020-05-27  
     Max.   :2020-05-27                      Max.   :2020-05-28  
                                                                 
       fecha_nac            edad_calc     coincidencias  
     Min.   :1921-09-03   Min.   : 0.66   Min.   :1.000  
     1st Qu.:1953-05-01   1st Qu.:49.34   1st Qu.:1.000  
     Median :1962-06-23   Median :57.86   Median :1.000  
     Mean   :1962-08-10   Mean   :57.75   Mean   :1.521  
     3rd Qu.:1971-01-20   3rd Qu.:67.05   3rd Qu.:2.000  
     Max.   :2019-09-02   Max.   :98.65   Max.   :6.000  
                                                         

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 7167 casos reconstruídos.

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
