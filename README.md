**Última actualización**: 2020-06-06 00:31:12 UTC

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
     Length:183198      LIMA       :108680   LIMA            :92243  
     Class :character   CALLAO     : 13291   EN INVESTIGACIÓN:18811  
     Mode  :character   PIURA      :  9510   CALLAO          :12698  
                        LAMBAYEQUE :  9440   CHICLAYO        : 6008  
                        LORETO     :  5757   CORONEL PORTILLO: 4630  
                        LA LIBERTAD:  5392   PIURA           : 4443  
                        (Other)    : 31128   (Other)         :44365  
                       distrito      metododx          edad       
     EN INVESTIGACIÓN      : 18811   PCR: 41820   Min.   :  0.00  
     LIMA                  :  9168   PR :141378   1st Qu.: 30.00  
     SAN JUAN DE LURIGANCHO:  8808                Median : 41.00  
     CALLAO                :  7612                Mean   : 42.84  
     SAN MARTIN DE PORRES  :  6513                3rd Qu.: 54.00  
     ATE                   :  5699                Max.   :120.00  
     (Other)               :126587                NA's   :1028    
            sexo        fecha_resultado     
     Femenino : 73031   Min.   :2020-03-06  
     Masculino:107824   1st Qu.:2020-04-30  
     NA's     :  2343   Median :2020-05-14  
                        Mean   :2020-05-11  
                        3rd Qu.:2020-05-25  
                        Max.   :2020-06-03  
                        NA's   :915         

    summary(fallecimientos)

         uuid           fecha_fallecimiento       edad                  sexo     
     Length:5031        Min.   :2020-03-19   Min.   : 0.00   Femenino     :1189  
     Class :character   1st Qu.:2020-04-24   1st Qu.:56.00   Indeterminado: 801  
     Mode  :character   Median :2020-05-06   Median :66.00   Masculino    :3041  
                        Mean   :2020-05-06   Mean   :65.15                       
                        3rd Qu.:2020-05-21   3rd Qu.:75.00                       
                        Max.   :2020-06-03   Max.   :99.00                       
                                                                                 
       fecha_nac              departamento     provincia   
     Min.   :1915-06-19   LIMA      :2019   LIMA    :1533  
     1st Qu.:1944-11-23   LAMBAYEQUE: 621   PIURA   : 307  
     Median :1954-01-01   PIURA     : 548   CHICLAYO: 221  
     Mean   :1954-11-01   CALLAO    : 360   CALLAO  : 205  
     3rd Qu.:1963-07-29   LORETO    : 300   TRUJILLO: 139  
     Max.   :2020-02-08   ANCASH    : 292   (Other) :1288  
     NA's   :747          (Other)   : 891   NA's    :1338  
                       distrito      edad_calc     
     CALLAO                : 198   Min.   :  0.17  
     SAN JUAN DE LURIGANCHO: 167   1st Qu.: 56.75  
     LIMA                  : 159   Median : 66.32  
     SAN MARTIN DE PORRES  : 155   Mean   : 65.51  
     CHIMBOTE              : 150   3rd Qu.: 75.44  
     (Other)               :3397   Max.   :104.86  
     NA's                  : 805   NA's   :747     

    summary(reconstruido)

      uuid_caso              departamento     provincia   
     Length:11538       LIMA       :7878   LIMA    :7793  
     Class :character   PIURA      :1136   CALLAO  : 889  
     Mode  :character   CALLAO     : 889   PIURA   : 761  
                        LAMBAYEQUE : 684   CHICLAYO: 601  
                        LA LIBERTAD: 253   SULLANA : 256  
                        ICA        : 243   TRUJILLO: 241  
                        (Other)    : 455   (Other) : 997  
                       distrito    metododx        edad                  sexo     
     SAN JUAN DE LURIGANCHO:1970   PCR:3654   Min.   : 2.00   Femenino     :1840  
     LIMA                  :1168   PR :7884   1st Qu.:49.00   Masculino    :9698  
     SAN MARTIN DE PORRES  :1079              Median :57.00   Indeterminado:   0  
     CALLAO                : 755              Mean   :57.46                       
     COMAS                 : 732              3rd Qu.:67.00                       
     CHICLAYO              : 524              Max.   :98.00                       
     (Other)               :5310                                                  
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:11538       Min.   :2020-03-19  
     1st Qu.:2020-04-15   Class :character   1st Qu.:2020-04-28  
     Median :2020-04-25   Mode  :character   Median :2020-05-09  
     Mean   :2020-04-26                      Mean   :2020-05-10  
     3rd Qu.:2020-05-06                      3rd Qu.:2020-05-27  
     Max.   :2020-05-27                      Max.   :2020-05-28  
                                                                 
       fecha_nac            edad_calc     coincidencias  
     Min.   :1921-09-03   Min.   : 0.66   Min.   :1.000  
     1st Qu.:1953-04-11   1st Qu.:49.79   1st Qu.:1.000  
     Median :1962-04-29   Median :58.05   Median :1.000  
     Mean   :1962-04-06   Mean   :58.09   Mean   :1.518  
     3rd Qu.:1970-07-28   3rd Qu.:67.10   3rd Qu.:2.000  
     Max.   :2019-09-02   Max.   :98.65   Max.   :6.000  
                                                         

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 7283 casos reconstruídos.

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
