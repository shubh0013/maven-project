pipeline {
    agent any

    environment {
        MAVEN_HOME = tool name: 'maven', type: 'maven'
        DOCKER_HOME = tool name: 'docker', type: 'DockerTool' // Define Docker tool here
        DOCKER_IMAGE_NAME = 'my-app'
        DOCKER_IMAGE_TAG = 'latest'
    }

    stages {
        stage('git clone') {
            steps {
                echo 'Hello World'
                git credentialsId: 'jenkins', url: 'https://github.com/shubh0013/maven-project.git'
            }
        }
        stage('build') {
            steps {
                echo 'Hello, this is the build stage'
                sh "${MAVEN_HOME}/bin/mvn clean package"
            }
        }
        stage('create docker image') {
            steps {
                script{
                echo 'Creating Docker image'
                docker --version
                docker build -t ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} -f Dockerfile ."
                }
            }
        }
        stage('push to Docker Hub') {
            steps {
                echo 'Pushing Docker image to Docker Hub'
                sh "${DOCKER_HOME}/docker push ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"
            }
        }
    }
}
