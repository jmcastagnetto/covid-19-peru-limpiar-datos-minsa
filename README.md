**Última actualización**: 2020-06-01 22:11:30 UTC

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
     Length:164476      LIMA       :101677   LIMA            :92965  
     Class :character   CALLAO     : 12167   CALLAO          :11943  
     Mode  :character   LAMBAYEQUE :  8484   EN INVESTIGACIÓN: 7622  
                        PIURA      :  6600   CHICLAYO        : 5563  
                        LORETO     :  4715   CORONEL PORTILLO: 3851  
                        LA LIBERTAD:  4660   MAYNAS          : 3642  
                        (Other)    : 26173   (Other)         :38890  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO:  9002   PCR: 38673   Min.   :  0.00  
     LIMA                  :  8742   PR :125803   1st Qu.: 30.00  
     EN INVESTIGACIÓN      :  7622                Median : 41.00  
     CALLAO                :  7160                Mean   : 42.35  
     SAN MARTIN DE PORRES  :  6696                3rd Qu.: 53.00  
     ATE                   :  5413                Max.   :120.00  
     (Other)               :119841                NA's   :422     
            sexo       fecha_resultado     
     Femenino :64353   Min.   :2020-03-06  
     Masculino:98326   1st Qu.:2020-04-29  
     NA's     : 1797   Median :2020-05-13  
                       Mean   :2020-05-09  
                       3rd Qu.:2020-05-22  
                       Max.   :2020-05-30  
                       NA's   :244         

    summary(fallecimientos)

         uuid           fecha_fallecimiento       edad                  sexo     
     Length:4506        Min.   :2020-03-19   Min.   : 0.00   Femenino     :1189  
     Class :character   1st Qu.:2020-04-23   1st Qu.:57.00   Indeterminado: 276  
     Mode  :character   Median :2020-05-04   Median :66.00   Masculino    :3041  
                        Mean   :2020-05-03   Mean   :65.21                       
                        3rd Qu.:2020-05-15   3rd Qu.:75.00                       
                        Max.   :2020-05-30   Max.   :99.00                       
                                                                                 
       fecha_nac              departamento     provincia   
     Min.   :1915-06-19   LIMA      :1709   LIMA    :1245  
     1st Qu.:1944-11-02   LAMBAYEQUE: 612   PIURA   : 292  
     Median :1953-10-29   PIURA     : 519   CHICLAYO: 214  
     Mean   :1954-10-10   CALLAO    : 321   CALLAO  : 166  
     3rd Qu.:1963-07-06   LORETO    : 296   TRUJILLO: 120  
     Max.   :2020-02-08   ANCASH    : 267   (Other) :1131  
     NA's   :748          (Other)   : 782   NA's    :1338  
                     distrito      edad_calc     
     CALLAO              : 183   Min.   :  0.17  
     SAN MARTIN DE PORRES: 142   1st Qu.: 56.84  
     CHICLAYO            : 139   Median : 66.52  
     LIMA                : 137   Mean   : 65.56  
     CHIMBOTE            : 136   3rd Qu.: 75.48  
     (Other)             :2964   Max.   :104.86  
     NA's                : 805   NA's   :748     

    summary(reconstruido)

      uuid_caso              departamento     provincia   
     Length:11354       LIMA       :8097   LIMA    :8007  
     Class :character   CALLAO     : 896   CALLAO  : 896  
     Mode  :character   PIURA      : 812   CHICLAYO: 545  
                        LAMBAYEQUE : 628   PIURA   : 526  
                        LA LIBERTAD: 247   TRUJILLO: 236  
                        ICA        : 241   SANTA   : 212  
                        (Other)    : 433   (Other) : 932  
                       distrito    metododx        edad                  sexo     
     SAN JUAN DE LURIGANCHO:2032   PCR:3858   Min.   : 1.00   Femenino     :1720  
     LIMA                  :1203   PR :7496   1st Qu.:49.00   Masculino    :9634  
     SAN MARTIN DE PORRES  :1104              Median :57.00   Indeterminado:   0  
     CALLAO                : 766              Mean   :57.17                       
     COMAS                 : 730              3rd Qu.:66.00                       
     CHICLAYO              : 462              Max.   :98.00                       
     (Other)               :5057                                                  
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:11354       Min.   :2020-03-19  
     1st Qu.:2020-04-15   Class :character   1st Qu.:2020-04-28  
     Median :2020-04-25   Mode  :character   Median :2020-05-09  
     Mean   :2020-04-26                      Mean   :2020-05-10  
     3rd Qu.:2020-05-06                      3rd Qu.:2020-05-27  
     Max.   :2020-05-27                      Max.   :2020-05-28  
                                                                 
       fecha_nac            edad_calc     coincidencias  
     Min.   :1921-09-03   Min.   : 0.66   Min.   :1.000  
     1st Qu.:1953-04-21   1st Qu.:49.36   1st Qu.:1.000  
     Median :1962-06-23   Median :57.86   Median :1.000  
     Mean   :1962-07-18   Mean   :57.81   Mean   :1.517  
     3rd Qu.:1970-12-23   3rd Qu.:67.07   3rd Qu.:2.000  
     Max.   :2019-09-02   Max.   :98.65   Max.   :6.000  
                                                         

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 7175 casos reconstruídos.

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
