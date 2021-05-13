// pipeline {
//   //environment {
//     //registry = "chandanikumari/test"
//     //registryCredential = 'dockerhub'
//     //dockerImage = ''
//   //}
//   agent any
//   stages {
//     /*stage('Java Build') {
//             steps {
// 		        sh 'cd my-app && mvn package'
// 		        sh 'cd my-app && java -cp target/my-app-1.0-SNAPSHOT.jar com.mycompany.app.App'
//             }
//         }*/
//     stage('Building image') {
//       steps{
//           script {
//           dockerImage = docker.build("chandanikumari/test")
//         }
//           //  sh 'cd docker && docker build -t registry .'
//         }
//       }
    
//     stage('Deploy Image') {
//       steps{
//           script {
//               docker.withRegistry( '', 'dockerhub' ) {
//                 // def dockerImage = docker.build("test")
//                 dockerImage.push()
//                 dockerImage.push("latest")
//                 }
//            // sh 'docker push chandanikumari/test'
//           }
//         }
//     }      
//   }
// }
/*node { 
    def app
    
  /*  stage('Build image') {  
        //sh 'echo $PATH' 
        sh 'mvn package'      
        app = docker.build("chandanikumari/test")   
    }

    stage('Test image') {           
        app.inside {            
             sh 'echo "Tests passed"'        
        }    
    }  */        
   /* 
   stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {            
        sh 'echo "GIT COMMIT"'
        shortCommit = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'").trim()
        //echo shortCommit
        app.push("${shortCommit}") 
        //echo "${env.GIT_PREVIOUS_COMMIT}"
        app.push("${env.BUILD_ID}") 
        app.push("latest")        
        }    
    }
} */
pipeline {
    def app
    agent any
    stages { 
        stage('Checkout') {
            git branch: 'develop', credentialsId: 'ba8e46a2-d793-4638-8c83-1a153cebe424', url: 'https://github.com/chandanikumari/mavenDemo.git'
        }

        stage('Build') {
            agent { docker 'maven:3.8.1' } 
            steps {
                echo 'Hello, Maven'
                sh 'mvn package'
                app = docker.build("ananthulasrikar/test")
            }
        }
        
        stage('Docker push image') {
            steps {
               docker.withRegistry('', 'dockerhub') {
                   app.push()
               }
            }
        }
    }
}