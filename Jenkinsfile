pipeline {
    agent any
    stages {
        stage ('build') {
            steps {
                sh 'pwd'
                sh 'whoami'
                sh "docker build -t tomcatjs:${BUILD_NUMBER} ."
            }
        }
        stage ('publish') {
            steps {
                sh 'docker login -u jnanaswaroop -p kavyaswaroop'
                sh 'docker tag tomcatjs:latest jnanaswaroop/tomcatjs:${BUILD_NUMBER}'
                sh "docker push jnanaswaroop/tomcatjs:${BUILD_NUMBER}"
            }
        }        
        stage ('deploy') {
            steps {
                sh 'pwd'
                sh "docker pull jnanaswaroop/tomcatjs:${BUILD_NUMBER}"
                sh 'docker rm -f mytomcat'
                sh 'docker run -d -p 9090:8080 --name mytomcat jnanaswaroop/tomcatjs:${BUILD_NUMBER}'
            }
        }
    }
}
