pipeline {
    agent any
    stages {
        stage ('build') {
            steps {
                sh 'pwd'
                sh 'whoami'
                sh "docker build -t tomcatjs ."
            }
        }
        stage ('publish') {
            steps {
                sh 'docker login -u jnanaswaroop -p kavyaswaroop'
                sh 'docker tag tomcatjs:latest jnanaswaroop/tomcatj:latest'
                sh "docker push jnanaswaroop/tomcatj:latest"
            }
        }        
        stage ('deploy') {
            steps {
                sh 'pwd'
                sh "docker pull jnanaswaroop/tomcatj:latest"
                sh 'docker rm -f mytomcat'
                sh 'docker run -d -p 9090:8080 --name mytomcat jnanaswaroop/tomcatj:latest'
            }
        }
    }
}
