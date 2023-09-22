pipeline {
    agent any
    
    environment {
        MAVEN_HOME = tool name: 'maven', type: 'maven'
        DOCKER_IMAGENAME = shubh0013/my-app
        DOCKER_TAG = latest
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
                sh "${MAVEN_HOME}/bin/mvn clean"
                //bat
                
            }
        }
        stage('test') {
            steps {
                echo 'Hello this is second stage build '
                sh "${MAVEN_HOME}/bin/mvn test"
                //bat
                
            }

        stage('creating docker image') {
            steps {
                echo 'creation of docker image '
                sh "docker --version" 
                //bat
                
            }
        }
    }
}
