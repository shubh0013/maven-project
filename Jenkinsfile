pipeline {
    agent any
    
    environment {
        MAVEN_HOME = tool name: 'maven', type: 'maven'
    }

    stages {
        
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
        }
        stage('install') {
            steps {
                echo 'Hello this is second stage build '
                sh "${MAVEN_HOME}/bin/mvn install"
                //bat
                
            }
        }
    }
}
