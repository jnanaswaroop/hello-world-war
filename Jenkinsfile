pipeline {
    agent any
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
                sh 'ls'
            }
        }
    }
}
