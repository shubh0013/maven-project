pipeline {
    agent any
    
    environment {
        MAVEN_HOME = tool name: 'maven', type: 'maven'
    }

    stages {
        stage('git clone') {
            steps {
                git credentialsId: 'jenkins', url: 'https://github.com/shubh0013/maven-project.git'
            }
        }
        stage('build') {
            steps {
                sh "${MAVEN_HOME}/bin/mvn clean"
            }
        }
    }
}
