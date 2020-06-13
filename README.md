[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-06-13 22:30:41 UTC

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

**2020-06-12**

-   Al menos a partir de ayer, ya aparecen nuevamente los valores
    definidos para el sexo en los datos.

Información relevante
---------------------

Fuentes de datos:

-   <a href="https://www.datosabiertos.gob.pe/dataset/casos-positivos-por-covid-19-ministerio-de-salud-minsa" class="uri">https://www.datosabiertos.gob.pe/dataset/casos-positivos-por-covid-19-ministerio-de-salud-minsa</a>
-   <a href="https://www.datosabiertos.gob.pe/dataset/fallecidos-por-covid-19-ministerio-de-salud-minsa" class="uri">https://www.datosabiertos.gob.pe/dataset/fallecidos-por-covid-19-ministerio-de-salud-minsa</a>

Luego del primer paso de limpieza de datos:

    summary(casos)

         uuid                departamento               provincia     
     Length:220749      LIMA       :128700   LIMA            :121141  
     Class :character   CALLAO     : 15200   CALLAO          : 14427  
     Mode  :character   PIURA      : 12768   CHICLAYO        :  7229  
                        LAMBAYEQUE : 10791   PIURA           :  6208  
                        LORETO     :  7167   EN INVESTIGACIÓN:  5815  
                        LA LIBERTAD:  6830   CORONEL PORTILLO:  5686  
                        (Other)    : 39293   (Other)         : 60243  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 11690   PCR: 51605   Min.   :  0.00  
     LIMA                  : 11189   PR :169144   1st Qu.: 30.00  
     SAN MARTIN DE PORRES  :  9025                Median : 42.00  
     CALLAO                :  8638                Mean   : 42.99  
     COMAS                 :  6803                3rd Qu.: 54.00  
     ATE                   :  6470                Max.   :120.00  
     (Other)               :166934                NA's   :1524    
            sexo        fecha_resultado     
     Femenino : 89553   Min.   :2020-03-06  
     Masculino:128393   1st Qu.:2020-05-04  
     NA's     :  2803   Median :2020-05-19  
                        Mean   :2020-05-15  
                        3rd Qu.:2020-05-29  
                        Max.   :2020-06-11  
                        NA's   :1339        

    summary(fallecimientos)

         uuid           fecha_fallecimiento       edad               sexo     
     Length:6308        Min.   :2020-03-19   Min.   :  0.00   Femenino :1833  
     Class :character   1st Qu.:2020-04-28   1st Qu.: 56.00   Masculino:4475  
     Mode  :character   Median :2020-05-12   Median : 66.00                   
                        Mean   :2020-05-13   Mean   : 65.14                   
                        3rd Qu.:2020-06-01   3rd Qu.: 75.00                   
                        Max.   :2020-06-11   Max.   :100.00                   
                                                                              
       fecha_nac              departamento     provincia   
     Min.   :1915-06-19   LIMA      :2784   LIMA    :2243  
     1st Qu.:1944-12-03   LAMBAYEQUE: 656   PIURA   : 332  
     Median :1954-01-09   PIURA     : 605   CALLAO  : 279  
     Mean   :1954-11-02   CALLAO    : 434   CHICLAYO: 245  
     3rd Qu.:1963-07-17   ANCASH    : 347   TRUJILLO: 208  
     Max.   :2020-02-08   ICA       : 328   (Other) :1663  
     NA's   :748          (Other)   :1154   NA's    :1338  
                       distrito      edad_calc     
     SAN JUAN DE LURIGANCHO: 262   Min.   :  0.17  
     CALLAO                : 234   1st Qu.: 56.84  
     SAN MARTIN DE PORRES  : 218   Median : 66.31  
     LIMA                  : 210   Mean   : 65.53  
     CHIMBOTE              : 186   3rd Qu.: 75.43  
     (Other)               :4393   Max.   :104.86  
     NA's                  : 805   NA's   :748     

    summary(reconstruido)

      uuid_caso              departamento      provincia    
     Length:52899       LIMA       :42283   LIMA    :41907  
     Class :character   CALLAO     : 4293   CALLAO  : 4293  
     Mode  :character   PIURA      : 1802   SANTA   : 1170  
                        ANCASH     : 1193   PIURA   : 1153  
                        LAMBAYEQUE : 1059   CHICLAYO:  939  
                        LA LIBERTAD:  898   TRUJILLO:  860  
                        (Other)    : 1371   (Other) : 2577  
                       distrito     metododx         edad               sexo      
     SAN JUAN DE LURIGANCHO:10464   PCR:15141   Min.   :  0.00   Femenino :10476  
     LIMA                  : 5528   PR :37758   1st Qu.: 50.00   Masculino:42423  
     SAN MARTIN DE PORRES  : 5103               Median : 57.00                    
     COMAS                 : 3678               Mean   : 57.36                    
     CALLAO                : 3375               3rd Qu.: 66.00                    
     VILLA EL SALVADOR     : 2453               Max.   :100.00                    
     (Other)               :22298                                                 
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:52899       Min.   :2020-03-19  
     1st Qu.:2020-04-25   Class :character   1st Qu.:2020-05-29  
     Median :2020-05-11   Mode  :character   Median :2020-06-03  
     Mean   :2020-05-08                      Mean   :2020-05-30  
     3rd Qu.:2020-05-23                      3rd Qu.:2020-06-08  
     Max.   :2020-06-10                      Max.   :2020-06-11  
                                                                 
       fecha_nac            edad_calc      coincidencias  
     Min.   :1919-12-01   Min.   :  0.57   Min.   :1.000  
     1st Qu.:1954-03-29   1st Qu.: 50.09   1st Qu.:1.000  
     Median :1962-07-24   Median : 57.80   Median :2.000  
     Mean   :1962-07-09   Mean   : 57.89   Mean   :2.155  
     3rd Qu.:1970-05-02   3rd Qu.: 66.17   3rd Qu.:3.000  
     Max.   :2019-11-10   Max.   :100.51   Max.   :9.000  
                                                          

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 22877 casos reconstruídos.

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
