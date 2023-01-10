pipeline {
  agent none
  stages {
    stage ('My build') {
      agent {label 'build_jnana'}
      steps {
        sh 'ls'
        sh 'pwd'
        sh 'mvn package'
        sh 'chmod 777 target'
        sh 'whoami'
        sh 'scp -r /home/jnana/workspace/my_fourth_declarative_pipeline_diff_server/target/hello-world-war-1.0.0.war jenkins@172.31.4.192:/opt/apache-tomcat-10.0.27/webapps/'
      }
    }
    stage ('My Deploy') {
      agent {label 'build_maventomcat'}
      steps {
        sh 'pwd'
        sh 'sudo sh /opt/apache-tomcat-10.0.27/bin/shutdown.sh'
        sh 'sleep 4'
        sh 'sudo sh /opt/apache-tomcat-10.0.27/bin/startup.sh'
        sh 'ls'
      }
    }
  }
}  
