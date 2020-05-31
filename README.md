**Última actualización**: 2020-05-31 21:38:45 UTC

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

         uuid           fecha_fallecimiento  edad_declarada             sexo     
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
                     distrito         edad       
     CALLAO              : 178   Min.   :  0.17  
     CHICLAYO            : 139   1st Qu.: 56.70  
     SAN MARTIN DE PORRES: 137   Median : 66.53  
     CHIMBOTE            : 133   Mean   : 65.53  
     LIMA                : 128   3rd Qu.: 75.45  
     (Other)             :2851   Max.   :104.86  
     NA's                : 805   NA's   :749     

    summary(reconstruido)

      uuid_caso              departamento     provincia   
     Length:10543       LIMA       :7570   LIMA    :7500  
     Class :character   CALLAO     : 963   CALLAO  : 963  
     Mode  :character   PIURA      : 745   PIURA   : 494  
                        LAMBAYEQUE : 546   CHICLAYO: 484  
                        LA LIBERTAD: 198   TRUJILLO: 192  
                        ICA        : 172   SULLANA : 171  
                        (Other)    : 349   (Other) : 739  
                       distrito    metododx        edad                  sexo     
     SAN JUAN DE LURIGANCHO:1896   PCR:3610   Min.   :  0.0   Femenino     :1576  
     LIMA                  :1120   PR :6933   1st Qu.: 49.0   Masculino    :8967  
     SAN MARTIN DE PORRES  :1082              Median : 58.0   Indeterminado:   0  
     CALLAO                : 841              Mean   : 57.4                       
     COMAS                 : 707              3rd Qu.: 67.0                       
     CHICLAYO              : 426              Max.   :100.0                       
     (Other)               :4471                                                  
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento  edad_declarada 
     Min.   :2020-03-07   Length:10543       Min.   :2020-03-19   Min.   : 1.00  
     1st Qu.:2020-04-14   Class :character   1st Qu.:2020-04-28   1st Qu.:49.00  
     Median :2020-04-24   Mode  :character   Median :2020-05-09   Median :57.00  
     Mean   :2020-04-25                      Mean   :2020-05-10   Mean   :56.93  
     3rd Qu.:2020-05-05                      3rd Qu.:2020-05-27   3rd Qu.:66.00  
     Max.   :2020-05-27                      Max.   :2020-05-28   Max.   :99.00  
                                                                                 
       fecha_nac          coincidencias 
     Min.   :1920-04-18   Min.   :1.00  
     1st Qu.:1953-07-26   1st Qu.:1.00  
     Median :1962-10-15   Median :1.00  
     Mean   :1962-12-17   Mean   :1.48  
     3rd Qu.:1971-01-24   3rd Qu.:2.00  
     Max.   :2019-11-28   Max.   :6.00  
                                        

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 6813 casos reconstruídos.

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
