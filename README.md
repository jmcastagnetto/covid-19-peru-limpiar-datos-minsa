[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)
[![License](https://img.shields.io/github/license/jmcastagnetto/covid-19-peru-limpiar-datos-minsa)](LICENSE)

-   **Repositorio creado el 2020-05-22 05:05:43 UTC**
-   **Última actualización**: 2022-12-15 08:13:14 UTC

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
<td style="text-align: left;">4390954</td>
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
<colgroup>
<col style="width: 19%" />
<col style="width: 13%" />
<col style="width: 19%" />
<col style="width: 5%" />
<col style="width: 5%" />
<col style="width: 8%" />
<col style="width: 12%" />
<col style="width: 15%" />
</colgroup>
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
<td style="text-align: right;">80859</td>
<td style="text-align: right;">0.98</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">8</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">3901868</td>
<td style="text-align: right;">0</td>
</tr>
</tbody>
</table>

**Variable type: Date**

<table>
<colgroup>
<col style="width: 19%" />
<col style="width: 12%" />
<col style="width: 17%" />
<col style="width: 13%" />
<col style="width: 13%" />
<col style="width: 13%" />
<col style="width: 10%" />
</colgroup>
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
<td style="text-align: right;">4</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">2022-12-13</td>
<td style="text-align: left;">2022-12-13</td>
<td style="text-align: left;">2022-12-13</td>
<td style="text-align: right;">1</td>
</tr>
<tr class="even">
<td style="text-align: left;">fecha_resultado</td>
<td style="text-align: right;">2042</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">2001-01-14</td>
<td style="text-align: left;">2036-01-15</td>
<td style="text-align: left;">2021-11-03</td>
<td style="text-align: right;">1017</td>
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
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">33</td>
<td style="text-align: left;">LIM: 2067628, ARE: 278212, PIU: 177810, LA
: 176352</td>
</tr>
<tr class="even">
<td style="text-align: left;">provincia</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">201</td>
<td style="text-align: left;">LIM: 1795895, ARE: 236533, EN : 224037,
CAL: 158754</td>
</tr>
<tr class="odd">
<td style="text-align: left;">distrito</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1713</td>
<td style="text-align: left;">EN : 224037, LIM: 186762, SAN: 137932,
JES: 116439</td>
</tr>
<tr class="even">
<td style="text-align: left;">metododx</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">4</td>
<td style="text-align: left;">AG: 2103169, PCR: 1328697, PR: 959087,
AGA: 1</td>
</tr>
<tr class="odd">
<td style="text-align: left;">sexo</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">31</td>
<td style="text-align: left;">Fem: 2262193, Mas: 2128714, Cos: 7, Lim:
6</td>
</tr>
<tr class="even">
<td style="text-align: left;">ubigeo</td>
<td style="text-align: right;">224037</td>
<td style="text-align: right;">0.95</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1863</td>
<td style="text-align: left;">150: 186758, 150: 137932, 150: 116439,
150: 102552</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rango_edad_veintiles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">6</td>
<td style="text-align: left;">20-: 1887556, 40-: 1419564, 60-: 580964,
0-1: 403648</td>
</tr>
<tr class="even">
<td style="text-align: left;">rango_edad_deciles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">10</td>
<td style="text-align: left;">30-: 1011107, 20-: 876449, 40-: 812326,
50-: 607238</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rango_edad_quintiles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">18</td>
<td style="text-align: left;">30-: 531021, 25-: 520595, 35-: 480086,
40-: 431104</td>
</tr>
<tr class="even">
<td style="text-align: left;">rango_edad_owid</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">8</td>
<td style="text-align: left;">25-: 2344028, 50-: 607238, 18-: 444765,
60-: 386665</td>
</tr>
</tbody>
</table>

**Variable type: numeric**

<table>
<colgroup>
<col style="width: 15%" />
<col style="width: 11%" />
<col style="width: 15%" />
<col style="width: 8%" />
<col style="width: 10%" />
<col style="width: 5%" />
<col style="width: 5%" />
<col style="width: 5%" />
<col style="width: 5%" />
<col style="width: 10%" />
<col style="width: 6%" />
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
<td style="text-align: left;">edad</td>
<td style="text-align: right;">371</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">78.74</td>
<td style="text-align: right;">48281.35</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">28</td>
<td style="text-align: right;">38</td>
<td style="text-align: right;">52</td>
<td style="text-align: right;">80664105</td>
<td style="text-align: left;">▇▁▁▁▁</td>
</tr>
<tr class="even">
<td style="text-align: left;">epi_week</td>
<td style="text-align: right;">2042</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">22.19</td>
<td style="text-align: right;">15.60</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">6</td>
<td style="text-align: right;">22</td>
<td style="text-align: right;">34</td>
<td style="text-align: right;">53</td>
<td style="text-align: left;">▇▃▅▃▃</td>
</tr>
<tr class="odd">
<td style="text-align: left;">epi_year</td>
<td style="text-align: right;">2042</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">2021.23</td>
<td style="text-align: right;">0.81</td>
<td style="text-align: right;">2001</td>
<td style="text-align: right;">2021</td>
<td style="text-align: right;">2021</td>
<td style="text-align: right;">2022</td>
<td style="text-align: right;">2036</td>
<td style="text-align: left;">▁▁▇▁▁</td>
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
<td style="text-align: left;">217738</td>
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
<colgroup>
<col style="width: 19%" />
<col style="width: 13%" />
<col style="width: 19%" />
<col style="width: 5%" />
<col style="width: 5%" />
<col style="width: 8%" />
<col style="width: 12%" />
<col style="width: 15%" />
</colgroup>
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
<td style="text-align: right;">2656</td>
<td style="text-align: right;">0.99</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">8</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">215011</td>
<td style="text-align: right;">0</td>
</tr>
</tbody>
</table>

**Variable type: Date**

<table>
<colgroup>
<col style="width: 23%" />
<col style="width: 11%" />
<col style="width: 16%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 10%" />
</colgroup>
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
<td style="text-align: left;">2022-12-14</td>
<td style="text-align: left;">2022-12-14</td>
<td style="text-align: left;">2022-12-14</td>
<td style="text-align: right;">1</td>
</tr>
<tr class="even">
<td style="text-align: left;">fecha_fallecimiento</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">2020-03-03</td>
<td style="text-align: left;">2022-12-13</td>
<td style="text-align: left;">2021-02-04</td>
<td style="text-align: right;">1009</td>
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
<td style="text-align: left;">Mas: 137643, Fem: 80095</td>
</tr>
<tr class="even">
<td style="text-align: left;">clasificacion_def</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">7</td>
<td style="text-align: left;">Cri: 79492, Cri: 65915, Cri: 45202, Cri:
10787</td>
</tr>
<tr class="odd">
<td style="text-align: left;">departamento</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">25</td>
<td style="text-align: left;">LIM: 96056, PIU: 13166, LA : 10949, CAL:
10816</td>
</tr>
<tr class="even">
<td style="text-align: left;">provincia</td>
<td style="text-align: right;">5</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">196</td>
<td style="text-align: left;">LIM: 88176, CAL: 10815, ARE: 8568, TRU:
7309</td>
</tr>
<tr class="odd">
<td style="text-align: left;">distrito</td>
<td style="text-align: right;">5</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1665</td>
<td style="text-align: left;">LIM: 8761, SAN: 8623, SAN: 6836, CAL:
6223</td>
</tr>
<tr class="even">
<td style="text-align: left;">ubigeo</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1801</td>
<td style="text-align: left;">150: 8761, 150: 8623, 150: 6836, 070:
6223</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rango_edad_veintiles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">5</td>
<td style="text-align: left;">60-: 105561, 40-: 53959, 80+: 46303, 20-:
10116</td>
</tr>
<tr class="even">
<td style="text-align: left;">rango_edad_deciles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">9</td>
<td style="text-align: left;">60-: 53839, 70-: 51722, 80+: 46303, 50-:
35850</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rango_edad_quintiles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">17</td>
<td style="text-align: left;">80+: 46303, 65-: 28052, 70-: 27201, 60-:
25787</td>
</tr>
<tr class="even">
<td style="text-align: left;">rango_edad_owid</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">7</td>
<td style="text-align: left;">60-: 53839, 70-: 51722, 80+: 46303, 50-:
35850</td>
</tr>
</tbody>
</table>

**Variable type: numeric**

<table style="width:100%;">
<colgroup>
<col style="width: 16%" />
<col style="width: 12%" />
<col style="width: 16%" />
<col style="width: 9%" />
<col style="width: 7%" />
<col style="width: 6%" />
<col style="width: 6%" />
<col style="width: 6%" />
<col style="width: 6%" />
<col style="width: 6%" />
<col style="width: 7%" />
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
<td style="text-align: left;">edad</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">66.33</td>
<td style="text-align: right;">15.79</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">57</td>
<td style="text-align: right;">68</td>
<td style="text-align: right;">78</td>
<td style="text-align: right;">114</td>
<td style="text-align: left;">▁▂▇▇▁</td>
</tr>
<tr class="even">
<td style="text-align: left;">epi_week</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">21.59</td>
<td style="text-align: right;">11.99</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">12</td>
<td style="text-align: right;">21</td>
<td style="text-align: right;">30</td>
<td style="text-align: right;">53</td>
<td style="text-align: left;">▆▇▇▃▂</td>
</tr>
<tr class="odd">
<td style="text-align: left;">epi_year</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">2020.63</td>
<td style="text-align: right;">0.60</td>
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
<td style="text-align: left;">117690</td>
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
<colgroup>
<col style="width: 31%" />
<col style="width: 10%" />
<col style="width: 14%" />
<col style="width: 11%" />
<col style="width: 11%" />
<col style="width: 11%" />
<col style="width: 9%" />
</colgroup>
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
<td style="text-align: left;">2022-12-13</td>
<td style="text-align: left;">2022-12-13</td>
<td style="text-align: left;">2022-12-13</td>
<td style="text-align: right;">1</td>
</tr>
<tr class="even">
<td style="text-align: left;">positivo_fecha_resultado</td>
<td style="text-align: right;">167</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">2020-01-04</td>
<td style="text-align: left;">2022-12-13</td>
<td style="text-align: left;">2021-02-02</td>
<td style="text-align: right;">982</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fallecido_fecha_corte</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">2022-12-14</td>
<td style="text-align: left;">2022-12-14</td>
<td style="text-align: left;">2022-12-14</td>
<td style="text-align: right;">1</td>
</tr>
<tr class="even">
<td style="text-align: left;">fallecido_fecha_fallecimiento</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">2020-03-14</td>
<td style="text-align: left;">2022-12-13</td>
<td style="text-align: left;">2021-02-17</td>
<td style="text-align: right;">1000</td>
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
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">25</td>
<td style="text-align: left;">LIM: 56688, CAL: 6536, ARE: 6191, LA :
5497</td>
</tr>
<tr class="even">
<td style="text-align: left;">positivo_provincia</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">197</td>
<td style="text-align: left;">LIM: 47674, EN : 6940, CAL: 6276, ARE:
5090</td>
</tr>
<tr class="odd">
<td style="text-align: left;">positivo_distrito</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1410</td>
<td style="text-align: left;">EN : 6940, SAN: 4227, LIM: 3902, CAL:
3034</td>
</tr>
<tr class="even">
<td style="text-align: left;">positivo_metododx</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">3</td>
<td style="text-align: left;">PCR: 46784, PR: 37679, AG: 33227, AGA:
0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">positivo_sexo</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">3</td>
<td style="text-align: left;">Mas: 75354, Fem: 42335, Bel: 1, 0: 0</td>
</tr>
<tr class="even">
<td style="text-align: left;">positivo_ubigeo</td>
<td style="text-align: right;">6940</td>
<td style="text-align: right;">0.94</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1513</td>
<td style="text-align: left;">150: 4227, 150: 3902, 070: 3034, 150:
2987</td>
</tr>
<tr class="odd">
<td style="text-align: left;">positivo_rango_edad_veintiles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">6</td>
<td style="text-align: left;">60-: 56820, 40-: 30361, 80+: 23580, 20-:
5931</td>
</tr>
<tr class="even">
<td style="text-align: left;">positivo_rango_edad_deciles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">10</td>
<td style="text-align: left;">60-: 29591, 70-: 27229, 80+: 23580, 50-:
20056</td>
</tr>
<tr class="odd">
<td style="text-align: left;">positivo_rango_edad_quintiles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">18</td>
<td style="text-align: left;">80+: 23580, 65-: 15200, 60-: 14391, 70-:
14378</td>
</tr>
<tr class="even">
<td style="text-align: left;">positivo_rango_edad_owid</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">8</td>
<td style="text-align: left;">60-: 29591, 70-: 27229, 80+: 23580, 50-:
20056</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fallecido_sexo</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">2</td>
<td style="text-align: left;">Mas: 73915, Fem: 43775</td>
</tr>
<tr class="even">
<td style="text-align: left;">fallecido_clasificacion_def</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">7</td>
<td style="text-align: left;">Cri: 69005, Cri: 30549, Cri: 12395, Cri:
2577</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fallecido_departamento</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">25</td>
<td style="text-align: left;">LIM: 54210, ARE: 6082, CAL: 6015, LA :
5696</td>
</tr>
<tr class="even">
<td style="text-align: left;">fallecido_provincia</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">196</td>
<td style="text-align: left;">LIM: 49313, CAL: 6014, ARE: 4820, TRU:
3830</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fallecido_distrito</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1573</td>
<td style="text-align: left;">SAN: 4637, LIM: 4417, CAL: 3648, SAN:
3313</td>
</tr>
<tr class="even">
<td style="text-align: left;">fallecido_ubigeo</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1694</td>
<td style="text-align: left;">150: 4637, 150: 4417, 070: 3648, 150:
3313</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fallecido_rango_edad_veintiles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">5</td>
<td style="text-align: left;">60-: 57134, 40-: 30260, 80+: 23906, 20-:
5465</td>
</tr>
<tr class="even">
<td style="text-align: left;">fallecido_rango_edad_deciles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">9</td>
<td style="text-align: left;">60-: 29729, 70-: 27405, 80+: 23906, 50-:
20093</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fallecido_rango_edad_quintiles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">17</td>
<td style="text-align: left;">80+: 23906, 65-: 15325, 70-: 14486, 60-:
14404</td>
</tr>
<tr class="even">
<td style="text-align: left;">fallecido_rango_edad_owid</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">7</td>
<td style="text-align: left;">60-: 29729, 70-: 27405, 80+: 23906, 50-:
20093</td>
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
<td style="text-align: right;">24855003.09</td>
<td style="text-align: right;">14303364.49</td>
<td style="text-align: right;">12</td>
<td style="text-align: right;">10183108</td>
<td style="text-align: right;">36209698</td>
<td style="text-align: right;">36607172</td>
<td style="text-align: right;">39454010</td>
<td style="text-align: left;">▃▂▁▁▇</td>
</tr>
<tr class="even">
<td style="text-align: left;">positivo_edad</td>
<td style="text-align: right;">6</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">65.72</td>
<td style="text-align: right;">15.85</td>
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
<td style="text-align: right;">22.91</td>
<td style="text-align: right;">14.02</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">11</td>
<td style="text-align: right;">21</td>
<td style="text-align: right;">33</td>
<td style="text-align: right;">53</td>
<td style="text-align: left;">▇▇▇▅▃</td>
</tr>
<tr class="even">
<td style="text-align: left;">positivo_epi_year</td>
<td style="text-align: right;">167</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">2020.65</td>
<td style="text-align: right;">0.63</td>
<td style="text-align: right;">2020</td>
<td style="text-align: right;">2020</td>
<td style="text-align: right;">2021</td>
<td style="text-align: right;">2021</td>
<td style="text-align: right;">2022</td>
<td style="text-align: left;">▇▁▇▁▂</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fallecido_edad</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">65.99</td>
<td style="text-align: right;">15.66</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">56</td>
<td style="text-align: right;">67</td>
<td style="text-align: right;">77</td>
<td style="text-align: right;">113</td>
<td style="text-align: left;">▁▂▇▇▁</td>
</tr>
<tr class="even">
<td style="text-align: left;">fallecido_epi_week</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">21.43</td>
<td style="text-align: right;">12.41</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">11</td>
<td style="text-align: right;">20</td>
<td style="text-align: right;">30</td>
<td style="text-align: right;">53</td>
<td style="text-align: left;">▇▇▇▃▂</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fallecido_epi_year</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">2020.71</td>
<td style="text-align: right;">0.65</td>
<td style="text-align: right;">2020</td>
<td style="text-align: right;">2020</td>
<td style="text-align: right;">2021</td>
<td style="text-align: right;">2021</td>
<td style="text-align: right;">2022</td>
<td style="text-align: left;">▆▁▇▁▂</td>
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
