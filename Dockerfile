# Stage 1: Build the Maven project
FROM maven:3.8.2-openjdk-8 AS build_stage
ARG PATH=/swaroopdir
WORKDIR ${PATH}
COPY . .
RUN mvn clean package

# Stage 2: Use Tomcat to deploy the WAR file
FROM tomcat:9.0
ARG PATH=/swaroopdir
COPY --from=build_stage ${PATH}/target/hello-world-war-null.war /usr/local/tomcat/webapps/
