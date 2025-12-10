# Usa la imagen oficial de R con Shiny
FROM rocker/shiny:latest

# Copia el archivo de requisitos
COPY requirements.txt /tmp/requirements.txt

# Instala los paquetes listados en requirements.txt
RUN R -e "pkgs <- scan('/tmp/requirements.txt', what='character'); install.packages(pkgs)"

# Copia tu aplicación al directorio del servidor Shiny
COPY . /srv/shiny-server/

# Expone el puerto 8080 (Render lo usa por defecto)
EXPOSE 8080

# Comando para iniciar el servidor Shiny
CMD ["/usr/bin/shiny-server"]