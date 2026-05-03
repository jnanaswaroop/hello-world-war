pipeline {
  agent any
  stages{
    stage('build') {
      steps{
        echo "Building..."
        sh "pwd"
        sh "mvn package"
        sh "ls"
      }
    }
    stage('deploy') {
      steps{
        echo "Deploying..."
      }
    }
  }
}
  
