#Regresion Lineal Simple

#Plantilla para el pre-procesado de datos
#Importar el dataset

dataset = read.csv('Salary_Data.csv')
#dataset = dataset[, 2:3]


#Dividir los datos en conjuntos de modelo y testing
#install.packages("caTools")

library(caTools)

set.seed(123)

split = sample.split(dataset$Salary, SplitRatio = 2/3) #20 individuos para entrenar y 10 para validar

training_set = subset(dataset, split == TRUE)
testing_set = subset(dataset, split == FALSE)

#Escalado de variables (normalizamos los valores numericos, ya que no es posible Country ni Purchased)
# training_set[,2:3] = scale(training_set[,2:3])
# testing_set[,2:3] = scale(testing_set[,2:3])

#AJUSTAR EL MODELO DE REGRESION LINEAL SIMPLE CON EL CONJUNTO DE ENTRENAMIENTO 

regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

#PREDECIR RESULTADOS CON EL CONJUNTO DE TEST

y_pred = predict(regressor, newdata = testing_set)

#Visualizacion de los resultados en el conjunto de entrenamiento

#install.packages("ggplot2")
library(ggplot2)
ggplot() + 
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = "red") + 
  geom_line(aes(x = training_set$YearsExperience,
                y = predict(regressor, newdata = training_set)),
            colour = "blue") +
  ggtitle("Sueldo vs Años de Experiencia (Conjunto de entrenamiento)") +
  xlab("Años de Experiencia") +
  ylab("Sueldo (en $)")

#Visualizacion de los resultados (conjunto de testing)

ggplot() + 
  geom_point(aes(x = testing_set$YearsExperience, y = testing_set$Salary),
             colour = "red") + 
  geom_line(aes(x = testing_set$YearsExperience,
                y = predict(regressor, newdata = testing_set)),
            colour = "blue") +
  ggtitle("Sueldo vs Años de Experiencia (Conjunto de testing)") +
  xlab("Años de Experiencia") +
  ylab("Sueldo (en $)")




