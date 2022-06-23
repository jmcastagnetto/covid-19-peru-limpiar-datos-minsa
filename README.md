[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)
[![License](https://img.shields.io/github/license/jmcastagnetto/covid-19-peru-limpiar-datos-minsa)](LICENSE)

-   **Repositorio creado el 2020-05-22 05:05:43 UTC**
-   **Última actualización**: 2022-06-23 00:17:43 UTC

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
<td style="text-align: left;">3599500</td>
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
<td style="text-align: right;">65194</td>
<td style="text-align: right;">0.98</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">8</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">3295739</td>
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
<td style="text-align: left;">2022-06-18</td>
<td style="text-align: left;">2022-06-18</td>
<td style="text-align: left;">2022-06-18</td>
<td style="text-align: right;">1</td>
</tr>
<tr class="even">
<td style="text-align: left;">fecha_resultado</td>
<td style="text-align: right;">2023</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">2020-03-06</td>
<td style="text-align: left;">2022-06-18</td>
<td style="text-align: left;">2021-04-26</td>
<td style="text-align: right;">833</td>
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
<td style="text-align: right;">339</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">26</td>
<td style="text-align: left;">LIM: 1638135, ARE: 217473, PIU: 158947, CAL: 147743</td>
</tr>
<tr class="even">
<td style="text-align: left;">provincia</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">197</td>
<td style="text-align: left;">LIM: 1422532, ARE: 182574, EN : 170122, CAL: 140087</td>
</tr>
<tr class="odd">
<td style="text-align: left;">distrito</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1702</td>
<td style="text-align: left;">EN : 170122, LIM: 145908, SAN: 113237, JES: 91299</td>
</tr>
<tr class="even">
<td style="text-align: left;">metododx</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">3</td>
<td style="text-align: left;">AG: 1539789, PCR: 1103831, PR: 955880</td>
</tr>
<tr class="odd">
<td style="text-align: left;">sexo</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">3</td>
<td style="text-align: left;">Fem: 1817634, Mas: 1781865, No : 1</td>
</tr>
<tr class="even">
<td style="text-align: left;">ubigeo</td>
<td style="text-align: right;">170122</td>
<td style="text-align: right;">0.95</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1852</td>
<td style="text-align: left;">150: 145908, 150: 113237, 150: 91299, 150: 84971</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rango_edad_veintiles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">6</td>
<td style="text-align: left;">20-: 1584991, 40-: 1153714, 60-: 462581, 0-1: 318710</td>
</tr>
<tr class="even">
<td style="text-align: left;">rango_edad_deciles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">10</td>
<td style="text-align: left;">30-: 843404, 20-: 741587, 40-: 666020, 50-: 487694</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rango_edad_quintiles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">18</td>
<td style="text-align: left;">30-: 444199, 25-: 439950, 35-: 399205, 40-: 355779</td>
</tr>
<tr class="even">
<td style="text-align: left;">rango_edad_owid</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">8</td>
<td style="text-align: left;">25-: 1949374, 50-: 487694, 18-: 376735, 60-: 307038</td>
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
<td style="text-align: right;">16.87</td>
<td style="text-align: right;">14.50</td>
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
<td style="text-align: left;">213389</td>
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
<td style="text-align: right;">2604</td>
<td style="text-align: right;">0.99</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">8</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">210714</td>
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
<td style="text-align: left;">2022-06-18</td>
<td style="text-align: left;">2022-06-18</td>
<td style="text-align: left;">2022-06-18</td>
<td style="text-align: right;">1</td>
</tr>
<tr class="even">
<td style="text-align: left;">fecha_fallecimiento</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">2020-03-03</td>
<td style="text-align: left;">2022-06-18</td>
<td style="text-align: left;">2021-02-02</td>
<td style="text-align: right;">831</td>
</tr>
</tbody>
</table>

**Variable type: factor**

<table>
<colgroup>
<col style="width: 19%" />
<col style="width: 9%" />
<col style="width: 12%" />
<col style="width: 7%" />
<col style="width: 8%" />
<col style="width: 43%" />
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
<td style="text-align: left;">Mas: 135247, Fem: 78142</td>
</tr>
<tr class="even">
<td style="text-align: left;">clasificacion_def</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">7</td>
<td style="text-align: left;">Cri: 65832, Cri: 63745, Cri: 46573, Cri: 16374</td>
</tr>
<tr class="odd">
<td style="text-align: left;">departamento</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">25</td>
<td style="text-align: left;">LIM: 93405, PIU: 13111, LA : 10877, CAL: 10525</td>
</tr>
<tr class="even">
<td style="text-align: left;">provincia</td>
<td style="text-align: right;">5</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">196</td>
<td style="text-align: left;">LIM: 85649, CAL: 10524, ARE: 8421, TRU: 7272</td>
</tr>
<tr class="odd">
<td style="text-align: left;">distrito</td>
<td style="text-align: right;">5</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1662</td>
<td style="text-align: left;">LIM: 8558, SAN: 8544, SAN: 6664, CAL: 6062</td>
</tr>
<tr class="even">
<td style="text-align: left;">ubigeo</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1801</td>
<td style="text-align: left;">150: 8558, 150: 8544, 150: 6664, 070: 6062</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rango_edad_veintiles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">5</td>
<td style="text-align: left;">60-: 104088, 40-: 53136, 80+: 44788, 20-: 9772</td>
</tr>
<tr class="even">
<td style="text-align: left;">rango_edad_deciles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">9</td>
<td style="text-align: left;">60-: 53190, 70-: 50898, 80+: 44788, 50-: 35358</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rango_edad_quintiles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">17</td>
<td style="text-align: left;">80+: 44788, 65-: 27717, 70-: 26845, 60-: 25473</td>
</tr>
<tr class="even">
<td style="text-align: left;">rango_edad_owid</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">7</td>
<td style="text-align: left;">60-: 53190, 70-: 50898, 80+: 44788, 50-: 35358</td>
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
<td style="text-align: right;">15.64</td>
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
<td style="text-align: right;">11.84</td>
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
<td style="text-align: right;">0.58</td>
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
<td style="text-align: left;">111376</td>
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
<td style="text-align: left;">2022-06-18</td>
<td style="text-align: left;">2022-06-18</td>
<td style="text-align: left;">2022-06-18</td>
<td style="text-align: right;">1</td>
</tr>
<tr class="even">
<td style="text-align: left;">positivo_fecha_resultado</td>
<td style="text-align: right;">167</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">2020-03-12</td>
<td style="text-align: left;">2022-06-17</td>
<td style="text-align: left;">2021-02-01</td>
<td style="text-align: right;">807</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fallecido_fecha_corte</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">2022-06-18</td>
<td style="text-align: left;">2022-06-18</td>
<td style="text-align: left;">2022-06-18</td>
<td style="text-align: right;">1</td>
</tr>
<tr class="even">
<td style="text-align: left;">fallecido_fecha_fallecimiento</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">2020-03-14</td>
<td style="text-align: left;">2022-06-18</td>
<td style="text-align: left;">2021-02-10</td>
<td style="text-align: right;">822</td>
</tr>
</tbody>
</table>

**Variable type: factor**

<table>
<colgroup>
<col style="width: 26%" />
<col style="width: 8%" />
<col style="width: 11%" />
<col style="width: 6%" />
<col style="width: 7%" />
<col style="width: 39%" />
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
<td style="text-align: right;">8</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">25</td>
<td style="text-align: left;">LIM: 52458, CAL: 6258, ARE: 5841, LA : 5381</td>
</tr>
<tr class="even">
<td style="text-align: left;">positivo_provincia</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">197</td>
<td style="text-align: left;">LIM: 44304, EN : 6167, CAL: 6020, ARE: 4753</td>
</tr>
<tr class="odd">
<td style="text-align: left;">positivo_distrito</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1428</td>
<td style="text-align: left;">EN : 6167, SAN: 4100, LIM: 3606, CAL: 2959</td>
</tr>
<tr class="even">
<td style="text-align: left;">positivo_metododx</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">3</td>
<td style="text-align: left;">PCR: 41102, PR: 36885, AG: 33389</td>
</tr>
<tr class="odd">
<td style="text-align: left;">positivo_sexo</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">2</td>
<td style="text-align: left;">Mas: 71744, Fem: 39632, No : 0</td>
</tr>
<tr class="even">
<td style="text-align: left;">positivo_ubigeo</td>
<td style="text-align: right;">6167</td>
<td style="text-align: right;">0.94</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1535</td>
<td style="text-align: left;">150: 4100, 150: 3606, 070: 2959, 150: 2806</td>
</tr>
<tr class="odd">
<td style="text-align: left;">positivo_rango_edad_veintiles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">6</td>
<td style="text-align: left;">60-: 54537, 40-: 28897, 80+: 21735, 20-: 5410</td>
</tr>
<tr class="even">
<td style="text-align: left;">positivo_rango_edad_deciles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">10</td>
<td style="text-align: left;">60-: 28525, 70-: 26012, 80+: 21735, 50-: 19164</td>
</tr>
<tr class="odd">
<td style="text-align: left;">positivo_rango_edad_quintiles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">18</td>
<td style="text-align: left;">80+: 21735, 65-: 14667, 60-: 13858, 70-: 13831</td>
</tr>
<tr class="even">
<td style="text-align: left;">positivo_rango_edad_owid</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">8</td>
<td style="text-align: left;">60-: 28525, 70-: 26012, 80+: 21735, 50-: 19164</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fallecido_sexo</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">2</td>
<td style="text-align: left;">Mas: 70200, Fem: 41176</td>
</tr>
<tr class="even">
<td style="text-align: left;">fallecido_clasificacion_def</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">7</td>
<td style="text-align: left;">Cri: 49817, Cri: 32964, Cri: 12196, Cri: 8528</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fallecido_departamento</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">25</td>
<td style="text-align: left;">LIM: 50478, ARE: 5746, CAL: 5726, LA : 5557</td>
</tr>
<tr class="even">
<td style="text-align: left;">fallecido_provincia</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">196</td>
<td style="text-align: left;">LIM: 45785, CAL: 5725, ARE: 4533, TRU: 3751</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fallecido_distrito</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1569</td>
<td style="text-align: left;">SAN: 4475, LIM: 4167, CAL: 3485, SAN: 3080</td>
</tr>
<tr class="even">
<td style="text-align: left;">fallecido_ubigeo</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1693</td>
<td style="text-align: left;">150: 4475, 150: 4167, 070: 3485, 150: 3080</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fallecido_rango_edad_veintiles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">5</td>
<td style="text-align: left;">60-: 54876, 40-: 28829, 80+: 21935, 20-: 5001</td>
</tr>
<tr class="even">
<td style="text-align: left;">fallecido_rango_edad_deciles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">9</td>
<td style="text-align: left;">60-: 28694, 70-: 26182, 80+: 21935, 50-: 19201</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fallecido_rango_edad_quintiles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">17</td>
<td style="text-align: left;">80+: 21935, 65-: 14773, 60-: 13921, 70-: 13902</td>
</tr>
<tr class="even">
<td style="text-align: left;">fallecido_rango_edad_owid</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">7</td>
<td style="text-align: left;">60-: 28694, 70-: 26182, 80+: 21935, 50-: 19201</td>
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
<td style="text-align: right;">25501727.65</td>
<td style="text-align: right;">14150020.32</td>
<td style="text-align: right;">12</td>
<td style="text-align: right;">11198224</td>
<td style="text-align: right;">36214490</td>
<td style="text-align: right;">36622262</td>
<td style="text-align: right;">39395164</td>
<td style="text-align: left;">▃▂▁▁▇</td>
</tr>
<tr class="even">
<td style="text-align: left;">positivo_edad</td>
<td style="text-align: right;">6</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">65.73</td>
<td style="text-align: right;">15.54</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">56</td>
<td style="text-align: right;">67</td>
<td style="text-align: right;">77</td>
<td style="text-align: right;">121</td>
<td style="text-align: left;">▁▂▇▆▁</td>
</tr>
<tr class="odd">
<td style="text-align: left;">positivo_epi_week</td>
<td style="text-align: right;">167</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">19.87</td>
<td style="text-align: right;">12.30</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">10</td>
<td style="text-align: right;">19</td>
<td style="text-align: right;">28</td>
<td style="text-align: right;">53</td>
<td style="text-align: left;">▇▇▇▃▂</td>
</tr>
<tr class="even">
<td style="text-align: left;">positivo_epi_year</td>
<td style="text-align: right;">167</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">2020.64</td>
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
<td style="text-align: right;">15.35</td>
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
<td style="text-align: right;">12.08</td>
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
<td style="text-align: right;">2020.66</td>
<td style="text-align: right;">0.61</td>
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
