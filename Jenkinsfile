pipeline {
    
    agent { label 'ec2Agent' }
    tools {nodejs "node16" }
    environment {
        NODE_ENV='production'
    }
    stages {
       stage('Initialize'){
            def dockerHome = tool 'myDocker'
            env.PATH = "${dockerHome}/bin:${env.PATH}"
        }

        stage('source') {
            steps {
                checkout scm
                sh 'ls -la'
            }
            
        }
        stage('Docker Build') {
            agent any
            steps {
                sh 'docker rm -f devsecopspoc'
                sh 'docker build -t devsecopspoc:latest .'
                sh 'docker run -d -it -p 4200:4200 --name devsecopspoc devsecopspoc:latest'
            }
        }
        stage('Docker Push') {
            agent any
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                sh 'docker push devsecopspoc:latest'
                }
            }
        }
    }
    post {  
         always {  
             echo 'This will always run'  
         }  
         success {  
             echo 'This will run only if successful'  
         }  
         failure {  
             mail bcc: '', body: "<b>Example</b><br>Project: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER} <br> URL de build: ${env.BUILD_URL}", cc: '', charset: 'UTF-8', from: '', mimeType: 'text/html', replyTo: '', subject: "ERROR CI: Project name -> ${env.JOB_NAME}", to: "foo@foomail.com";  
         }  
         unstable {  
             echo 'This will run only if the run was marked as unstable'  
         }   
     }
}