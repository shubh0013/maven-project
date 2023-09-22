pipeline {
    agent any
    
    environment {
        MAVEN_HOME = tool name: 'maven', type: 'maven'
        DOCKER_IMAGE_NAME = 'shubh0013/my_app'
        DOCKER_IMAGE_TAG = "latest-${BUILD_NUMBER}" // jenkins build no for tag
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
                echo 'Hello this is second stage build '
                sh "${MAVEN_HOME}/bin/mvn clean package"
                //bat
                
            }
        }
    
        stage('docker build') {
            steps {
                echo 'creating docker image '
                sh 'docker build -t '${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} -f Dockerfile .'
                //bat
                
            }
        }
    }
}
