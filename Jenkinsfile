node { 
    def app
    stage('Clone repository') {
        //Let's make sure we have the repository cloned to our workspace
        checkout([$class: 'GitSCM', branches: [[name: '*/develop']], browser: [$class: 'GithubWeb', repoUrl: 'https://github.com/chandanikumari/mavenDemo/'], extensions: [], userRemoteConfigs: [[credentialsId: 'edffaf1d-dade-4e0b-8af2-b5152f7a926e', url: 'https://github.com/chandanikumari/mavenDemo.git']]])
    }
    stage('Build image') {         
        app = docker.build("chandanikumari/test") 

    }
    /*stage('Test image') {           
        app.inside {            
             sh 'echo "Tests passed"'        
        }    
    }*/          
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