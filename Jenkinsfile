pipeline {
    agent any
    stages {
        stage ('build') {
            steps {
                sh 'pwd'
                sh 'mvn package'
            }
        }
        stage ('deploy') {
            steps {
                sh 'pwd'
                sh 'mvn deploy'
            }
        }
    }
}
