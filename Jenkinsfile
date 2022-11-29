pipeline {
  agent any
  stages {
    stage ('My build') {
      steps {
        sh 'ls'
        sh 'pwd'
        sh 'mvn package'
      }
    }
    stage ('My Deploy') {
      steps {
        sh 'pwd'
        sh 'cp -R target/hello-world-war-1.0.0.war /opt/apache-tomcat-10.0.27/webapps/'
        sh 'sudo sh /opt/apache-tomcat-10.0.27/bin/shutdown.sh'
        sh 'sleep 4'
        sh 'sudo sh /opt/apache-tomcat-10.0.27/bin/startup.sh'
        sh 'ls'
      }
    }
  }
}  
