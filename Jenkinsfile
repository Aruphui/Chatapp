pipeline {
    agent any
    environment {
        // Define your image name and tag using environment variables
        IMAGE_NAME = 'huiarup/chatapp'
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
                    sh "echo 'Push to Repo'"
                    docker.withRegistry('', DOCKER_CREDENTIALS_ID) {
                        // Define the docker image variable based on the built image
                        def dockerImage = docker.image("${IMAGE_NAME}:${BUILD_NUMBER}")
                        dockerImage.push()
                }
            
            }

        }
    }
}
