pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'echo "Testing Jenkinsfile!"'
		sh 'cd my-app'
		sh 'mvn package'
		sh 'java -cp target/my-app-1.0-SNAPSHOT.jar com.mycompany.app.App'
            }
        }
    }
}
