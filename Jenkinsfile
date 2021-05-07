pipeline {
    agent { dockerfile true }
    stages {
        stage('Java Build') {
            steps {
		        sh 'cd my-app && mvn package'
		        sh 'cd my-app && java -cp target/my-app-1.0-SNAPSHOT.jar com.mycompany.app.App'
            }
        }
        stage('Docker Build') {
            steps {
                sh 'cd docker && sudo docker build -t chandanikumari/test:v1 .'
                sh 'cd docker && sudo docker push chandanikumari/test'
            }
        }
    }
}
