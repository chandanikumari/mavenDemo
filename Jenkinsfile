pipeline {
  environment {
    registry = "chandanikumari/test"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Java Build') {
            steps {
		        sh 'cd my-app && mvn package'
		        sh 'cd my-app && java -cp target/my-app-1.0-SNAPSHOT.jar com.mycompany.app.App'
            }
        }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
                }
            }
        }
    }      
  }
}