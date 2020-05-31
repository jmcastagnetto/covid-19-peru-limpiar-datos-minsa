**Última actualización**: 2020-05-31 00:54:50 UTC

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
     Length:148295      LIMA       :92057   LIMA            :88503  
     Class :character   CALLAO     :10781   CALLAO          :10779  
     Mode  :character   PIURA      : 7182   CHICLAYO        : 4729  
                        LAMBAYEQUE : 7060   CORONEL PORTILLO: 3457  
                        LORETO     : 4109   PIURA           : 3357  
                        LA LIBERTAD: 3816   MAYNAS          : 3217  
                        (Other)    :23290   (Other)         :34253  
                       distrito      metododx          edad       
     LIMA                  :  9829   PCR: 36705   Min.   :  0.00  
     SAN JUAN DE LURIGANCHO:  7474   PR :111590   1st Qu.: 30.00  
     CALLAO                :  6577                Median : 41.00  
     JESUS MARIA           :  5615                Mean   : 42.44  
     SAN MARTIN DE PORRES  :  5534                3rd Qu.: 54.00  
     LA VICTORIA           :  4634                Max.   :120.00  
     (Other)               :108632                NA's   :242     
            sexo       fecha_resultado     
     Femenino :57737   Min.   :2020-03-06  
     Masculino:88883   1st Qu.:2020-04-28  
     NA's     : 1675   Median :2020-05-11  
                       Mean   :2020-05-07  
                       3rd Qu.:2020-05-20  
                       Max.   :2020-05-28  
                       NA's   :222         

    summary(fallecimientos)

         uuid           fecha_fallecimiento  edad_declarada         sexo     
     Length:4230        Min.   :2020-03-19   Min.   : 0.00   Femenino :1189  
     Class :character   1st Qu.:2020-04-22   1st Qu.:56.00   Masculino:3041  
     Mode  :character   Median :2020-05-03   Median :66.00                   
                        Mean   :2020-05-02   Mean   :65.21                   
                        3rd Qu.:2020-05-12   3rd Qu.:75.00                   
                        Max.   :2020-05-28   Max.   :99.00                   
                                                                             
       fecha_nac              departamento     provincia   
     Min.   :1915-06-19   LIMA      :1547   LIMA    :1092  
     1st Qu.:1944-10-28   LAMBAYEQUE: 608   PIURA   : 286  
     Median :1953-12-05   PIURA     : 507   CHICLAYO: 212  
     Mean   :1954-10-15   CALLAO    : 298   CALLAO  : 143  
     3rd Qu.:1963-09-09   LORETO    : 293   CHINCHA : 113  
     Max.   :2020-02-08   ANCASH    : 252   (Other) :1046  
     NA's   :879          (Other)   : 725   NA's    :1338  
                     distrito         edad       
     CALLAO              : 173   Min.   :  0.17  
     CHICLAYO            : 138   1st Qu.: 56.66  
     SAN MARTIN DE PORRES: 133   Median : 66.39  
     CHIMBOTE            : 128   Mean   : 65.54  
     LIMA                : 123   3rd Qu.: 75.50  
     (Other)             :2730   Max.   :104.86  
     NA's                : 805   NA's   :879     

    summary(reconstruido)

      uuid_caso              departamento     provincia   
     Length:8549        LIMA       :5804   LIMA    :5754  
     Class :character   CALLAO     : 828   CALLAO  : 828  
     Mode  :character   PIURA      : 687   CHICLAYO: 504  
                        LAMBAYEQUE : 565   PIURA   : 467  
                        LA LIBERTAD: 190   TRUJILLO: 182  
                        ICA        : 177   SULLANA : 151  
                        (Other)    : 298   (Other) : 663  
                       distrito    metododx        edad               sexo     
     LIMA                  :1407   PCR:2757   Min.   :  0.00   Femenino :1335  
     SAN JUAN DE LURIGANCHO:1187   PR :5792   1st Qu.: 50.00   Masculino:7214  
     SAN MARTIN DE PORRES  : 776              Median : 58.00                   
     CALLAO                : 753              Mean   : 57.49                   
     COMAS                 : 440              3rd Qu.: 67.00                   
     CHICLAYO              : 438              Max.   :100.00                   
     (Other)               :3548                                               
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento  edad_declarada 
     Min.   :2020-03-07   Length:8549        Min.   :2020-03-19   Min.   : 2.00  
     1st Qu.:2020-04-13   Class :character   1st Qu.:2020-04-27   1st Qu.:49.00  
     Median :2020-04-22   Mode  :character   Median :2020-05-05   Median :57.00  
     Mean   :2020-04-23                      Mean   :2020-05-07   Mean   :57.05  
     3rd Qu.:2020-05-02                      3rd Qu.:2020-05-24   3rd Qu.:66.00  
     Max.   :2020-05-26                      Max.   :2020-05-27   Max.   :99.00  
                                                                                 
       fecha_nac          coincidencias  
     Min.   :1920-04-18   Min.   :1.000  
     1st Qu.:1953-09-24   1st Qu.:1.000  
     Median :1962-10-05   Median :1.000  
     Mean   :1962-11-05   Mean   :1.501  
     3rd Qu.:1970-10-08   3rd Qu.:2.000  
     Max.   :2019-11-28   Max.   :5.000  
                                         

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 5394 casos reconstruídos.

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
