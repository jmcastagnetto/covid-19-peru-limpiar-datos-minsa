[![DOI](https://zenodo.org/badge/266025854.svg)](https://zenodo.org/badge/latestdoi/266025854)
[![License](https://img.shields.io/github/license/jmcastagnetto/covid-19-peru-limpiar-datos-minsa)](LICENSE)

-   **Repositorio creado el 2020-05-22 05:05:43 UTC**
-   **Última actualización**: 2022-10-12 08:11:55 UTC

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
<td style="text-align: left;">4149078</td>
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
<td style="text-align: right;">75970</td>
<td style="text-align: right;">0.98</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">8</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">3747533</td>
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
<td style="text-align: left;">2022-10-10</td>
<td style="text-align: left;">2022-10-10</td>
<td style="text-align: left;">2022-10-10</td>
<td style="text-align: right;">1</td>
</tr>
<tr class="even">
<td style="text-align: left;">fecha_resultado</td>
<td style="text-align: right;">2023</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">2020-03-06</td>
<td style="text-align: left;">2022-10-10</td>
<td style="text-align: left;">2021-06-30</td>
<td style="text-align: right;">947</td>
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
<td style="text-align: right;">25</td>
<td style="text-align: left;">LIM: 1916485, ARE: 269296, PIU: 173544, LA : 169097</td>
</tr>
<tr class="even">
<td style="text-align: left;">provincia</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">197</td>
<td style="text-align: left;">LIM: 1667855, ARE: 229058, EN : 201096, CAL: 151285</td>
</tr>
<tr class="odd">
<td style="text-align: left;">distrito</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1702</td>
<td style="text-align: left;">EN : 201096, LIM: 172364, SAN: 127678, JES: 108406</td>
</tr>
<tr class="even">
<td style="text-align: left;">metododx</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">3</td>
<td style="text-align: left;">AG: 1921495, PCR: 1271703, PR: 955880</td>
</tr>
<tr class="odd">
<td style="text-align: left;">sexo</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">3</td>
<td style="text-align: left;">Fem: 2127709, Mas: 2021368, No : 1</td>
</tr>
<tr class="even">
<td style="text-align: left;">ubigeo</td>
<td style="text-align: right;">201096</td>
<td style="text-align: right;">0.95</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1852</td>
<td style="text-align: left;">150: 172364, 150: 127678, 150: 108406, 150: 95727</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rango_edad_veintiles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">6</td>
<td style="text-align: left;">20-: 1797167, 40-: 1332642, 60-: 539306, 0-1: 387316</td>
</tr>
<tr class="even">
<td style="text-align: left;">rango_edad_deciles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">10</td>
<td style="text-align: left;">30-: 961141, 20-: 836026, 40-: 766473, 50-: 566169</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rango_edad_quintiles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">18</td>
<td style="text-align: left;">30-: 505097, 25-: 496338, 35-: 456044, 40-: 407817</td>
</tr>
<tr class="even">
<td style="text-align: left;">rango_edad_owid</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">8</td>
<td style="text-align: left;">25-: 2223952, 50-: 566169, 18-: 425002, 60-: 358721</td>
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
<td style="text-align: right;">352</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">40.40</td>
<td style="text-align: right;">17.61</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">28</td>
<td style="text-align: right;">38</td>
<td style="text-align: right;">52</td>
<td style="text-align: right;">125</td>
<td style="text-align: left;">▃▇▃▁▁</td>
</tr>
<tr class="even">
<td style="text-align: left;">epi_week</td>
<td style="text-align: right;">2023</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">18.62</td>
<td style="text-align: right;">14.26</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">17</td>
<td style="text-align: right;">30</td>
<td style="text-align: right;">53</td>
<td style="text-align: left;">▇▃▅▂▁</td>
</tr>
<tr class="odd">
<td style="text-align: left;">epi_year</td>
<td style="text-align: right;">2023</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">2021.19</td>
<td style="text-align: right;">0.81</td>
<td style="text-align: right;">2020</td>
<td style="text-align: right;">2021</td>
<td style="text-align: right;">2021</td>
<td style="text-align: right;">2022</td>
<td style="text-align: right;">2022</td>
<td style="text-align: left;">▅▁▆▁▇</td>
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
<td style="text-align: left;">216819</td>
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
<td style="text-align: right;">2662</td>
<td style="text-align: right;">0.99</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">8</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">214086</td>
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
<td style="text-align: left;">2022-10-10</td>
<td style="text-align: left;">2022-10-10</td>
<td style="text-align: left;">2022-10-10</td>
<td style="text-align: right;">1</td>
</tr>
<tr class="even">
<td style="text-align: left;">fecha_fallecimiento</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">2020-03-03</td>
<td style="text-align: left;">2022-10-10</td>
<td style="text-align: left;">2021-02-05</td>
<td style="text-align: right;">945</td>
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
<td style="text-align: left;">Mas: 137187, Fem: 79632</td>
</tr>
<tr class="even">
<td style="text-align: left;">clasificacion_def</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">7</td>
<td style="text-align: left;">Cri: 67884, Cri: 63884, Cri: 47821, Cri: 16374</td>
</tr>
<tr class="odd">
<td style="text-align: left;">departamento</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">25</td>
<td style="text-align: left;">LIM: 94738, PIU: 13252, LA : 11039, CAL: 10634</td>
</tr>
<tr class="even">
<td style="text-align: left;">provincia</td>
<td style="text-align: right;">5</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">196</td>
<td style="text-align: left;">LIM: 86867, CAL: 10633, ARE: 8655, TRU: 7371</td>
</tr>
<tr class="odd">
<td style="text-align: left;">distrito</td>
<td style="text-align: right;">5</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1667</td>
<td style="text-align: left;">LIM: 8662, SAN: 8610, SAN: 6748, CAL: 6123</td>
</tr>
<tr class="even">
<td style="text-align: left;">ubigeo</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1806</td>
<td style="text-align: left;">150: 8662, 150: 8610, 150: 6748, 070: 6123</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rango_edad_veintiles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">5</td>
<td style="text-align: left;">60-: 105236, 40-: 53587, 80+: 46275, 20-: 9998</td>
</tr>
<tr class="even">
<td style="text-align: left;">rango_edad_deciles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">9</td>
<td style="text-align: left;">60-: 53651, 70-: 51585, 80+: 46275, 50-: 35635</td>
</tr>
<tr class="odd">
<td style="text-align: left;">rango_edad_quintiles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">17</td>
<td style="text-align: left;">80+: 46275, 65-: 27973, 70-: 27154, 60-: 25678</td>
</tr>
<tr class="even">
<td style="text-align: left;">rango_edad_owid</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">7</td>
<td style="text-align: left;">60-: 53651, 70-: 51585, 80+: 46275, 50-: 35635</td>
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
<td style="text-align: right;">66.39</td>
<td style="text-align: right;">15.75</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">57</td>
<td style="text-align: right;">68</td>
<td style="text-align: right;">78</td>
<td style="text-align: right;">117</td>
<td style="text-align: left;">▁▂▇▇▁</td>
</tr>
<tr class="even">
<td style="text-align: left;">epi_week</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">21.31</td>
<td style="text-align: right;">11.85</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">12</td>
<td style="text-align: right;">20</td>
<td style="text-align: right;">30</td>
<td style="text-align: right;">53</td>
<td style="text-align: left;">▆▇▇▃▂</td>
</tr>
<tr class="odd">
<td style="text-align: left;">epi_year</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">2020.62</td>
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
<td style="text-align: left;">114896</td>
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
<td style="text-align: left;">2022-10-10</td>
<td style="text-align: left;">2022-10-10</td>
<td style="text-align: left;">2022-10-10</td>
<td style="text-align: right;">1</td>
</tr>
<tr class="even">
<td style="text-align: left;">positivo_fecha_resultado</td>
<td style="text-align: right;">167</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">2020-03-12</td>
<td style="text-align: left;">2022-10-07</td>
<td style="text-align: left;">2021-02-05</td>
<td style="text-align: right;">927</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fallecido_fecha_corte</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">2022-10-10</td>
<td style="text-align: left;">2022-10-10</td>
<td style="text-align: left;">2022-10-10</td>
<td style="text-align: right;">1</td>
</tr>
<tr class="even">
<td style="text-align: left;">fallecido_fecha_fallecimiento</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1</td>
<td style="text-align: left;">2020-03-14</td>
<td style="text-align: left;">2022-10-10</td>
<td style="text-align: left;">2021-02-15</td>
<td style="text-align: right;">936</td>
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
<td style="text-align: left;">LIM: 53982, CAL: 6336, ARE: 6200, LA : 5519</td>
</tr>
<tr class="even">
<td style="text-align: left;">positivo_provincia</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">197</td>
<td style="text-align: left;">LIM: 45530, EN : 6461, CAL: 6086, ARE: 5075</td>
</tr>
<tr class="odd">
<td style="text-align: left;">positivo_distrito</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1433</td>
<td style="text-align: left;">EN : 6461, SAN: 4156, LIM: 3765, CAL: 2981</td>
</tr>
<tr class="even">
<td style="text-align: left;">positivo_metododx</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">3</td>
<td style="text-align: left;">PCR: 42485, PR: 37006, AG: 35405</td>
</tr>
<tr class="odd">
<td style="text-align: left;">positivo_sexo</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">2</td>
<td style="text-align: left;">Mas: 73756, Fem: 41140, No : 0</td>
</tr>
<tr class="even">
<td style="text-align: left;">positivo_ubigeo</td>
<td style="text-align: right;">6461</td>
<td style="text-align: right;">0.94</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1541</td>
<td style="text-align: left;">150: 4156, 150: 3765, 070: 2981, 150: 2866</td>
</tr>
<tr class="odd">
<td style="text-align: left;">positivo_rango_edad_veintiles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">6</td>
<td style="text-align: left;">60-: 55728, 40-: 29494, 80+: 23127, 20-: 5651</td>
</tr>
<tr class="even">
<td style="text-align: left;">positivo_rango_edad_deciles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">10</td>
<td style="text-align: left;">60-: 29039, 70-: 26689, 80+: 23127, 50-: 19533</td>
</tr>
<tr class="odd">
<td style="text-align: left;">positivo_rango_edad_quintiles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">18</td>
<td style="text-align: left;">80+: 23127, 65-: 14943, 70-: 14131, 60-: 14096</td>
</tr>
<tr class="even">
<td style="text-align: left;">positivo_rango_edad_owid</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">8</td>
<td style="text-align: left;">60-: 29039, 70-: 26689, 80+: 23127, 50-: 19533</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fallecido_sexo</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">2</td>
<td style="text-align: left;">Mas: 72222, Fem: 42674</td>
</tr>
<tr class="even">
<td style="text-align: left;">fallecido_clasificacion_def</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">7</td>
<td style="text-align: left;">Cri: 52210, Cri: 34024, Cri: 12225, Cri: 8539</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fallecido_departamento</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">25</td>
<td style="text-align: left;">LIM: 51799, ARE: 6108, CAL: 5828, LA : 5708</td>
</tr>
<tr class="even">
<td style="text-align: left;">fallecido_provincia</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">196</td>
<td style="text-align: left;">LIM: 47008, CAL: 5827, ARE: 4843, TRU: 3837</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fallecido_distrito</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1585</td>
<td style="text-align: left;">SAN: 4546, LIM: 4282, CAL: 3539, SAN: 3151</td>
</tr>
<tr class="even">
<td style="text-align: left;">fallecido_ubigeo</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">FALSE</td>
<td style="text-align: right;">1711</td>
<td style="text-align: left;">150: 4546, 150: 4282, 070: 3539, 150: 3151</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fallecido_rango_edad_veintiles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">5</td>
<td style="text-align: left;">60-: 56055, 40-: 29433, 80+: 23341, 20-: 5239</td>
</tr>
<tr class="even">
<td style="text-align: left;">fallecido_rango_edad_deciles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">9</td>
<td style="text-align: left;">60-: 29201, 70-: 26854, 80+: 23341, 50-: 19583</td>
</tr>
<tr class="odd">
<td style="text-align: left;">fallecido_rango_edad_quintiles</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">17</td>
<td style="text-align: left;">80+: 23341, 65-: 15050, 70-: 14214, 60-: 14151</td>
</tr>
<tr class="even">
<td style="text-align: left;">fallecido_rango_edad_owid</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">1.00</td>
<td style="text-align: left;">TRUE</td>
<td style="text-align: right;">7</td>
<td style="text-align: left;">60-: 29201, 70-: 26854, 80+: 23341, 50-: 19583</td>
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
<td style="text-align: right;">25061261.11</td>
<td style="text-align: right;">14244576.17</td>
<td style="text-align: right;">12</td>
<td style="text-align: right;">10613176</td>
<td style="text-align: right;">36211092</td>
<td style="text-align: right;">36611875</td>
<td style="text-align: right;">39454010</td>
<td style="text-align: left;">▃▂▁▁▇</td>
</tr>
<tr class="even">
<td style="text-align: left;">positivo_edad</td>
<td style="text-align: right;">6</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">65.84</td>
<td style="text-align: right;">15.73</td>
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
<td style="text-align: right;">20.03</td>
<td style="text-align: right;">12.31</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">10</td>
<td style="text-align: right;">19</td>
<td style="text-align: right;">29</td>
<td style="text-align: right;">53</td>
<td style="text-align: left;">▇▇▇▃▂</td>
</tr>
<tr class="even">
<td style="text-align: left;">positivo_epi_year</td>
<td style="text-align: right;">167</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">2020.67</td>
<td style="text-align: right;">0.64</td>
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
<td style="text-align: right;">66.08</td>
<td style="text-align: right;">15.54</td>
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
<td style="text-align: right;">20.97</td>
<td style="text-align: right;">12.09</td>
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
<td style="text-align: right;">2020.69</td>
<td style="text-align: right;">0.64</td>
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
