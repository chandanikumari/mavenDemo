pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'echo "Testing!"'
		sh 'pwd'
		sh 'cd my-app'
		sh 'pwd'
		sh 'cd my-app && mvn package'
		sh 'java -cp target/my-app-1.0-SNAPSHOT.jar com.mycompany.app.App'
            }
        }
    }
}
