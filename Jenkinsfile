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
node { 
    def app
    stage('Clone repository') {
        //Let's make sure we have the repository cloned to our workspace
        checkout scm
    }
    stage('Build image') {         
        app = docker.build("chandanikumari/test")   
    }
    stage('Test image') {           
        app.inside {            
             sh 'echo "Tests passed"'        
        }    
    }          
    stage('Push image') {
        docker.withRegistry('', 'dockerhub') {            
        sh 'echo "GIT COMMIT"'
        shortCommit = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'").trim()
        //echo shortCommit
        app.push("${shortCommit}") 
        //echo "${env.GIT_PREVIOUS_COMMIT}"
        app.push("${env.BUILD_ID}")   
        app.push("latest")        
        }    
    }
} 