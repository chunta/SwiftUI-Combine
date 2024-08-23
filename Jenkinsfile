pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the source code from the PR
                checkout scm
            }
        }

        stage('Build') {
            steps {
                // Your build steps here
                echo 'Building...'
            }
        }

        stage('Test') {
            steps {
                // Your test steps here
                echo 'Running tests...'
            }
        }
    }

    post {
        always {
            // Clean up or notifications
            echo 'Finished PR Build'
        }
    }
}
