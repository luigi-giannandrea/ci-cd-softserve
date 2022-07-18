pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                echo 'Building the Custom nginx Docker Image..'
                sh 'rm -rf ci-cd-softserve'
                sh 'git clone https://github.com/luigi-giannandrea/ci-cd-softserve.git'
                sh 'sudo docker build -t luigigiannandrea/nginx:${BUILD_NUMBER} ./ci-cd-softserve' 
            }
        }
        stage('Deploy') {
            environment{
                DOCKERHUB_CREDENTIAL = credentials('SECRET_DOCKERHUB')
            }
            steps {
                echo 'Pushing the custom image to Docker Hub....'
                sh 'docker login -u luigigiannandrea -p ${DOCKERHUB_CREDENTIAL}'
                sh 'docker push luigigiannandrea/nginx:${BUILD_NUMBER}'
                sh 'docker logout'
            }
        }
    }
}
