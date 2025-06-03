# SIG en R 2025-i

## Contenedor Docker

### Construcción y ejecución

```shell
# Construcción del contenedor Docker
docker build -t sigenr-2025-i .

# Ejecución del contenedor Docker
# (el directorio local debe especificarse en la opción -v)

docker run -d --name sigenr-2025-i \
  -p 8787:8787 \
  -v ~/sigenr/2025-i/github:/home/rstudio \
  --env-file ~/sigenr-2025-i.env \
  sigenr-2025-i
```
  
### Acceso

[http://localhost:8787](http://localhost:8787)

### Detención y borrado

```shell
# Detención del contenedor Docker
docker stop sigenr-2025-i

# Borrado del contenedor Docker
docker rm sigenr-2025-i
```

### Ejemplo de contenido del archivo `~/sigenr-2025-i.env`

```shell
# Clave para ingresar a RStudio
PASSWORD=sigenr
```

