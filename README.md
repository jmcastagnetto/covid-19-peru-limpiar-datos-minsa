**Última actualización**: 2020-05-29 17:02:23 UTC

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
     Length:141779      LIMA       :87478   LIMA            :83361  
     Class :character   CALLAO     : 9953   CALLAO          : 9847  
     Mode  :character   LAMBAYEQUE : 7020   CHICLAYO        : 4715  
                        PIURA      : 6942   EN INVESTIGACIÓN: 4289  
                        LORETO     : 3959   CORONEL PORTILLO: 3186  
                        LA LIBERTAD: 3818   MAYNAS          : 3112  
                        (Other)    :22609   (Other)         :33269  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO:  8451   PCR: 35632   Min.   :  0.00  
     LIMA                  :  7874   PR :106147   1st Qu.: 30.00  
     SAN MARTIN DE PORRES  :  6329                Median : 41.00  
     CALLAO                :  5905                Mean   : 42.63  
     ATE                   :  4769                3rd Qu.: 54.00  
     COMAS                 :  4499                Max.   :106.00  
     (Other)               :103952                NA's   :2700    
            sexo       fecha_resultado     
     Femenino :51484   Min.   :2020-03-06  
     Masculino:87344   1st Qu.:2020-04-28  
     NA's     : 2951   Median :2020-05-10  
                       Mean   :2020-05-07  
                       3rd Qu.:2020-05-20  
                       Max.   :2020-05-27  
                       NA's   :1757        

    summary(fallecimientos)

         uuid           fecha_fallecimiento  edad_declarada        sexo     
     Length:4099        Min.   :2020-03-19   Min.   : 0.0   Femenino :1151  
     Class :character   1st Qu.:2020-04-21   1st Qu.:56.0   Masculino:2948  
     Mode  :character   Median :2020-05-02   Median :66.0                   
                        Mean   :2020-05-01   Mean   :65.2                   
                        3rd Qu.:2020-05-11   3rd Qu.:75.0                   
                        Max.   :2020-05-27   Max.   :99.0                   
                                                                            
       fecha_nac              departamento     provincia   
     Min.   :1915-06-19   LIMA      :1473   LIMA    :1026  
     1st Qu.:1944-10-28   LAMBAYEQUE: 605   PIURA   : 282  
     Median :1953-12-05   PIURA     : 497   CHICLAYO: 210  
     Mean   :1954-10-15   CALLAO    : 289   CALLAO  : 134  
     3rd Qu.:1963-09-09   LORETO    : 289   CHINCHA : 110  
     Max.   :2020-02-08   ANCASH    : 241   (Other) : 999  
     NA's   :748          (Other)   : 705   NA's    :1338  
                     distrito         edad       
     CALLAO              : 171   Min.   :  0.17  
     CHICLAYO            : 138   1st Qu.: 56.66  
     SAN MARTIN DE PORRES: 128   Median : 66.39  
     CHIMBOTE            : 123   Mean   : 65.54  
     LIMA                : 120   3rd Qu.: 75.50  
     (Other)             :2614   Max.   :104.86  
     NA's                : 805   NA's   :748     

    summary(reconstruido)

      uuid_caso              departamento     provincia   
     Length:8360        LIMA       :5880   LIMA    :5868  
     Class :character   CALLAO     : 653   CALLAO  : 653  
     Mode  :character   PIURA      : 602   CHICLAYO: 487  
                        LAMBAYEQUE : 555   PIURA   : 410  
                        LA LIBERTAD: 185   TRUJILLO: 176  
                        ICA        : 170   SANTA   : 135  
                        (Other)    : 315   (Other) : 631  
                       distrito    metododx        edad               sexo     
     SAN JUAN DE LURIGANCHO:1269   PCR:3001   Min.   :  0.00   Femenino :1232  
     LIMA                  :1053   PR :5359   1st Qu.: 49.00   Masculino:7128  
     SAN MARTIN DE PORRES  : 982              Median : 57.00                   
     CALLAO                : 574              Mean   : 56.95                   
     COMAS                 : 514              3rd Qu.: 66.00                   
     CHICLAYO              : 433              Max.   :100.00                   
     (Other)               :3535                                               
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento  edad_declarada 
     Min.   :2020-03-07   Length:8360        Min.   :2020-03-19   Min.   : 2.00  
     1st Qu.:2020-04-14   Class :character   1st Qu.:2020-04-27   1st Qu.:49.00  
     Median :2020-04-23   Mode  :character   Median :2020-05-06   Median :57.00  
     Mean   :2020-04-24                      Mean   :2020-05-08   Mean   :56.51  
     3rd Qu.:2020-05-03                      3rd Qu.:2020-05-27   3rd Qu.:65.00  
     Max.   :2020-05-26                      Max.   :2020-05-27   Max.   :99.00  
                                                                                 
       fecha_nac          coincidencias  
     Min.   :1920-04-18   Min.   :1.000  
     1st Qu.:1954-07-13   1st Qu.:1.000  
     Median :1962-12-19   Median :1.000  
     Mean   :1963-05-20   Mean   :1.493  
     3rd Qu.:1971-01-24   3rd Qu.:2.000  
     Max.   :2019-11-28   Max.   :6.000  
                                         

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 5300 casos reconstruídos.

    ## [1] "es_PE.utf8"

![“Positivos por día. MINSA”](positivos-por-dia-minsa.png)

![“Positivos acumulados. MINSA”](positivos-acumulados-minsa.png)

![“Fallecimientos por día. MINSA”](fallecimientos-por-dia-minsa.png)

![“Fallecimientos acumulados.
MINSA”](fallecimientos-acumulados-minsa.png)

Los archivos “limpios” son:

-   datos/DATOSABIERTOS\_SISCOVID-utf8-limpio.csv.gz
-   datos/FALLECIDOS\_CDC-utf8-limpio.csv.gz

Y algunos reconstruidos con los anteriores:

-   datos/casos\_fallecimientos\_reconstruccion\_posible.csv.gz
-   datos/timeseries-casos.csv.gz
-   datos/timeseries-casos-lugares.csv.gz
-   datos/timeseries-fallecimientos.csv.gz
-   datos/timeseries-fallecimientos-lugares.csv.gz
