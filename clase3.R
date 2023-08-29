##CLase 3

# 1°Baja de archivos de defunciones de la página de datos abiertos.

library(dplyr)

options(timeout=1000000) # incrementamos el timeout debido a que la descarga es lenta

url = "http://datos.salud.gob.ar/dataset/27c588e8-43d0-411a-a40c-7ecc563c2c9f/resource/fab9e990-865c-43c4-a643-3dbc3b70a934/download/defunciones-ocurridas-y-registradas-en-la-republica-argentina-anos-2005-2021.csv" #toma el archivo de la url

download.file(url, destfile = "defunciones.csv") #baja el archivo de defunciones de la url anterior

defunciones = read.csv("defunciones.csv", encoding = "latin1") #crea el dataframe

unlink("defunciones.csv")


#2°Elimina datos anteriores a 2010

defunciones = defunciones[defunciones$anio >= 2010,] 

# observamos la estructura del data frame
str(defunciones)


# Eliminamos las variables cie10_causa_id, muerte_materna_id y muerte_materna_clasificacion que no vamos a usar
defunciones$cie10_causa_id = NULL
defunciones$cie10_clasificacion = NULL
defunciones$muerte_materna_id = NULL
defunciones$muerte_materna_clasificacion = NULL

# Observamos los grupos etarios del archivo de defunciones:

unique(defunciones$grupo_edad)

# 3°  Procesamiento de los datos de población dede proyecciones poblacionales

library(readr)
url = "https://raw.githubusercontent.com/agsantoro/untref2023/main/RMD/RMD01_Poblacion/problacion_prov.csv"
download.file(url,dest="poblacion.csv")
poblacion = read_csv("poblacion.csv") %>% as.data.frame()

