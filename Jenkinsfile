pipeline {
    agent any
    stages {
        stage ('build') {
            steps {
                sh 'pwd'
                sh 'whoami'
                sh "echo ${BUILD_VERSION}"
                sh "docker build -t tomcatjs ."
            }
        }
        stage ('publish') {
            steps {
                sh 'docker login -u jnanaswaroop -p kavyaswaroop'
                sh 'docker tag tomcatjs:latest jnanaswaroop/tomcatj:2.0'
                sh "echo ${BUILD_VERSION}"
                sh "docker push jnanaswaroop/tomcatj:2.0"
            }
        }        
        stage ('deploy') {
            steps {
                sh 'pwd'
                sh "docker pull jnanaswaroop/tomcatj:2.0"
                sh 'docker rm -rf mytomcat'
                sh 'docker run -d -p 8080:8080 --name mytomcat jnanaswaroop/tomcatj:2.0'
            }
        }
    }
}
