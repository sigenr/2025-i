#
# Análisis de datos de la Encuesta Nacional de Salud y Nutrición (NHANES)
#

# ENTRADA

# Importar datos de NHANES (National Health and Nutrition Examination Survey)
nhanes <- read.csv(
  file = "https://raw.githubusercontent.com/gf0604-procesamientodatosgeograficos/2025-i/refs/heads/main/datos/nchs/nhanes.csv"
)


# PROCESAMIENTO

# 1. Obtener cantidades de personas por nivel de educación formal

# Agrupar y contar por nivel de educación formal
cantidad_x_educacion <- table(nhanes$Education)

# Convertir a data frame
cantidad_x_educacion <- as.data.frame(
  cantidad_x_educacion
)

# Renombrar las columnas
names(cantidad_x_educacion) <- c("educacion", "cantidad")

# Ordenar por cantidad
cantidad_x_educacion <- cantidad_x_educacion[
  order(cantidad_x_educacion$c, decreasing = TRUE),
]

# 2. Obtener datos de estatura y peso de mujeres

# Filtrar datos de estatura y peso de mujeres
mujeres <- nhanes[nhanes$Gender == "female", c("Height", "Weight")]


# SALIDA

# Abrir archivo PDF
pdf("analisis-nhanes-graficos.pdf", width = 12, height = 6)
# Márgenes (arriba, izquierda, abajo, derecha)
par(mar = c(4, 7, 4, 2))

# 1. Gráfico de barras: Cantidad de personas por nivel de educación formal
barplot(
  height = cantidad_x_educacion$cantidad,
  names.arg = cantidad_x_educacion$educacion,
  main = "Cantidad de personas por nivel de educación formal",
  xlab = "Nivel de educación formal",
  ylab = "Cantidad de personas",
  las = 1,
  cex.names = 0.9,
  col = "black"
)

# 2. Gráfico de dispersión: estatura vs. peso de mujeres
plot(
  x = mujeres$Height,
  y = mujeres$Weight,
  main = "Estatura vs. peso de mujeres",
  xlab = "Estatura (cm)",
  ylab = "Peso (kg)",
  pch = 19,
  col = "red"
)

# Cerrar archivo PDF
dev.off()
