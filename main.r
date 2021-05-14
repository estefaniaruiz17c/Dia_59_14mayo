# Estefanía Ruiz Cuartas
# Lenguaje de programación: R
# Tema: Regresión lineal simple
# Fuentes de consulta:  https://www.tutorialspoint.com/r/r_linear_regression.htm  https://r-coder.com/plot-en-r/#El_argumento_pch

# Regresión lineal simple: herramienta estadística utilizada para establecer un modelo de relación entre dos variables. Una de estas variables se llama variable predictora cuyo valor se recopila a través de experimentos; la otra variable se llama variable de respuesta cuyo valor se deriva de la variable predictora.En la regresión lineal, estas dos variables están relacionadas a través de una ecuación, donde el exponente de ambas variables es 1. Matemáticamente, una relación lineal representa una línea recta cuando se traza como un gráfico.

# La ecuación matemática general para una regresión lineal es: y = ax + b . Parámetros: y es la variable de respuesta; x es la variable predictora; a y b son constantes que se llaman coeficientes.

# Pasos para realizar una regresión lineal: 1. Recolectar los valores a estudiar. 2. Crear un modelo de relación entre el predictor y la variable de respuesta, esto lo hacemos con la función lm(). 3. Encontrar los coeficientes del modelo creado con el paso anterior y crear la ecuación matemática usando estos. 4. Obtenga un resumen del modelo de relación para conocer el error promedio en la predicción. También se denomina residuos. 5. Para realizar la predicción, se usa la función predict() en R
cat("\n
Regresión lineal
\n")

# - Ejercicio 1: queremos predecir aproximadamente ventas que logrará una tienda en el mes 12, según lo vendido en los 11 meses anteriores
cat("\n
- Ejercicio 1: queremos predecir aproximadamente ventas que logrará una tienda en el mes 12, según lo vendido en los 11 meses anteriores
\n")

# Paso 1: En primer lugar debemos leer el archivo del cual tomaremos la información, esto lo hacemos con read.table(). Dentro de esta función indicaremos header=TRUE, para mostrar los encabezados
doc1 <- read.table("ventas.txt",header=TRUE)

# Requerimos definir quién será x y quién será y. En este caso x corresponde al mes y y corresponde a las ventas
x1 <- doc1$mes
y1 <- doc1$ventas

# Paso 2: Modelo de relación con la función lm().
cat("\n
* Modelo de relación
\n")
relacion1 <- lm(y1~x1)

# Paso 3: mostrando el paso anterior, conseguimos los coeficientes. En nuestro caso a = 4.509 y b = 177.127. Así la ecuación resultante es: y = 4.509x + 177.127
print(relacion1)

cat("\n")
# Paso 4: Conocer con summary() en el modelo de relación, el error promedio de la predicción
cat("\n
* Resumen del modelo de relación
\n")
print(summary(relacion1))
# En este caso, el error residual estándar es: 6.157 sobre 9 grados de libertad

cat("\n")
# Paso 5: realizar la predicción con la función predict(). Sintax de predict: predict(object, newdata): objeto es la fórmula creada con la función lm(); newdata es el vector que contiene el nuevo valor de la variable predictora.
# Queremos saber la predicción de cuántas serían las ventas para el mes 12
cat("\n
* Predicción de ventas para el mes 12
\n")
mes_12 <- data.frame(x1 = 12)
prediccion1 <- predict(relacion1,mes_12)

# Mostraremos el resultado de la predicción
print(prediccion1)
# Vemos que para el mes 12 se esperan aproximadamente 231 ventas

# Paso final: graficar la regresión lineal. Esto lo hacemos con la función plot().
# Esta gráfica queremos guardarla en formato png, esto podemos designarlo al inicio con el nombre con el cuál lo queremos guardar
png(file="Regresionl_ventas.png")

# Creación de la gráfica con los siguientes parámetros: plot(variable y, variable x,col que indica el color de la gráfica,main que indica el título de la gráfica, abline(lm(x~y)) que sirve para graficar la línea que indica la tendencia de la regresión lineal,cex que permite cambiar el tamaño de los símbolos que muestran el comportamiento de los datos, pch sirve para modificar el símbolo de los puntos en el gráfico,xlab indica el nombre del eje x, ylab indica el nombre del eje y)
plot(y1,x1,col = "#DF536B",main = "Regresión de las ventas",
abline(lm(x1~y1)),cex = 2.5,pch = 18,xlab = "Ventas",ylab = "Mes")
   
# Por último, para guardar el archivo que acabamos de crear usamos dev.off()
dev.off()

# Línea separadora de temas
cat("\n")
cat("\n",
"\n")
cat("-------------------------------------------------------------------")
cat("\n")
cat("\n")

# - Ejercicio 2: queremos predecir aproximadamente la población de un cultivo de microorganismos cumplida una hora
cat("\n
- Ejercicio 2: queremos predecir aproximadamente la población de un cultivo de microorganismos cumplida una hora
\n")

# Paso 1: En primer lugar debemos leer el archivo del cual tomaremos la información, esto lo hacemos con read.table(). Dentro de esta función indicaremos header=TRUE, para mostrar los encabezados
doc2 <- read.table("cultivos.txt",header=TRUE)

# Requerimos definir quién será x y quién será y. En este caso x corresponde al mes y y corresponde a las ventas
x2 <- doc2$tiempo_minutos
y2 <- doc2$poblacion_individuos

# Paso 2: Modelo de relación con la función lm().
cat("\n
* Modelo de relación
\n")
relacion2 <- lm(y2~x2)

# Paso 3: mostrando el paso anterior, conseguimos los coeficientes. En nuestro caso a = 2.041 y b = 13.449. Así la ecuación resultante es: y = 2.041x + 13.449
print(relacion2)

cat("\n")
# Paso 4: Conocer con summary() en el modelo de relación, el error promedio de la predicción
cat("\n
* Resumen del modelo de relación
\n")
print(summary(relacion2))
# En este caso, el error residual estándar es: 2.384 sobre 10 grados de libertad

cat("\n")
# Paso 5: realizar la predicción con la función predict(). Sintax de predict: predict(object, newdata): objeto es la fórmula creada con la función lm(); newdata es el vector que contiene el nuevo valor de la variable predictora.
# Queremos saber la predicción de cuántos individuos de microorganismos habrían cumplida una hora (60 minutos)
cat("\n
* Predicción de ventas para el mes 12
\n")
min_60 <- data.frame(x2 = 60)
prediccion2 <- predict(relacion2,min_60)

# Mostraremos el resultado de la predicción
print(prediccion2)
# Vemos que para el minuto 60 se esperan encontrar, aproximadamente 136 microorganismos

# Paso final: graficar la regresión lineal. Esto lo hacemos con la función plot().
# Esta gráfica queremos guardarla en formato png, esto podemos designarlo al inicio con el nombre con el cuál lo queremos guardar
png(file="Regresionl_cultivo.png")

# Creación de la gráfica con los siguientes parámetros: plot(variable y, variable x,col que indica el color de la gráfica,main que indica el título de la gráfica, abline(lm(x~y)) que sirve para graficar la línea que indica la tendencia de la regresión lineal,cex que permite cambiar el tamaño de los símbolos que muestran el comportamiento de los datos, pch sirve para modificar el símbolo de los puntos en el gráfico, lwd permite aumentar el grosor del borde de los símbolos, xlab indica el nombre del eje x, ylab indica el nombre del eje y)
plot(y2,x2,col = "green3",main = "Regresión de crecimiento: cultivo de microorganismos",
abline(lm(x2~y2)),cex = 2.5,pch = 9,lwd = 3.4,xlab = "Población",ylab = "Minutos")
   
# Por último, para guardar el archivo que acabamos de crear usamos dev.off()
dev.off()

