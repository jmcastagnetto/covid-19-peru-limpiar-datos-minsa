[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-07-21 17:40:42 UTC

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

**2020-06-23**

-   Hay datos que tienen como fecha de el 2020-12-06, cuando podría
    parecer que es 2020-06-12, esto se ha corregido en los datos limpios
    en el repo, mas no el original.

Información relevante
---------------------

Fuentes de datos:

-   <a href="https://www.datosabiertos.gob.pe/dataset/casos-positivos-por-covid-19-ministerio-de-salud-minsa" class="uri">https://www.datosabiertos.gob.pe/dataset/casos-positivos-por-covid-19-ministerio-de-salud-minsa</a>
-   <a href="https://www.datosabiertos.gob.pe/dataset/fallecidos-por-covid-19-ministerio-de-salud-minsa" class="uri">https://www.datosabiertos.gob.pe/dataset/fallecidos-por-covid-19-ministerio-de-salud-minsa</a>

Luego del primer paso de limpieza de datos:

         uuid                departamento               provincia     
     Length:357681      LIMA       :177692   LIMA            :172133  
     Class :character   CALLAO     : 19868   CALLAO          : 18837  
     Mode  :character   PIURA      : 19634   EN INVESTIGACIÓN: 14282  
                        LAMBAYEQUE : 15823   CHICLAYO        : 10643  
                        LIMA REGION: 13857   TRUJILLO        :  9545  
                        LA LIBERTAD: 13203   PIURA           :  9413  
                        (Other)    : 97604   (Other)         :122828  
                       distrito      metododx          edad       
     SAN JUAN DE LURIGANCHO: 16915   PCR: 96250   Min.   :  0.00  
     LIMA                  : 15452   PR :261431   1st Qu.: 31.00  
     EN INVESTIGACIÓN      : 14282                Median : 42.00  
     SAN MARTIN DE PORRES  : 12423                Mean   : 43.36  
     CALLAO                : 10743                3rd Qu.: 55.00  
     COMAS                 : 10513                Max.   :120.00  
     (Other)               :277353                NA's   :1486    
            sexo        fecha_resultado     
     Femenino :153403   Min.   :2020-03-06  
     Masculino:201591   1st Qu.:2020-05-13  
     NA's     :  2687   Median :2020-06-01  
                        Mean   :2020-06-01  
                        3rd Qu.:2020-06-23  
                        Max.   :2020-07-19  
                        NA's   :1211        

         uuid           fecha_fallecimiento       edad               sexo     
     Length:13384       Min.   :2020-03-19   Min.   :  0.00   Femenino :3938  
     Class :character   1st Qu.:2020-05-14   1st Qu.: 57.00   Masculino:9446  
     Mode  :character   Median :2020-06-12   Median : 66.00                   
                        Mean   :2020-06-07   Mean   : 65.68                   
                        3rd Qu.:2020-07-01   3rd Qu.: 75.00                   
                        Max.   :2020-07-19   Max.   :107.00                   
                                                                              
       fecha_nac               departamento     provincia   
     Min.   :1912-12-15   LIMA       :6223   LIMA    :5251  
     1st Qu.:1944-06-09   LA LIBERTAD: 890   TRUJILLO: 653  
     Median :1953-07-06   PIURA      : 880   CALLAO  : 619  
     Mean   :1954-04-10   LAMBAYEQUE : 828   AREQUIPA: 528  
     3rd Qu.:1962-11-28   CALLAO     : 779   PIURA   : 469  
     Max.   :2020-02-12   ICA        : 687   (Other) :4526  
     NA's   :789          (Other)    :3097   NA's    :1338  
                       distrito       edad_calc     
     SAN JUAN DE LURIGANCHO:  622   Min.   :  0.17  
     SAN MARTIN DE PORRES  :  454   1st Qu.: 57.55  
     COMAS                 :  415   Median : 66.93  
     CALLAO                :  414   Mean   : 66.16  
     LIMA                  :  412   3rd Qu.: 76.00  
     (Other)               :10262   Max.   :107.53  
     NA's                  :  805   NA's   :789     

      uuid_caso              departamento       provincia     
     Length:199435      LIMA       :158492   LIMA    :158492  
     Class :character   CALLAO     : 16232   CALLAO  : 16232  
     Mode  :character   LA LIBERTAD:  5476   TRUJILLO:  5265  
                        ANCASH     :  3702   SANTA   :  3436  
                        PIURA      :  3645   CHICLAYO:  2726  
                        LAMBAYEQUE :  2971   PIURA   :  2358  
                        (Other)    :  8917   (Other) : 10926  
                       distrito     metododx          edad       
     SAN JUAN DE LURIGANCHO:40329   PCR: 58800   Min.   :  0.00  
     LIMA                  :19749   PR :140635   1st Qu.: 50.00  
     SAN MARTIN DE PORRES  :18934                Median : 58.00  
     COMAS                 :14832                Mean   : 57.72  
     CALLAO                :13503                3rd Qu.: 66.00  
     VILLA EL SALVADOR     :10037                Max.   :101.00  
     (Other)               :82051                                
            sexo        fecha_resultado      uuid_fallecimiento
     Femenino : 38577   Min.   :2020-03-07   Length:199435     
     Masculino:160858   1st Qu.:2020-05-02   Class :character  
                        Median :2020-05-20   Mode  :character  
                        Mean   :2020-05-18                     
                        3rd Qu.:2020-06-03                     
                        Max.   :2020-07-18                     
                                                               
     fecha_fallecimiento    fecha_nac            edad_calc      coincidencias   
     Min.   :2020-03-19   Min.   :1919-01-11   Min.   :  0.39   Min.   : 1.000  
     1st Qu.:2020-06-11   1st Qu.:1953-12-29   1st Qu.: 50.18   1st Qu.: 2.000  
     Median :2020-06-23   Median :1962-01-07   Median : 58.45   Median : 3.000  
     Mean   :2020-06-22   Mean   :1962-03-30   Mean   : 58.23   Mean   : 4.249  
     3rd Qu.:2020-07-08   3rd Qu.:1970-03-25   3rd Qu.: 66.46   3rd Qu.: 6.000  
     Max.   :2020-07-19   Max.   :2020-02-12   Max.   :101.48   Max.   :18.000  
                                                                                

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 42005 casos reconstruídos.

    [1] "es_PE.utf8"

![“Positivos por día. MINSA”](plots/positivos-por-dia-minsa.png)

![“Positivos acumulados. MINSA”](plots/positivos-acumulados-minsa.png)

![“Positivos por día y por Departamento.
MINSA”](plots/positivos-diarios-por-departamento-minsa.png)

![“Fallecimientos por día.
MINSA”](plots/fallecimientos-por-dia-minsa.png)

![“Fallecimientos acumulados.
MINSA”](plots/fallecimientos-acumulados-minsa.png)

![“Fallecimientos por día y por Departamento.
MINSA”](plots/fallecimientos-diarios-por-departamento-minsa.png)

![“Distribución de tiempos desde detección a fallecimiento, por número
de registros
coincidentes”](plots/deteccion-fallecimiento-por-coincidentes.png)

Los archivos “limpios” son:

-   [datos/fallecidos\_covid-utf8-limpio.csv](datos/fallecidos_covid-utf8-limpio.csv)
-   [datos/positivos\_covid-utf8-limpio.csv](datos/positivos_covid-utf8-limpio.csv)

Y algunos reconstruidos a partir de los anteriores:

-   [datos/casos\_fallecimientos\_reconstruccion\_posible.csv](datos/casos_fallecimientos_reconstruccion_posible.csv)
-   [datos/timeseries-casos.csv](datos/timeseries-casos.csv)
-   [datos/timeseries-casos-lugares.csv](datos/timeseries-casos-lugares.csv)
-   [datos/timeseries-fallecimientos.csv](datos/timeseries-fallecimientos.csv)
-   [datos/timeseries-fallecimientos-lugares.csv](datos/timeseries-fallecimientos-lugares.csv)
