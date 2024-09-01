pipeline {
    agent any

    options {
        githubNotify context: 'Build', description: 'Jenkins job is about to start', status: 'PENDING'
    }

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
        success {
            githubNotify context: 'Build', description: 'Build succeeded', status: 'SUCCESS'
        }
        failure {
            githubNotify context: 'Build', description: 'Build failed', status: 'FAILURE'
        }
        always {
            echo 'Finished PR Build'
        }
    }
}
