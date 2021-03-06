#Plantilla para el pre-procesado de datos - DATOS FALTANTES
#Importar el dataset

dataset = read.csv('Data.csv')

#TRATAMIENTO DE LOS VALORES NA
dataset$Age = ifelse(is.na(dataset$Age), ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),dataset$Age)

dataset$Salary = ifelse(is.na(dataset$Salary), ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),dataset$Salary)
