FROM openjdk:8-jdk-slim

WORKDIR /home/usuario/Ejecucion

# Instalar Maven y herramientas necesarias
RUN apt-get update && apt-get install -y --no-install-recommends \
    maven \
    vim \ 
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Verificar las versiones instaladas
RUN java -version && mvn -version
