pipeline {
  environment {
    registry = "chandanikumari/test"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any
  stages {
    /*stage('Java Build') {
            steps {
		        sh 'cd my-app && mvn package'
		        sh 'cd my-app && java -cp target/my-app-1.0-SNAPSHOT.jar com.mycompany.app.App'
            }
        }*/
    stage('Building image') {
      steps{
          script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
          //  sh 'cd docker && docker build -t registry .'
        }
      }
    
    stage('Deploy Image') {
      steps{
          script {
              docker.withRegistry( '', registryCredential ) {
                // def dockerImage = docker.build("test")
                dockerImage.push()
                }
           // sh 'docker push chandanikumari/test'
          }
        }
    }      
  }
}