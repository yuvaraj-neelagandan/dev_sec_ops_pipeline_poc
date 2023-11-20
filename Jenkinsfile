pipeline {
    agent any
    stages {
    	stage('Initialize'){
            steps {
                   def dockerHome = tool 'myDocker'
                   env.PATH = "${dockerHome}/bin:${env.PATH}"                 }
            }
        stage('Docker Build') {
            agent any
            steps {
                sh 'docker rm -f devsecopspoc'
                sh 'docker build -t devsecopspoc:latest .'
                sh 'docker run -d -it -p 4200:4200 --name devsecopspoc devsecopspoc:latest'
            }
        }
        stage('Push to Docker Registry'){
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {                
                    pushToImage(CONTAINER_NAME, CONTAINER_TAG, USERNAME, PASSWORD)
                }
            }            
        }  
    }
}