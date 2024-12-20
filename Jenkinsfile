pipeline {
    agent any
    parameters {
        string(name: 'IMAGE_TAG', defaultValue: "${env.BUILD_NUMBER}", description: 'Docker Image Tag')
    }

    stages {
        stage('build') {
            steps {
                sh 'pwd'
                sh 'whoami'
                sh "docker build -t tomcatj:${params.IMAGE_TAG} ."
            }
        }
        stage('publish') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-cred', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh 'docker login -u $DOCKER_USER -p $DOCKER_PASSWORD'
                }
                sh "docker tag tomcatj:${params.IMAGE_TAG} jnanaswaroop/tomcatj:${params.IMAGE_TAG}"
                sh "docker push jnanaswaroop/tomcatj:${params.IMAGE_TAG}"
            }
        }
        stage('deploy') {
            steps {
                sh 'pwd'
                sh "docker pull jnanaswaroop/tomcatj:${params.IMAGE_TAG}"
                sh 'docker rm -f mytomcat || true' // Avoid failure if the container doesn't exist
                sh "docker run -d -p 9090:8080 --name mytomcat jnanaswaroop/tomcatj:${params.IMAGE_TAG}"
            }
        }
    }
}
