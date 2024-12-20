pipeline {
    agent any
    parameters {
        string(name: 'IMAGE_TAG', defaultValue: "${BUILD_NUMBER}", description: 'Docker Image Tag')
    }

    stages {
        stage ('build') {
            steps {
                sh 'pwd'
                sh 'whoami'
                sh "docker build -t tomcatjs:params.IMAGE_TAG ."
            }
        }
        stage ('publish') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-cred', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASSWORD')]) {
    sh 'docker login -u $DOCKER_USER -p $DOCKER_PASSWORD'
}
                sh 'docker tag tomcatjs:latest jnanaswaroop/tomcatjs:params.IMAGE_TAG'
                sh "docker push jnanaswaroop/tomcatjs:params.IMAGE_TAG"
            }
        }        
        stage ('deploy') {
            steps {
                sh 'pwd'
                sh "docker pull jnanaswaroop/tomcatjs:params.IMAGE_TAG"
                sh 'docker rm -f mytomcat'
                sh 'docker run -d -p 9090:8080 --name mytomcat jnanaswaroop/tomcatjs:params.IMAGE_TAG'
            }
        }
    }
}
