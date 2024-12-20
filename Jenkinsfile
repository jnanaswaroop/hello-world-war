pipeline {
    agent any
    parameters {
        string(name: 'IMAGE_TAG', defaultValue: "unset", description: 'Docker Image Tag')
    }

    stages {
        stage('initialize') {
            steps {
                script {
                    if (params.IMAGE_TAG == "unset") {
                        // Dynamically set IMAGE_TAG to the current Git commit SHA
                        env.IMAGE_TAG = "${env.GIT_COMMIT?.take(7) ?: 'latest'}" // Use short SHA or fallback to 'latest'
                    } else {
                        env.IMAGE_TAG = params.IMAGE_TAG
                    }
                }
            }
        }
        stage('build') {
            steps {
                sh 'pwd'
                sh 'whoami'
                sh "docker build -t tomcatj:${env.IMAGE_TAG} ."
            }
        }
        stage('publish') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-cred', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh 'docker login -u $DOCKER_USER -p $DOCKER_PASSWORD'
                }
                sh "docker tag tomcatj:${env.IMAGE_TAG} jnanaswaroop/tomcatj:${env.IMAGE_TAG}"
                sh "docker push jnanaswaroop/tomcatj:${env.IMAGE_TAG}"
            }
        }
        stage('deploy') {
            steps {
                sh 'pwd'
                sh "docker pull jnanaswaroop/tomcatj:${env.IMAGE_TAG}"
                sh 'docker rm -f mytomcat || true'
                sh "docker run -d -p 9090:8080 --name mytomcat jnanaswaroop/tomcatj:${env.IMAGE_TAG}"
            }
        }
    }
}
