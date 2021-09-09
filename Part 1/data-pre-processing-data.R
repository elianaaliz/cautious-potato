#Plantilla para el pre-procesado de datos
#Importar el dataset

dataset = read.csv('Data.csv')
#dataset = dataset[, 2:3]

#Dividir los datos en conjuntos de modelo y testing
#install.packages("caTools")

library(caTools)

set.seed(123)

split = sample.split(dataset$Purchased, SplitRatio = 0.8)

training_set = subset(dataset, split == TRUE)
testing_set = subset(dataset, split == FALSE)

#Escalado de variables (normalizamos los valores numericos, ya que no es posible Country ni Purchased)
# training_set[,2:3] = scale(training_set[,2:3])
# testing_set[,2:3] = scale(testing_set[,2:3])



