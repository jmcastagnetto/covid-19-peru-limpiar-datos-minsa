**Última actualización**: 2020-06-06 19:40:05 UTC

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
     Length:187400      LIMA       :110161   LIMA            :92483  
     Class :character   CALLAO     : 13410   EN INVESTIGACIÓN:15929  
     Mode  :character   PIURA      : 10198   CALLAO          :13277  
                        LAMBAYEQUE :  9634   CHICLAYO        : 6427  
                        LORETO     :  6172   PIURA           : 4912  
                        LA LIBERTAD:  5483   CORONEL PORTILLO: 4754  
                        (Other)    : 32342   (Other)         :49618  
                       distrito      metododx          edad       
     EN INVESTIGACIÓN      : 15929   PCR: 42406   Min.   :  0.00  
     LIMA                  :  9230   PR :144994   1st Qu.: 30.00  
     SAN JUAN DE LURIGANCHO:  8793                Median : 42.00  
     CALLAO                :  7691                Mean   : 42.88  
     SAN MARTIN DE PORRES  :  6480                3rd Qu.: 54.00  
     ATE                   :  5740                Max.   :120.00  
     (Other)               :133537                NA's   :1676    
            sexo        fecha_resultado     
     Femenino : 74481   Min.   :2020-03-06  
     Masculino:109960   1st Qu.:2020-04-30  
     NA's     :  2959   Median :2020-05-15  
                        Mean   :2020-05-11  
                        3rd Qu.:2020-05-25  
                        Max.   :2020-06-04  
                        NA's   :1498        

    summary(fallecimientos)

         uuid           fecha_fallecimiento       edad                   sexo     
     Length:5162        Min.   :2020-03-19   Min.   :  0.00   Femenino     :1189  
     Class :character   1st Qu.:2020-04-25   1st Qu.: 56.00   Indeterminado: 932  
     Mode  :character   Median :2020-05-06   Median : 66.00   Masculino    :3041  
                        Mean   :2020-05-07   Mean   : 65.18                       
                        3rd Qu.:2020-05-23   3rd Qu.: 75.00                       
                        Max.   :2020-06-04   Max.   :100.00                       
                                                                                  
       fecha_nac              departamento     provincia   
     Min.   :1915-06-19   LIMA      :2095   LIMA    :1608  
     1st Qu.:1944-11-05   LAMBAYEQUE: 629   PIURA   : 307  
     Median :1953-12-25   PIURA     : 556   CHICLAYO: 227  
     Mean   :1954-10-18   CALLAO    : 369   CALLAO  : 214  
     3rd Qu.:1963-07-30   ANCASH    : 300   TRUJILLO: 140  
     Max.   :2020-02-08   LORETO    : 300   (Other) :1328  
     NA's   :747          (Other)   : 913   NA's    :1338  
                       distrito      edad_calc     
     CALLAO                : 202   Min.   :  0.17  
     SAN JUAN DE LURIGANCHO: 180   1st Qu.: 56.75  
     LIMA                  : 165   Median : 66.34  
     SAN MARTIN DE PORRES  : 157   Mean   : 65.55  
     CHIMBOTE              : 155   3rd Qu.: 75.46  
     (Other)               :3498   Max.   :104.86  
     NA's                  : 805   NA's   :747     

    summary(reconstruido)

      uuid_caso              departamento     provincia   
     Length:11569       LIMA       :7844   LIMA    :7750  
     Class :character   PIURA      :1152   CALLAO  : 900  
     Mode  :character   CALLAO     : 900   PIURA   : 766  
                        LAMBAYEQUE : 698   CHICLAYO: 611  
                        LA LIBERTAD: 262   SULLANA : 258  
                        ICA        : 253   TRUJILLO: 250  
                        (Other)    : 460   (Other) :1034  
                       distrito    metododx        edad                  sexo     
     SAN JUAN DE LURIGANCHO:1965   PCR:3643   Min.   : 2.00   Femenino     :1848  
     LIMA                  :1158   PR :7926   1st Qu.:49.00   Masculino    :9721  
     SAN MARTIN DE PORRES  :1075              Median :57.00   Indeterminado:   0  
     CALLAO                : 756              Mean   :57.45                       
     COMAS                 : 718              3rd Qu.:67.00                       
     CHICLAYO              : 531              Max.   :98.00                       
     (Other)               :5366                                                  
     fecha_resultado      uuid_fallecimiento fecha_fallecimiento 
     Min.   :2020-03-07   Length:11569       Min.   :2020-03-19  
     1st Qu.:2020-04-15   Class :character   1st Qu.:2020-04-28  
     Median :2020-04-25   Mode  :character   Median :2020-05-09  
     Mean   :2020-04-26                      Mean   :2020-05-10  
     3rd Qu.:2020-05-06                      3rd Qu.:2020-05-27  
     Max.   :2020-05-27                      Max.   :2020-05-28  
                                                                 
       fecha_nac            edad_calc     coincidencias  
     Min.   :1921-09-03   Min.   : 0.66   Min.   :1.000  
     1st Qu.:1953-04-19   1st Qu.:49.79   1st Qu.:1.000  
     Median :1962-03-01   Median :58.11   Median :1.000  
     Mean   :1962-04-09   Mean   :58.09   Mean   :1.517  
     3rd Qu.:1970-07-28   3rd Qu.:67.10   3rd Qu.:2.000  
     Max.   :2019-09-02   Max.   :98.65   Max.   :6.000  
                                                         

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 7316 casos reconstruídos.

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
