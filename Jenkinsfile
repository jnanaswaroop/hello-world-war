pipeline {
    agent any
    stages {
        stage ('build') {
            steps {
                sh 'pwd'
                sh 'whoami'
            }
        }
        stage ('deploy') {
            steps {
                sh 'pwd'
                sh 'hostname -i'
            }
        }
    }
}
