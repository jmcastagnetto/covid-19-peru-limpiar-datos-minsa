[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)
[![License](https://img.shields.io/github/license/jmcastagnetto/covid-19-peru-limpiar-datos-minsa)](LICENSE)

-   **Repositorio creado el 2020-05-22 05:05:43 UTC**
-   **Última actualización**: 2022-05-21 00:20:17 UTC

## Notas

<details>
<summary>
Detalles específicos sobre los datos
</summary>

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

**2020-07-28**

-   Luego de varios días sin actualización (al menos 3 días), los datos
    abiertos han sido actualizados.
-   Las fechas en los registros ha cambiado del formato DD/MM/YYY (y
    algunos MM/DD/YYYY) a YYYYMMDD

**2020-09-14**

-   Modificado el código de proceso de datos pues hay un campo mas:
    `FECHA_CORTE`

**2020-10-25**

-   Tanto los datos de casos positivos, como los de fallecimentos,
    tienen ahora un formato distinto, en lugar de usar coma (“,”) para
    separar campos, hoy aparecen con punto y coma (“;”)

**2020-11-08**

-   Al menos desde el 2020-11-04, no han habido actualizaciones de los
    datos abiertos.
-   El hash sha1 de los archivos no ha cambiado hasta ahora:

**2020-11-16**

-   Los datos abiertos no se han actualizado desde el 2020-11-13 (última
    revisión: 2020-11-16, 23:15h PET)

**2021-08-25**

-   Debido a la “Datatón 2021” del MINSA, los datos ahora incluyen
    `person_id` que se puede usar para poder enlazar información entre
    datasets. He reorganizados los datos en función a esto, y
    aprovechado para aumentar la información original.

<!-- -->

    26ea469be125d1d0c4e8f9dcedf6692ece12acbb  datos/originales/fallecidos_covid.csv
    ada0b5da4371b9308e4170ecb53014843e4cb3a2  datos/originales/positivos_covid.csv

**2021-06-02**

-   A partir de hoy los datos de fallecidos por COVID-19 usan los
    criterios publicados en [Criterios técnicos para actualizar la cifra
    de fallecidos por COVID-19 en el
    Perú](https://www.gob.pe/institucion/pcm/informes-publicaciones/1943691-criterios-tecnicos-para-actualizar-la-cifra-de-fallecidos-por-covid-19-en-el-peru),
    y se ha cambiado la estructura de los datos. Ahora los datos de
    fallecidos indican en un campo el criterio empleado para la
    clasificación.
-   Debido al tamaño de los nuevos archivos de datos, estoy cambiando de
    formato de compresión, usando ahora [xz](https://tukaani.org/xz/) en
    lugar de [gzip](https://en.wikipedia.org/wiki/Gzip)

</details>

## Información relevante

Fuentes de datos:

-   <https://www.datosabiertos.gob.pe/dataset/casos-positivos-por-covid-19-ministerio-de-salud-minsa>
-   <https://www.datosabiertos.gob.pe/dataset/fallecidos-por-covid-19-ministerio-de-salud-minsa>

Luego del primer paso de limpieza de datos:

### Casos positivos

<details>
<summary>
Análisis exploratorio de los datos de positivos
</summary>

<table>
<caption>Data summary</caption>
<tbody>
<tr class="odd">
<td style="text-align: left;">Name</td>
<td style="text-align: left;">positivos</td>
</tr>
<tr class="even">
<td style="text-align: left;">Number of rows</td>
<td style="text-align: left;">3574876</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Number of columns</td>
<td style="text-align: left;">16</td>
</tr>
<tr class="even">
<td style="text-align: left;">_______________________</td>
<td style="text-align: left;"></td>
</tr>
<tr class="odd">
<td style="text-align: left;">Column type frequency:</td>
<td style="text-align: left;"></td>
</tr>
<tr class="even">
<td style="text-align: left;">character</td>
<td style="text-align: left;">1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Date</td>
<td style="text-align: left;">2</td>
</tr>
<tr class="even">
<td style="text-align: left;">factor</td>
<td style="text-align: left;">10</td>
</tr>
<tr class="odd">
<td style="text-align: left;">numeric</td>
<td style="text-align: left;">3</td>
</tr>
<tr class="even">
<td style="text-align: left;">________________________</td>
<td style="text-align: left;"></td>
</tr>
<tr class="odd">
<td style="text-align: left;">Group variables</td>
<td style="text-align: left;">None</td>
</tr>
</tbody>
</table>

Data summary

**Variable type: character**

<table>
<thead>
<tr class="header">
<th style="text-align: left;">skim_variable</th>
<th style="text-align: right;">n_missing</th>
<th style="text-align: right;">complete_rate</th>
<th style="text-align: right;">min</th>
<th style="text-align: right;">max</th>
<th style="text-align: right;">empty</th>
<th style="text-align: right;">n_unique</th>
<th style="text-align: right;">whitespace</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">id_persona</td>
<td style="text-align: right;">64267</td>
<td style="text-align: right;">0.98</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">8</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">3277050</td>
<td style="text-align: right;">0</td>
</tr>
</tbody>
</table>

**Variable type: Date**

<table>
<thead>
<tr class="header">
<th style="text-align: left;">skim_variable</th>
<th style="text-align: right;">n_missing</th>
<th style="text-align: right;">complete_rate</th>
<th style="text-align: left;">min</th>
<th style="text-align: left;">max</th>
<th style="text-align: left;">median</th>
<th style="text-align: right;">n_unique</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">fecha_corte</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">2022-05-19</td>
<td style="text-align: left;">2022-05-19</td>
<td style="text-align: left;">2022-05-19</td>
<td style="text-align: right;">1</td>
</tr>
<tr class="even">
<td style="text-align: left;">fecha_resultado</td>
<td style="text-align: right;">2023</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">2020-03-06</td>
<td style="text-align: left;">2022-05-19</td>
<td style="text-align: left;">2021-04-24</td>
<td style="text-align: right;">803</td>
</tr>
</tbody>
</table>

**Variable type: factor**

<table>
<colgroup>
<col style="width: 18%" />
<col style="width: 8%" />
<col style="width: 12%" />
<col style="width: 6%" />
<col style="width: 7%" />
<col style="width: 46%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;">skim_variable</th>
<th style="text-align: right;">n_missing</th>
<th style="text-align: right;">complete_rate</th>
<th style="text-align: left;">ordered</th>
<th style="text-align: right;">n_unique</th>
<th style="text-align: left;">top_counts</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">departamento</td>
<td style="text-align: right;">321</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">26</td>
<td style="text-align: left;">LIM: 1620953, ARE: 215508, PIU: 158690, CAL: 147111</td>
</tr>
<tr class="even">
<td style="text-align: left;">provincia</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">197</td>
<td style="text-align: left;">LIM: 1406189, ARE: 180674, EN : 169249, CAL: 139525</td>
</tr>
<tr class="odd">
<td style="text-align: left;">distrito</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1702</td>
<td style="text-align: left;">EN : 169249, LIM: 144153, SAN: 112915, JES: 90450</td>
</tr>
<tr class="even">
<td style="text-align: left;">metododx</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">3</td>
<td style="text-align: left;">AG: 1526413, PCR: 1092583, PR: 955880</td>
</tr>
<tr class="odd">
<td style="text-align: left;">sexo</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">3</td>
<td style="text-align: left;">Fem: 1803485, Mas: 1771390, No : 1</td>
</tr>
<tr class="even">
<td style="text-align: left;">ubigeo</td>
<td style="text-align: right;">169249</td>
<td style="text-align: right;">0.95</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1852</td>
<td style="text-align: left;">150: 144153, 150: 112915, 150: 90450, 150: 84674</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rango_edad_veintiles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">6</td>
<td style="text-align: left;">20-: 1575759, 40-: 1145428, 60-: 459083, 0-1: 315684</td>
</tr>
<tr class="even">
<td style="text-align: left;">rango_edad_deciles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">10</td>
<td style="text-align: left;">30-: 838179, 20-: 737580, 40-: 661452, 50-: 483976</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rango_edad_quintiles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">18</td>
<td style="text-align: left;">30-: 441413, 25-: 437576, 35-: 396766, 40-: 353399</td>
</tr>
<tr class="even">
<td style="text-align: left;">rango_edad_owid</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">8</td>
<td style="text-align: left;">25-: 1937207, 50-: 483976, 18-: 374622, 60-: 304685</td>
</tr>
</tbody>
</table>

**Variable type: numeric**

<table>
<thead>
<tr class="header">
<th style="text-align: left;">skim_variable</th>
<th style="text-align: right;">n_missing</th>
<th style="text-align: right;">complete_rate</th>
<th style="text-align: right;">mean</th>
<th style="text-align: right;">sd</th>
<th style="text-align: right;">p0</th>
<th style="text-align: right;">p25</th>
<th style="text-align: right;">p50</th>
<th style="text-align: right;">p75</th>
<th style="text-align: right;">p100</th>
<th style="text-align: left;">hist</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">edad</td>
<td style="text-align: right;">347</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">40.38</td>
<td style="text-align: right;">17.58</td>
<td style="text-align: right;">-79</td>
<td style="text-align: right;">28</td>
<td style="text-align: right;">38</td>
<td style="text-align: right;">52</td>
<td style="text-align: right;">2021</td>
<td style="text-align: left;">▇▁▁▁▁</td>
</tr>
<tr class="even">
<td style="text-align: left;">epi_week</td>
<td style="text-align: right;">2023</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">16.83</td>
<td style="text-align: right;">14.54</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">13</td>
<td style="text-align: right;">28</td>
<td style="text-align: right;">53</td>
<td style="text-align: left;">▇▃▂▂▁</td>
</tr>
<tr class="odd">
<td style="text-align: left;">epi_year</td>
<td style="text-align: right;">2023</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">2021.07</td>
<td style="text-align: right;">0.80</td>
<td style="text-align: right;">2020</td>
<td style="text-align: right;">2020</td>
<td style="text-align: right;">2021</td>
<td style="text-align: right;">2022</td>
<td style="text-align: right;">2022</td>
<td style="text-align: left;">▆▁▇▁▇</td>
</tr>
</tbody>
</table>

</details>

### Fallecimientos

<details>
<summary>
Análisis exploratorio de los datos de fallecidos
</summary>

<table>
<caption>Data summary</caption>
<tbody>
<tr class="odd">
<td style="text-align: left;">Name</td>
<td style="text-align: left;">fallecidos</td>
</tr>
<tr class="even">
<td style="text-align: left;">Number of rows</td>
<td style="text-align: left;">426172</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Number of columns</td>
<td style="text-align: left;">16</td>
</tr>
<tr class="even">
<td style="text-align: left;">_______________________</td>
<td style="text-align: left;"></td>
</tr>
<tr class="odd">
<td style="text-align: left;">Column type frequency:</td>
<td style="text-align: left;"></td>
</tr>
<tr class="even">
<td style="text-align: left;">character</td>
<td style="text-align: left;">1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Date</td>
<td style="text-align: left;">2</td>
</tr>
<tr class="even">
<td style="text-align: left;">factor</td>
<td style="text-align: left;">10</td>
</tr>
<tr class="odd">
<td style="text-align: left;">numeric</td>
<td style="text-align: left;">3</td>
</tr>
<tr class="even">
<td style="text-align: left;">________________________</td>
<td style="text-align: left;"></td>
</tr>
<tr class="odd">
<td style="text-align: left;">Group variables</td>
<td style="text-align: left;">None</td>
</tr>
</tbody>
</table>

Data summary

**Variable type: character**

<table>
<thead>
<tr class="header">
<th style="text-align: left;">skim_variable</th>
<th style="text-align: right;">n_missing</th>
<th style="text-align: right;">complete_rate</th>
<th style="text-align: right;">min</th>
<th style="text-align: right;">max</th>
<th style="text-align: right;">empty</th>
<th style="text-align: right;">n_unique</th>
<th style="text-align: right;">whitespace</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">id_persona</td>
<td style="text-align: right;">5286</td>
<td style="text-align: right;">0.99</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">8</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">210372</td>
<td style="text-align: right;">0</td>
</tr>
</tbody>
</table>

**Variable type: Date**

<table>
<thead>
<tr class="header">
<th style="text-align: left;">skim_variable</th>
<th style="text-align: right;">n_missing</th>
<th style="text-align: right;">complete_rate</th>
<th style="text-align: left;">min</th>
<th style="text-align: left;">max</th>
<th style="text-align: left;">median</th>
<th style="text-align: right;">n_unique</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">fecha_corte</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">2022-05-19</td>
<td style="text-align: left;">2022-05-19</td>
<td style="text-align: left;">2022-05-19</td>
<td style="text-align: right;">1</td>
</tr>
<tr class="even">
<td style="text-align: left;">fecha_fallecimiento</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">2020-03-03</td>
<td style="text-align: left;">2022-05-19</td>
<td style="text-align: left;">2021-02-01</td>
<td style="text-align: right;">801</td>
</tr>
</tbody>
</table>

**Variable type: factor**

<table>
<colgroup>
<col style="width: 18%" />
<col style="width: 9%" />
<col style="width: 12%" />
<col style="width: 7%" />
<col style="width: 8%" />
<col style="width: 44%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;">skim_variable</th>
<th style="text-align: right;">n_missing</th>
<th style="text-align: right;">complete_rate</th>
<th style="text-align: left;">ordered</th>
<th style="text-align: right;">n_unique</th>
<th style="text-align: left;">top_counts</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">sexo</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">2</td>
<td style="text-align: left;">Mas: 270158, Fem: 156014</td>
</tr>
<tr class="even">
<td style="text-align: left;">clasificacion_def</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">7</td>
<td style="text-align: left;">Cri: 131148, Cri: 127384, Cri: 93082, Cri: 32748</td>
</tr>
<tr class="odd">
<td style="text-align: left;">departamento</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">25</td>
<td style="text-align: left;">LIM: 186500, PIU: 26208, LA : 21730, CAL: 21020</td>
</tr>
<tr class="even">
<td style="text-align: left;">provincia</td>
<td style="text-align: right;">10</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">196</td>
<td style="text-align: left;">LIM: 171002, CAL: 21018, ARE: 16830, TRU: 14530</td>
</tr>
<tr class="odd">
<td style="text-align: left;">distrito</td>
<td style="text-align: right;">10</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1662</td>
<td style="text-align: left;">LIM: 17108, SAN: 17072, SAN: 13308, CAL: 12110</td>
</tr>
<tr class="even">
<td style="text-align: left;">ubigeo</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1801</td>
<td style="text-align: left;">150: 17108, 150: 17072, 150: 13308, 070: 12110</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rango_edad_veintiles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">5</td>
<td style="text-align: left;">60-: 207968, 40-: 106148, 80+: 89390, 20-: 19486</td>
</tr>
<tr class="even">
<td style="text-align: left;">rango_edad_deciles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">9</td>
<td style="text-align: left;">60-: 106276, 70-: 101692, 80+: 89390, 50-: 70652</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rango_edad_quintiles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">17</td>
<td style="text-align: left;">80+: 89390, 65-: 55382, 70-: 53644, 60-: 50894</td>
</tr>
<tr class="even">
<td style="text-align: left;">rango_edad_owid</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">7</td>
<td style="text-align: left;">60-: 106276, 70-: 101692, 80+: 89390, 50-: 70652</td>
</tr>
</tbody>
</table>

**Variable type: numeric**

<table>
<thead>
<tr class="header">
<th style="text-align: left;">skim_variable</th>
<th style="text-align: right;">n_missing</th>
<th style="text-align: right;">complete_rate</th>
<th style="text-align: right;">mean</th>
<th style="text-align: right;">sd</th>
<th style="text-align: right;">p0</th>
<th style="text-align: right;">p25</th>
<th style="text-align: right;">p50</th>
<th style="text-align: right;">p75</th>
<th style="text-align: right;">p100</th>
<th style="text-align: left;">hist</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">edad</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">66.32</td>
<td style="text-align: right;">15.62</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">57</td>
<td style="text-align: right;">67</td>
<td style="text-align: right;">78</td>
<td style="text-align: right;">117</td>
<td style="text-align: left;">▁▂▇▇▁</td>
</tr>
<tr class="even">
<td style="text-align: left;">epi_week</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">21.13</td>
<td style="text-align: right;">11.86</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">12</td>
<td style="text-align: right;">20</td>
<td style="text-align: right;">29</td>
<td style="text-align: right;">53</td>
<td style="text-align: left;">▆▇▇▃▂</td>
</tr>
<tr class="odd">
<td style="text-align: left;">epi_year</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">2020.60</td>
<td style="text-align: right;">0.57</td>
<td style="text-align: right;">2020</td>
<td style="text-align: right;">2020</td>
<td style="text-align: right;">2021</td>
<td style="text-align: right;">2021</td>
<td style="text-align: right;">2022</td>
<td style="text-align: left;">▇▁▇▁▁</td>
</tr>
</tbody>
</table>

</details>

### Reconstrucción de positivos a fallecidos

<details>
<summary>
Análisis exploratorio de la consolidación entre positivos y fallecidos
</summary>

<table>
<caption>Data summary</caption>
<tbody>
<tr class="odd">
<td style="text-align: left;">Name</td>
<td style="text-align: left;">reconstruido</td>
</tr>
<tr class="even">
<td style="text-align: left;">Number of rows</td>
<td style="text-align: left;">222044</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Number of columns</td>
<td style="text-align: left;">31</td>
</tr>
<tr class="even">
<td style="text-align: left;">_______________________</td>
<td style="text-align: left;"></td>
</tr>
<tr class="odd">
<td style="text-align: left;">Column type frequency:</td>
<td style="text-align: left;"></td>
</tr>
<tr class="even">
<td style="text-align: left;">Date</td>
<td style="text-align: left;">4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">factor</td>
<td style="text-align: left;">20</td>
</tr>
<tr class="even">
<td style="text-align: left;">numeric</td>
<td style="text-align: left;">7</td>
</tr>
<tr class="odd">
<td style="text-align: left;">________________________</td>
<td style="text-align: left;"></td>
</tr>
<tr class="even">
<td style="text-align: left;">Group variables</td>
<td style="text-align: left;">None</td>
</tr>
</tbody>
</table>

Data summary

**Variable type: Date**

<table>
<thead>
<tr class="header">
<th style="text-align: left;">skim_variable</th>
<th style="text-align: right;">n_missing</th>
<th style="text-align: right;">complete_rate</th>
<th style="text-align: left;">min</th>
<th style="text-align: left;">max</th>
<th style="text-align: left;">median</th>
<th style="text-align: right;">n_unique</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">positivo_fecha_corte</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">2022-05-19</td>
<td style="text-align: left;">2022-05-19</td>
<td style="text-align: left;">2022-05-19</td>
<td style="text-align: right;">1</td>
</tr>
<tr class="even">
<td style="text-align: left;">positivo_fecha_resultado</td>
<td style="text-align: right;">334</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">2020-03-12</td>
<td style="text-align: left;">2022-05-14</td>
<td style="text-align: left;">2021-02-01</td>
<td style="text-align: right;">783</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fallecido_fecha_corte</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">2022-05-19</td>
<td style="text-align: left;">2022-05-19</td>
<td style="text-align: left;">2022-05-19</td>
<td style="text-align: right;">1</td>
</tr>
<tr class="even">
<td style="text-align: left;">fallecido_fecha_fallecimiento</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">2020-03-14</td>
<td style="text-align: left;">2022-05-19</td>
<td style="text-align: left;">2021-02-10</td>
<td style="text-align: right;">792</td>
</tr>
</tbody>
</table>

**Variable type: factor**

<table>
<colgroup>
<col style="width: 25%" />
<col style="width: 8%" />
<col style="width: 11%" />
<col style="width: 6%" />
<col style="width: 7%" />
<col style="width: 40%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;">skim_variable</th>
<th style="text-align: right;">n_missing</th>
<th style="text-align: right;">complete_rate</th>
<th style="text-align: left;">ordered</th>
<th style="text-align: right;">n_unique</th>
<th style="text-align: left;">top_counts</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">positivo_departamento</td>
<td style="text-align: right;">16</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">25</td>
<td style="text-align: left;">LIM: 104522, CAL: 12494, ARE: 11648, LA : 10734</td>
</tr>
<tr class="even">
<td style="text-align: left;">positivo_provincia</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">197</td>
<td style="text-align: left;">LIM: 88240, EN : 12316, CAL: 12018, ARE: 9474</td>
</tr>
<tr class="odd">
<td style="text-align: left;">positivo_distrito</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1428</td>
<td style="text-align: left;">EN : 12316, SAN: 8184, LIM: 7178, CAL: 5916</td>
</tr>
<tr class="even">
<td style="text-align: left;">positivo_metododx</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">3</td>
<td style="text-align: left;">PCR: 81688, PR: 73742, AG: 66614</td>
</tr>
<tr class="odd">
<td style="text-align: left;">positivo_sexo</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">2</td>
<td style="text-align: left;">Mas: 143118, Fem: 78926, No : 0</td>
</tr>
<tr class="even">
<td style="text-align: left;">positivo_ubigeo</td>
<td style="text-align: right;">12316</td>
<td style="text-align: right;">0.94</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1535</td>
<td style="text-align: left;">150: 8184, 150: 7178, 070: 5916, 150: 5588</td>
</tr>
<tr class="odd">
<td style="text-align: left;">positivo_rango_edad_veintiles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">6</td>
<td style="text-align: left;">60-: 108804, 40-: 57660, 80+: 43270, 20-: 10744</td>
</tr>
<tr class="even">
<td style="text-align: left;">positivo_rango_edad_deciles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">10</td>
<td style="text-align: left;">60-: 56916, 70-: 51888, 80+: 43270, 50-: 38260</td>
</tr>
<tr class="odd">
<td style="text-align: left;">positivo_rango_edad_quintiles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">18</td>
<td style="text-align: left;">80+: 43270, 65-: 29252, 60-: 27664, 70-: 27604</td>
</tr>
<tr class="even">
<td style="text-align: left;">positivo_rango_edad_owid</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">8</td>
<td style="text-align: left;">60-: 56916, 70-: 51888, 80+: 43270, 50-: 38260</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fallecido_sexo</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">2</td>
<td style="text-align: left;">Mas: 140026, Fem: 82018</td>
</tr>
<tr class="even">
<td style="text-align: left;">fallecido_clasificacion_def</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">7</td>
<td style="text-align: left;">Cri: 99002, Cri: 65876, Cri: 24368, Cri: 17058</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fallecido_departamento</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">25</td>
<td style="text-align: left;">LIM: 100610, ARE: 11468, CAL: 11424, LA : 11082</td>
</tr>
<tr class="even">
<td style="text-align: left;">fallecido_provincia</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">196</td>
<td style="text-align: left;">LIM: 91246, CAL: 11422, ARE: 9046, TRU: 7478</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fallecido_distrito</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1569</td>
<td style="text-align: left;">SAN: 8934, LIM: 8324, CAL: 6962, SAN: 6140</td>
</tr>
<tr class="even">
<td style="text-align: left;">fallecido_ubigeo</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1693</td>
<td style="text-align: left;">150: 8934, 150: 8324, 070: 6962, 150: 6140</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fallecido_rango_edad_veintiles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">5</td>
<td style="text-align: left;">60-: 109480, 40-: 57526, 80+: 43668, 20-: 9926</td>
</tr>
<tr class="even">
<td style="text-align: left;">fallecido_rango_edad_deciles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">9</td>
<td style="text-align: left;">60-: 57258, 70-: 52222, 80+: 43668, 50-: 38338</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fallecido_rango_edad_quintiles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">17</td>
<td style="text-align: left;">80+: 43668, 65-: 29472, 60-: 27786, 70-: 27746</td>
</tr>
<tr class="even">
<td style="text-align: left;">fallecido_rango_edad_owid</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">7</td>
<td style="text-align: left;">60-: 57258, 70-: 52222, 80+: 43668, 50-: 38338</td>
</tr>
</tbody>
</table>

**Variable type: numeric**

<table>
<colgroup>
<col style="width: 16%" />
<col style="width: 8%" />
<col style="width: 12%" />
<col style="width: 10%" />
<col style="width: 10%" />
<col style="width: 4%" />
<col style="width: 7%" />
<col style="width: 7%" />
<col style="width: 7%" />
<col style="width: 7%" />
<col style="width: 5%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: left;">skim_variable</th>
<th style="text-align: right;">n_missing</th>
<th style="text-align: right;">complete_rate</th>
<th style="text-align: right;">mean</th>
<th style="text-align: right;">sd</th>
<th style="text-align: right;">p0</th>
<th style="text-align: right;">p25</th>
<th style="text-align: right;">p50</th>
<th style="text-align: right;">p75</th>
<th style="text-align: right;">p100</th>
<th style="text-align: left;">hist</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">id_persona</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">25546849.73</td>
<td style="text-align: right;">14139434.63</td>
<td style="text-align: right;">12</td>
<td style="text-align: right;">11267558</td>
<td style="text-align: right;">36214821</td>
<td style="text-align: right;">36623200</td>
<td style="text-align: right;">39395164</td>
<td style="text-align: left;">▃▂▁▁▇</td>
</tr>
<tr class="even">
<td style="text-align: left;">positivo_edad</td>
<td style="text-align: right;">12</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">65.73</td>
<td style="text-align: right;">15.52</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">56</td>
<td style="text-align: right;">67</td>
<td style="text-align: right;">77</td>
<td style="text-align: right;">121</td>
<td style="text-align: left;">▁▂▇▆▁</td>
</tr>
<tr class="odd">
<td style="text-align: left;">positivo_epi_week</td>
<td style="text-align: right;">334</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">19.89</td>
<td style="text-align: right;">12.29</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">10</td>
<td style="text-align: right;">19</td>
<td style="text-align: right;">28</td>
<td style="text-align: right;">53</td>
<td style="text-align: left;">▇▇▇▃▂</td>
</tr>
<tr class="even">
<td style="text-align: left;">positivo_epi_year</td>
<td style="text-align: right;">334</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">2020.63</td>
<td style="text-align: right;">0.61</td>
<td style="text-align: right;">2020</td>
<td style="text-align: right;">2020</td>
<td style="text-align: right;">2021</td>
<td style="text-align: right;">2021</td>
<td style="text-align: right;">2022</td>
<td style="text-align: left;">▇▁▇▁▁</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fallecido_edad</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">65.96</td>
<td style="text-align: right;">15.32</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">57</td>
<td style="text-align: right;">67</td>
<td style="text-align: right;">77</td>
<td style="text-align: right;">113</td>
<td style="text-align: left;">▁▂▇▇▁</td>
</tr>
<tr class="even">
<td style="text-align: left;">fallecido_epi_week</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">20.61</td>
<td style="text-align: right;">12.10</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">11</td>
<td style="text-align: right;">19</td>
<td style="text-align: right;">29</td>
<td style="text-align: right;">53</td>
<td style="text-align: left;">▇▇▇▃▂</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fallecido_epi_year</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">2020.65</td>
<td style="text-align: right;">0.60</td>
<td style="text-align: right;">2020</td>
<td style="text-align: right;">2020</td>
<td style="text-align: right;">2021</td>
<td style="text-align: right;">2021</td>
<td style="text-align: right;">2022</td>
<td style="text-align: left;">▆▁▇▁▁</td>
</tr>
</tbody>
</table>

</details>

## Gráficos

<details>
<summary>
Casos positivos por dia (MINSA)
</summary>

![“Positivos por día. MINSA”](plots/positivos-por-dia-minsa.png)

</details>
<details>
<summary>
Casos positivos acumulados (MINSA)
</summary>

![“Positivos acumulados. MINSA”](plots/positivos-acumulados-minsa.png)

</details>
<details>
<summary>
Casos positivos por dia y Departamento (MINSA)
</summary>

![“Positivos por día y por Departamento.
MINSA”](plots/positivos-diarios-por-departamento-minsa.png)

</details>
<details>
<summary>
Fallecimientos por día (MINSA)
</summary>

![“Fallecimientos por día. MINSA”](plots/fallecidos-por-dia-minsa.png)

</details>
<details>
<summary>
Fallecimientos por día y criterio (MINSA)
</summary>

![“Fallecimientos por día, por criterio
usado”](plots/fallecidos-diarios-por-criterio.png)

</details>
<details>
<summary>
Fallecimientos acumulados (MINSA)
</summary>

![“Fallecimientos acumulados.
MINSA”](plots/fallecidos-acumulados-minsa.png)

</details>
<details>
<summary>
Fallecimientos por día y Departamento (MINSA)
</summary>

![“Fallecimientos por día y por Departamento.
MINSA”](plots/fallecidos-diarios-por-departamento-minsa.png)

</details>
<details>
<summary>
Distribución de tiempos desde detección a fallecimiento, por número de
registros coincidentes
</summary>

![“Distribución de tiempos desde detección a fallecimiento, por número
de registros
coincidentes”](plots/deteccion-fallecimiento-por-coincidentes.png)

</details>

Los archivos procesados y aumentados son:

-   [datos/fallecidos\_covid\_aumentado.csv.xz](datos/fallecidos_covid_aumentado.csv.xz)
-   [datos/positivos\_covid\_aumentado.csv.xz](datos/datos/positivos_covid_aumentado.csv.xz)

Y algunos reconstruidos a partir de los anteriores:

-   [datos/positivos\_fallecidos\_reconstruccion.csv.xz](datos/positivos_fallecidos_reconstruccion.csv.xz)
-   [datos/timeseries\_positivos.csv](datos/timeseries_positivos.csv.xz)
-   [datos/timeseries\_positivos\_departamento.csv](datos/timeseries_positivos_departamento.csv)
-   [datos/timeseries\_fallecidos.csv](datos/timeseries_fallecidos.csv)
-   [datos/timeseries\_fallecidos\_departamento.csv](datos/timeseries_fallecidos_departamento.csv)
