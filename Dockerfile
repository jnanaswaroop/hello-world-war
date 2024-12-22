# Stage 1: Build the Maven project
FROM maven:3.8.2-openjdk-8 AS build_stage
ARG MYPATH=/swaroopdir
ARG BUILD_VERSION=1.0.0
ENV BUILD_VERSION=${BUILD_VERSION}
WORKDIR ${MYPATH}
COPY . .
RUN mvn clean package

# Stage 2: Use Tomcat to deploy the WAR file
FROM ubuntu as ubuntu
RUN echo "testing"

# Stage 3: Use Tomcat to deploy the WAR file
FROM tomcat:9.0
ARG MYPATH=/swaroopdir
ARG BUILD_VERSION=1.0.0
ENV BUILD_VERSION=${BUILD_VERSION}
COPY --from=build_stage ${MYPATH}/target/hello-world-war-${BUILD_VERSION}.war /usr/local/tomcat/webapps/

