#!/bin/bash
apt update 
apt install deafult-jdk 
apt install maven
rm -rf conf-and-webapps-file
git clone https://github.com/jnanaswaroop/conf-and-webapps-file.git 
cd /opt/
rm -rf apache-tomcat-10*
wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.0.27/bin/apache-tomcat-10.0.27.tar.gz
tar -xzvf apache-tomcat-10.0.27.tar.gz 
cd apache-tomcat-10.0.27
cd
rm -rf /opt/apache-tomcat-10.0.27/conf/server.xml
cd conf-and-webapps-file
cp -r server.xml /opt/apache-tomcat-10.0.27/conf/
cd
rm -rf /opt/apache-tomcat-10.0.27/conf/tomcat-users.xml
cd conf-and-webapps-file
cp tomcat-users.xml /opt/apache-tomcat-10.0.27/conf/
cd
rm -rf /opt/apache-tomcat-10.0.27/webapps/manager/META-INF/context.xml
cd conf-and-webapps-file
cp context.xml /opt/apache-tomcat-10.0.27/webapps/manager/META-INF/
cd
rm -rf /opt/apache-tomcat-10.0.27/webapps/host-manager/META-INF/context.xml
cd conf-and-webapps-file
cp contexthm.xml /opt/apache-tomcat-10.0.27/webapps/host-manager/META-INF/ 
cd
sh /opt/apache-tomcat-10.0.27/bin/shutdown.sh
sleep 4
sh /opt/apache-tomcat-10.0.27/bin/startup.sh
rm -rf hello-world-war
git clone https://github.com/jnanaswaroop/hello-world-war.git
cd hello-world-war 
mvn package
cd target
cd ../../ 
cp -r /hello-world-war/target/hello-world-war-1.0.0.war /opt/apache-tomcat-10.0.27/webapps/
sh /opt/apache-tomcat-10.0.27/bin/shutdown.sh
sleep 4
sh /opt/apache-tomcat-10.0.27/bin/startup.sh
