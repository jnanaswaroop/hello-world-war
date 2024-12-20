# Stage 1: Build the Maven project
FROM maven:3.8.2-openjdk-8 AS build_stage
ARG MYPATH=/swaroopdir
ARG BUILD_VERSION=1.1.0
WORKDIR ${MYPATH}
COPY . .
RUN mvn clean package

# Stage 2: Use Tomcat to deploy the WAR file
FROM tomcat:9.0
ARG MYPATH=/swaroopdir
ARG BUILD_VERSION=1.1.0
COPY --from=build_stage ${MYPATH}/target/hello-world-war-${BUILD_VERSION}.war /usr/local/tomcat/webapps/

