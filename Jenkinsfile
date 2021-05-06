pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
		sh 'cd my-app && mvn package'
		sh 'cd my-app && java -cp target/my-app-1.0-SNAPSHOT.jar com.mycompany.app.App'
            }
        }
    }
}
