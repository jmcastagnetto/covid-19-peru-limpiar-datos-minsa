[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)

**Última actualización**: 2020-12-15 16:29:00 UTC

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

<!-- -->

    26ea469be125d1d0c4e8f9dcedf6692ece12acbb  datos/originales/fallecidos_covid.csv
    ada0b5da4371b9308e4170ecb53014843e4cb3a2  datos/originales/positivos_covid.csv

Información relevante
---------------------

Fuentes de datos:

-   <a href="https://www.datosabiertos.gob.pe/dataset/casos-positivos-por-covid-19-ministerio-de-salud-minsa" class="uri">https://www.datosabiertos.gob.pe/dataset/casos-positivos-por-covid-19-ministerio-de-salud-minsa</a>
-   <a href="https://www.datosabiertos.gob.pe/dataset/fallecidos-por-covid-19-ministerio-de-salud-minsa" class="uri">https://www.datosabiertos.gob.pe/dataset/fallecidos-por-covid-19-ministerio-de-salud-minsa</a>

Luego del primer paso de limpieza de datos:

### Casos positivos

<table>
<caption>Data summary</caption>
<tbody>
<tr class="odd">
<td style="text-align: left;">Name</td>
<td style="text-align: left;">casos</td>
</tr>
<tr class="even">
<td style="text-align: left;">Number of rows</td>
<td style="text-align: left;">984973</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Number of columns</td>
<td style="text-align: left;">9</td>
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
<td style="text-align: left;">5</td>
</tr>
<tr class="odd">
<td style="text-align: left;">numeric</td>
<td style="text-align: left;">1</td>
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
<td style="text-align: left;">uuid</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">32</td>
<td style="text-align: right;">32</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">984973</td>
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
<td style="text-align: left;">2020-12-12</td>
<td style="text-align: left;">2020-12-12</td>
<td style="text-align: left;">2020-12-12</td>
<td style="text-align: right;">1</td>
</tr>
<tr class="even">
<td style="text-align: left;">fecha_resultado</td>
<td style="text-align: right;">865</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">2020-03-06</td>
<td style="text-align: left;">2020-12-12</td>
<td style="text-align: left;">2020-08-07</td>
<td style="text-align: right;">280</td>
</tr>
</tbody>
</table>

**Variable type: factor**

<table>
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
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">26</td>
<td style="text-align: left;">LIM: 405529, ARE: 47154, CAL: 41932, PIU: 41704</td>
</tr>
<tr class="even">
<td style="text-align: left;">provincia</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">197</td>
<td style="text-align: left;">LIM: 375530, EN : 53475, ARE: 40602, CAL: 39852</td>
</tr>
<tr class="odd">
<td style="text-align: left;">distrito</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1647</td>
<td style="text-align: left;">EN : 53475, SAN: 36778, LIM: 33311, SAN: 24810</td>
</tr>
<tr class="even">
<td style="text-align: left;">metododx</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">2</td>
<td style="text-align: left;">PR: 764324, PCR: 220649</td>
</tr>
<tr class="odd">
<td style="text-align: left;">sexo</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">2</td>
<td style="text-align: left;">Mas: 509323, Fem: 475650</td>
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
<td style="text-align: right;">41</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">42.01</td>
<td style="text-align: right;">18.07</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">29</td>
<td style="text-align: right;">41</td>
<td style="text-align: right;">54</td>
<td style="text-align: right;">120</td>
<td style="text-align: left;">▂▇▅▁▁</td>
</tr>
</tbody>
</table>

### Fallecimientos

<table>
<caption>Data summary</caption>
<tbody>
<tr class="odd">
<td style="text-align: left;">Name</td>
<td style="text-align: left;">fallecimientos</td>
</tr>
<tr class="even">
<td style="text-align: left;">Number of rows</td>
<td style="text-align: left;">36677</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Number of columns</td>
<td style="text-align: left;">10</td>
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
<td style="text-align: left;">3</td>
</tr>
<tr class="even">
<td style="text-align: left;">factor</td>
<td style="text-align: left;">4</td>
</tr>
<tr class="odd">
<td style="text-align: left;">numeric</td>
<td style="text-align: left;">2</td>
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
<td style="text-align: left;">uuid</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">32</td>
<td style="text-align: right;">32</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">36677</td>
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
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">2020-12-12</td>
<td style="text-align: left;">2020-12-12</td>
<td style="text-align: left;">2020-12-12</td>
<td style="text-align: right;">1</td>
</tr>
<tr class="even">
<td style="text-align: left;">fecha_fallecimiento</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">2020-03-18</td>
<td style="text-align: left;">2020-12-12</td>
<td style="text-align: left;">2020-07-02</td>
<td style="text-align: right;">269</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fecha_nac</td>
<td style="text-align: right;">4929</td>
<td style="text-align: right;">0.87</td>
<td style="text-align: left;">1912-03-19</td>
<td style="text-align: left;">2020-08-20</td>
<td style="text-align: left;">1953-04-21</td>
<td style="text-align: right;">15711</td>
</tr>
</tbody>
</table>

**Variable type: factor**

<table>
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
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">4</td>
<td style="text-align: left;">Mas: 25169, Fem: 11498, 11: 7, 10: 3</td>
</tr>
<tr class="even">
<td style="text-align: left;">departamento</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">25</td>
<td style="text-align: left;">LIM: 16405, LA : 2414, PIU: 2168, CAL: 1935</td>
</tr>
<tr class="odd">
<td style="text-align: left;">provincia</td>
<td style="text-align: right;">851</td>
<td style="text-align: right;">0.98</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">199</td>
<td style="text-align: left;">LIM: 14778, CAL: 1774, TRU: 1671, ARE: 1371</td>
</tr>
<tr class="even">
<td style="text-align: left;">distrito</td>
<td style="text-align: right;">321</td>
<td style="text-align: right;">0.99</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1180</td>
<td style="text-align: left;">SAN: 1644, LIM: 1198, CAL: 1119, SAN: 1046</td>
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
<td style="text-align: right;">1.00</td>
<td style="text-align: right;">65.96</td>
<td style="text-align: right;">14.69</td>
<td style="text-align: right;">0.00</td>
<td style="text-align: right;">57.00</td>
<td style="text-align: right;">67.00</td>
<td style="text-align: right;">76.00</td>
<td style="text-align: right;">108.00</td>
<td style="text-align: left;">▁▁▆▇▁</td>
</tr>
<tr class="even">
<td style="text-align: left;">edad_calc</td>
<td style="text-align: right;">4929</td>
<td style="text-align: right;">0.87</td>
<td style="text-align: right;">66.42</td>
<td style="text-align: right;">14.33</td>
<td style="text-align: right;">0.12</td>
<td style="text-align: right;">57.73</td>
<td style="text-align: right;">67.18</td>
<td style="text-align: right;">76.52</td>
<td style="text-align: right;">108.46</td>
<td style="text-align: left;">▁▁▆▇▁</td>
</tr>
</tbody>
</table>

### Coincidencias reconstruídas

<table>
<caption>Data summary</caption>
<tbody>
<tr class="odd">
<td style="text-align: left;">Name</td>
<td style="text-align: left;">reconstruido</td>
</tr>
<tr class="even">
<td style="text-align: left;">Number of rows</td>
<td style="text-align: left;">638867</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Number of columns</td>
<td style="text-align: left;">15</td>
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
<td style="text-align: left;">2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Date</td>
<td style="text-align: left;">5</td>
</tr>
<tr class="even">
<td style="text-align: left;">factor</td>
<td style="text-align: left;">5</td>
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
<td style="text-align: left;">uuid_caso</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">32</td>
<td style="text-align: right;">32</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">202722</td>
<td style="text-align: right;">0</td>
</tr>
<tr class="even">
<td style="text-align: left;">uuid_fallecimiento</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">32</td>
<td style="text-align: right;">32</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">25020</td>
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
<td style="text-align: left;">fecha_corte.x</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">2020-12-12</td>
<td style="text-align: left;">2020-12-12</td>
<td style="text-align: left;">2020-12-12</td>
<td style="text-align: right;">1</td>
</tr>
<tr class="even">
<td style="text-align: left;">fecha_resultado</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">2020-03-07</td>
<td style="text-align: left;">2020-10-04</td>
<td style="text-align: left;">2020-05-27</td>
<td style="text-align: right;">211</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fecha_corte.y</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">2020-12-12</td>
<td style="text-align: left;">2020-12-12</td>
<td style="text-align: left;">2020-12-12</td>
<td style="text-align: right;">1</td>
</tr>
<tr class="even">
<td style="text-align: left;">fecha_fallecimiento</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">2020-03-19</td>
<td style="text-align: left;">2020-10-05</td>
<td style="text-align: left;">2020-07-30</td>
<td style="text-align: right;">195</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fecha_nac</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">1915-11-25</td>
<td style="text-align: left;">2020-05-31</td>
<td style="text-align: left;">1961-06-16</td>
<td style="text-align: right;">13778</td>
</tr>
</tbody>
</table>

**Variable type: factor**

<table>
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
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">25</td>
<td style="text-align: left;">LIM: 493306, CAL: 49475, LA : 15961, LAM: 12792</td>
</tr>
<tr class="even">
<td style="text-align: left;">provincia</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">156</td>
<td style="text-align: left;">LIM: 493306, CAL: 49475, TRU: 15152, CHI: 12244</td>
</tr>
<tr class="odd">
<td style="text-align: left;">distrito</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">532</td>
<td style="text-align: left;">SAN: 124095, LIM: 61455, SAN: 52430, COM: 42400</td>
</tr>
<tr class="even">
<td style="text-align: left;">metododx</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">2</td>
<td style="text-align: left;">PR: 447068, PCR: 191799</td>
</tr>
<tr class="odd">
<td style="text-align: left;">sexo</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">2</td>
<td style="text-align: left;">Mas: 497342, Fem: 141525, 10: 0, 11: 0</td>
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
<td style="text-align: right;">58.03</td>
<td style="text-align: right;">12.45</td>
<td style="text-align: right;">0.00</td>
<td style="text-align: right;">50.00</td>
<td style="text-align: right;">59.00</td>
<td style="text-align: right;">66.00</td>
<td style="text-align: right;">104.00</td>
<td style="text-align: left;">▁▂▇▅▁</td>
</tr>
<tr class="even">
<td style="text-align: left;">edad_calc</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">58.53</td>
<td style="text-align: right;">12.45</td>
<td style="text-align: right;">0.26</td>
<td style="text-align: right;">50.56</td>
<td style="text-align: right;">59.09</td>
<td style="text-align: right;">66.91</td>
<td style="text-align: right;">104.72</td>
<td style="text-align: left;">▁▂▇▅▁</td>
</tr>
<tr class="odd">
<td style="text-align: left;">coincidencias</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">7.42</td>
<td style="text-align: right;">6.54</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: right;">2.00</td>
<td style="text-align: right;">5.00</td>
<td style="text-align: right;">11.00</td>
<td style="text-align: right;">38.00</td>
<td style="text-align: left;">▇▂▁▁▁</td>
</tr>
</tbody>
</table>

Hay coincidencias entre casos y fallecimientos, usando edad, sexo y
lugar en 92148 casos reconstruídos.

Gráficos
--------

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

-   [datos/fallecidos\_covid-utf8-limpio.csv.gz](datos/fallecidos_covid-utf8-limpio.csv.gz)
-   [datos/positivos\_covid-utf8-limpio.csv.gz](datos/positivos_covid-utf8-limpio.csv.gz)

Y algunos reconstruidos a partir de los anteriores:

-   [datos/casos\_fallecimientos\_reconstruccion\_posible.csv.gz](datos/casos_fallecimientos_reconstruccion_posible.csv.gz)
-   [datos/timeseries-casos.csv.gz](datos/timeseries-casos.csv.gz)
-   [datos/timeseries-casos-lugares.csv.gz](datos/timeseries-casos-lugares.csv.gz)
-   [datos/timeseries-fallecimientos.csv.gz](datos/timeseries-fallecimientos.csv.gz)
-   [datos/timeseries-fallecimientos-lugares.csv.gz](datos/timeseries-fallecimientos-lugares.csv.gz)
