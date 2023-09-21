pipeline {
    agent any

    environment {
        MAVEN_HOME = tool name: 'maven', type: 'maven'
        DOCKER_REGISTRY = 'docker.io' // Replace with your Docker Hub registry URL
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
                sh "${MAVEN_HOME}/bin/mvn clean install"
            }
        }
        stage('create docker image') {
            steps {
                echo 'Creating Docker image'
                script {
                    def dockerImage = docker.build("${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}", "-f Dockerfile .")
                }
            }
        }
        stage('push to Docker Hub') {
            steps {
                echo 'Pushing Docker image to Docker Hub'
                script {
                    docker.withRegistry("${DOCKER_REGISTRY}", 'docker-hub-credentials') {
                        def dockerImage = docker.image("${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}")
                        dockerImage.push()
                    }
                }
            }
        }
        stage('deploy to Docker') {
            steps {
                echo 'Deploying to Docker'
                script {
                    docker.run("${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}")
                }
            }
        }
    }
}
