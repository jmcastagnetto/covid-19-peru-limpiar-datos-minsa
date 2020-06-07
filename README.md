**Última actualización**: 2020-06-07 18:30:15 UTC

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
     Length:191758      LIMA       :112974   LIMA            :93964  
     Class :character   CALLAO     : 13656   EN INVESTIGACIÓN:17358  
     Mode  :character   PIURA      : 10487   CALLAO          :13512  
                        LAMBAYEQUE :  9686   CHICLAYO        : 6448  
                        LORETO     :  6187   PIURA           : 4977  
                        LA LIBERTAD:  5670   CORONEL PORTILLO: 4837  
                        (Other)    : 33098   (Other)         :50662  
                       distrito      metododx          edad       
     EN INVESTIGACIÓN      : 17358   PCR: 44018   Min.   :  0.00  
     LIMA                  :  9428   PR :147740   1st Qu.: 30.00  
     SAN JUAN DE LURIGANCHO:  8887                Median : 42.00  
     CALLAO                :  7779                Mean   : 42.92  
     SAN MARTIN DE PORRES  :  6562                3rd Qu.: 54.00  
     COMAS                 :  5891                Max.   :120.00  
     (Other)               :135853                NA's   :1677    
            sexo        fecha_resultado     
     Femenino : 76448   Min.   :2020-03-06  
     Masculino:112350   1st Qu.:2020-05-01  
     NA's     :  2960   Median :2020-05-15  
                        Mean   :2020-05-12  
                        3rd Qu.:2020-05-25  
                        Max.   :2020-06-05  
                        NA's   :1496        

    summary(fallecimientos)

         uuid           fecha_fallecimiento       edad               sexo     
     Length:5301        Min.   :2020-03-19   Min.   :  0.00   Femenino :1523  
     Class :character   1st Qu.:2020-04-25   1st Qu.: 56.00   Masculino:3778  
     Mode  :character   Median :2020-05-07   Median : 66.00                   
                        Mean   :2020-05-08   Mean   : 65.15                   
                        3rd Qu.:2020-05-25   3rd Qu.: 75.00                   
                        Max.   :2020-06-05   Max.   :100.00                   
                                                                              
       fecha_nac              departamento     provincia   
     Min.   :1915-06-19   LIMA      :2186   LIMA    :1691  
     1st Qu.:1944-11-01   LAMBAYEQUE: 630   PIURA   : 310  
     Median :1954-01-11   PIURA     : 560   CHICLAYO: 228  
     Mean   :1954-10-29   CALLAO    : 378   CALLAO  : 223  
     3rd Qu.:1963-08-09   ANCASH    : 305   TRUJILLO: 152  
     Max.   :2020-02-08   LORETO    : 303   (Other) :1359  
     NA's   :747          (Other)   : 939   NA's    :1338  
                       distrito      edad_calc     
     CALLAO                : 206   Min.   :  0.17  
     SAN JUAN DE LURIGANCHO: 191   1st Qu.: 56.75  
     LIMA                  : 169   Median : 66.28  
     SAN MARTIN DE PORRES  : 167   Mean   : 65.53  
     CHIMBOTE              : 159   3rd Qu.: 75.49  
     (Other)               :3604   Max.   :104.86  
     NA's                  : 805   NA's   :747     

    summary(reconstruido)

      uuid_caso              departamento      provincia    
     Length:30189       LIMA       :22788   LIMA    :22554  
     Class :character   CALLAO     : 2822   CALLAO  : 2822  
     Mode  :character   PIURA      : 1507   PIURA   :  976  
                        LAMBAYEQUE :  854   SANTA   :  757  
                        ANCASH     :  772   CHICLAYO:  754  
                        LA LIBERTAD:  489   TRUJILLO:  462  
                        (Other)    :  957   (Other) : 1864  
                       distrito     metododx         edad               sexo      
     SAN JUAN DE LURIGANCHO: 5554   PCR: 8804   Min.   :  0.00   Femenino : 5599  
     LIMA                  : 3094   PR :21385   1st Qu.: 49.00   Masculino:24590  
     SAN MARTIN DE PORRES  : 2319               Median : 57.00                    
     CALLAO                : 2181               Mean   : 57.32                    
     COMAS                 : 2050               3rd Qu.: 66.00                    
     EL AGUSTINO           : 1233               Max.   :100.00                    
     (Other)               :13758                                                 
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:30189       Min.   :2020-03-19  
     1st Qu.:2020-04-22   Class :character   1st Qu.:2020-05-27  
     Median :2020-05-05   Mode  :character   Median :2020-05-30  
     Mean   :2020-05-04                      Mean   :2020-05-24  
     3rd Qu.:2020-05-19                      3rd Qu.:2020-06-02  
     Max.   :2020-06-04                      Max.   :2020-06-05  
                                                                 
       fecha_nac            edad_calc      coincidencias  
     Min.   :1919-12-01   Min.   :  0.57   Min.   :1.000  
     1st Qu.:1954-05-08   1st Qu.: 49.99   1st Qu.:1.000  
     Median :1962-08-18   Median : 57.75   Median :1.000  
     Mean   :1962-07-08   Mean   : 57.88   Mean   :1.825  
     3rd Qu.:1970-06-05   3rd Qu.: 66.05   3rd Qu.:2.000  
     Max.   :2019-11-10   Max.   :100.51   Max.   :7.000  
                                                          

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 15517 casos reconstruídos.

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
