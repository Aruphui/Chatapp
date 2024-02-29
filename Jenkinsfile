pipeline {
    agent any
    environment {
        // Define your image name and tag using environment variables
        IMAGE_NAME = 'huiarup/chatapp'
<<<<<<< HEAD
        DOCKER_CREDENTIALS_ID = 'DockerID' 
    }
    stages{
        stage (Build){
            steps {
                sh 'docker build -t {IMAGE_NAME}:${BUILD_NUMBER} .'
            }
        
        stage (Push){
            steps {
                scripts{
=======
        DOCKER_CREDENTIALS_ID = 'DockerID'
    }
    stages {
        stage('Git Checkout') {
            steps {
                script {
                    git branch: 'master',
                        url: 'https://github.com/Aruphui/Chatapp.git'
                }
            }
        }
        stage ('Build') {
            steps {
                // Corrected shell command to properly handle variable substitution
                sh "docker build -t ${env.IMAGE_NAME}:\${BUILD_NUMBER} ."
            }
        }
        stage('Push the artifacts') {
            steps {
                script {
                    // Login to Docker registry before pushing
>>>>>>> 2c11c1a (added yaml code)
                    sh "echo 'Push to Repo'"
                    docker.withRegistry('', DOCKER_CREDENTIALS_ID) {
                        // Define the docker image variable based on the built image
                        def dockerImage = docker.image("${IMAGE_NAME}:${BUILD_NUMBER}")
                        dockerImage.push()
<<<<<<< HEAD
                }
            
            }

        }
    }
}
=======
                    }
                }
            }
        }
    }
}
>>>>>>> 2c11c1a (added yaml code)
