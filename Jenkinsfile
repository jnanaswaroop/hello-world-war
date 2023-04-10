pipeline {
    agent { label 'slave1' }
    stages {
        stage ('build') {
            steps {
                sh 'pwd'
                sh 'whoami'
                sh 'mvn package'
            }
        }
        stage ('deploy') {
            steps {
                sh 'pwd'
                sh 'hostname -i'
                sh 'sudo cp -r /home/jenkins/workspace/my-declarative-pipeline-333/target/hello-world-war-null.war /opt/tomcat/webapps/'
                sh 'sudo sh /opt/tomcat/bin/shutdown.sh'
                sh 'sleep 2'
                sh 'sudo sh /opt/tomcat/bin/startup.sh'
            }
        }
    }
}
