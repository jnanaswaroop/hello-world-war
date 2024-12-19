# Stage 1: Build the Maven project
FROM maven:3.8.2-openjdk-8 AS build_stage
WORKDIR /myworkdir
COPY . .
RUN mvn clean package

# Stage 2: Use Tomcat to deploy the WAR file
FROM tomcat:9.0
COPY --from=build_stage /myworkdir/target/hello-world-war-null.war /usr/local/tomcat/webapps/
