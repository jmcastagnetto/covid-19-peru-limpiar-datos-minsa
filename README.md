## Notas 

**2020-05-22**

- La limpieza de datos no está completa aún, hay fechas de tomas de prueba que parecen ser incorrectas, y que al convertir dan fechas inconsistentes con el primer caso reportado (2020-03-06). 
- En al menos un caso, la fecha de toma de pruebas es copia de la fecha de nacimiento. 
- He agregado una columna `fecha_prueba_antes_primer_caso` para marcar esos registros. Son 126 registros que tienen este problema.
**2020-05-23**

- Los datos han cambiado de formato, ya no incluyen la fecha de nacimiento, sino la edad en años.


## Información relevante

Fuente de datos:
https://www.datosabiertos.gob.pe/dataset/casos-positivos-por-covid-19-ministerio-de-salud-minsa

Descargado: 2020-05-21, 23:05 (PET)

Preproceso con iconv:

```
$ unzip -p DATOSABIERTOS_SISCOVID.zip | iconv  -f ISO_8859-1 -t UTF-8 - > DATOSABIERTOS_SISCOVID-utf8.csv
$ gzip -9 DATOSABIERTOS_SISCOVID-utf8.csv
```

Luego del primer paso de limpieza de datos:

```
> summary(casos_clean)
     uuid           fecha_nacimiento    
 Length:108669      Min.   :1914-06-16  
 Class :character   1st Qu.:1965-06-06  
 Mode  :character   Median :1977-10-24  
                    Mean   :1976-07-18  
                    3rd Qu.:1989-01-06  
                    Max.   :2020-11-03  
                    NA's   :3792        
        sexo           departamento  
 Femenino :39773   LIMA      :65508  
 Masculino:62076   CALLAO    : 7148  
 NA's     : 6820   LAMBAYEQUE: 6205  
                   PIURA     : 3948  
                   ANCASH    : 2895  
                   (Other)   :21289  
                   NA's      : 1676  
                   provincia    
 LIMA                   :63440  
 PROV. CONST. DEL CALLAO: 6148  
 CHICLAYO               : 4065  
 CALLAO                 : 2620  
 CORONEL PORTILLO       : 2461  
 (Other)                :29879  
 NA's                   :   56  
                   distrito      fecha_prueba       
 SAN JUAN DE LURIGANCHO: 6301   Min.   :1981-10-28  
 CALLAO                : 6002   1st Qu.:2020-04-23  
 LIMA                  : 4766   Median :2020-05-04  
 ATE                   : 4090   Mean   :2020-04-30  
 COMAS                 : 3585   3rd Qu.:2020-05-12  
 (Other)               :83865   Max.   :2020-06-06  
 NA's                  :   60                       
 tipo_prueba
 PCR:20478  
 PR :88191 
```

Los archivos "limpios" son:

- DATOSABIERTOS_SISCOVID.Rdata
- DATOSABIERTOS_SISCOVID-utf8-limpio.csv.gz
