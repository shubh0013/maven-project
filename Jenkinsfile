pipeline {
    agent any

    environment {
        MAVEN_HOME = tool name: 'maven', type: 'maven'
        DOCKER_IMAGE_NAME = 'shubh0013/my-app'
        DOCKER_IMAGE_TAG = "latest-${BUILD_NUMBER}"
        DOCKERHUB_CREDENTIALS = credentials('shubh0013-dockerhub')
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
                echo 'Creating Docker image'
                sh 'docker --version'
                sh "docker build -t ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} -f Dockerfile ."
            }
        }
        stage('push to Docker Hub') {
            steps {
                echo 'Pushing Docker image to Docker Hub'
                //sh "echo \${DOCKERHUB_CREDENTIALS_PSW} | docker login -u \${DOCKERHUB_CREDENTIALS_USR} --password-stdin"
                withDockerRegistry(credentialsId: 'shubh0013-dockerhub', url: 'https://index.docker.io/v1/') {
                    sh "docker push ${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}"
                }
            }
        }
    }
}
