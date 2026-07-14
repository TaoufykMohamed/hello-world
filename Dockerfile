# Étape 1 : Construction (Build) de l'application
FROM maven:3.9-eclipse-temurin-25 AS build
WORKDIR /app

# Copie des fichiers de configuration Maven et du code source
COPY pom.xml .
COPY src ./src

# Compilation et packaging de l'application (en ignorant les tests pour accélérer)
RUN mvn clean package -DskipTests

# Étape 2 : Image de production légère (Run)
FROM eclipse-temurin:25-jre-alpine
WORKDIR /app

# Récupération du JAR généré à l'étape précédente
COPY --from=build /app/target/*.jar app.jar

# Port d'écoute configuré (votre port 8081)
EXPOSE 8081

# Commande de démarrage
ENTRYPOINT ["java", "-jar", "app.jar"]