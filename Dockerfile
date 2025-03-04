# Usar openjdk 8 basado en Alpine
FROM openjdk:8-jdk-alpine

# Establecer el directorio de trabajo
WORKDIR /app

# Instalar Maven en el contenedor
RUN apk add --no-cache \
    bash \
    curl \
    git \
    && curl -fsSL https://archive.apache.org/dist/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz -o /tmp/maven.tar.gz \
    && tar -xzf /tmp/maven.tar.gz -C /opt/ \
    && ln -s /opt/apache-maven-3.8.6 /opt/maven \
    && ln -s /opt/maven/bin/mvn /usr/bin/mvn \
    && rm -f /tmp/maven.tar.gz

# Establecer las variables de entorno para Maven
ENV MAVEN_HOME /opt/maven
ENV PATH $MAVEN_HOME/bin:$PATH

# Copiar el contenido del proyecto al contenedor
COPY . /app

# Ejecutar el comando de Maven (si lo necesitas)
CMD ["mvn", "clean", "install"]
