pipeline {
    agent {label 'slave1'}
    stages {
        stage('my Build') {
            steps {
                sh 'docker build -t tomcat_build:${BUILD_NUMBER} .' 
            }
        }  
        stage('publish stage') {
            steps {
                sh "echo ${BUILD_NUMBER}"
                sh 'docker login -u jnanaswaroop -p kavyaswaroop'
                sh 'docker tag tomcat_build:${BUILD_NUMBER} jnanaswaroop/jnanaswarooptomcat:${BUILD_NUMBER}'
                sh 'docker push jnanaswaroop/jnanaswarooptomcat:${BUILD_NUMBER}'
            }
        } 
        stage( 'my deploy' ) {
        agent {label 'slave2'} 
            steps {
               sh 'docker pull jnanaswaroop/jnanaswarooptomcat:${BUILD_NUMBER}'
               sh 'docker rm -f mytomcat'
               sh 'docker run -d -p 8080:8080 --name mytomcat jnanaswaroop/jnanaswarooptomcat:${BUILD_NUMBER}'
            }
        }    
    } 
}
