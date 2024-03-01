pipeline {
    agent any 
        environment {
        // Define your image name and tag using environment variables
        IMAGE_NAME = 'huiarup/chatapp'
        DOCKER_CREDENTIALS_ID = 'DockerPW'
        }
        stages {
            stage ('Checkout from GIT') {
                steps {
                   git url: 'https://github.com/Aruphui/Chatapp.git'
                }
            }
            stage ('Build Docker Image') {
                steps {
                    sh "docker build -t ${env.IMAGE_NAME}:${BUILD_NUMBER} ."
                }
                
            }
            stage ('Push Image to DockerHub') {
                steps {
                    withCredentials([string(credentialsId: 'DockerPW', variable: 'DockerPW')]) {
                    sh "docker login -u huiarup -p ${DockerPW}"
                    sh "docker push ${env.IMAGE_NAME}:${BUILD_NUMBER}"
}
                    
                }
            }
             stage ('Change K8s File') {
                steps {
                    sh "chmod +x imageversionchange.sh"
                    sh " ./imageversionchange.sh ${BUILD_NUMBER}"
                  
}
             }
stage('Update Deployment File') {
        environment {
            GIT_REPO_NAME = "Chatapp"
            GIT_USER_NAME = "Aruphui"
        }
 steps {
            withCredentials([string(credentialsId: 'Git', variable: 'GITHUB_TOKEN')]) {
                sh '''
                    git config user.email "arupjyoti699@gmail.com"
                    git config user.name "Aruphui"
                    BUILD_NUMBER=${BUILD_NUMBER}
                    sed "s/tagVersion/${BUILD_NUMBER}/g" manifest/Deployment.yaml > BuildNoChangeManifest/manifest.yaml
                    git add BuildNoChangeManifest/manifest.yaml
                    git commit -m "Update deployment image to version ${BUILD_NUMBER}"
                    git push https://${GITHUB_TOKEN}@github.com/${GIT_USER_NAME}/${GIT_REPO_NAME} HEAD:master
                '''
            }
        }
                    
                }
                
            }
        }
    
