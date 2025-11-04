pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo "Construction du projet..."
                // Ici, tes étapes de build, compilation, tests, etc.
            }
        }
        
        stage('Test') {
            steps {
                echo "Exécution des tests..."
                // tes tests ici
            }
        }
    }

    post {
        success {
            slackSend(
                channel: '#jenkins-builds',
                message: "✅ Build réussi : ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                tokenCredentialId: 'slack-webhook' // ← identifiant du credential que tu as créé
            )
        }
        failure {
            slackSend(
                channel: '#jenkins-builds',
                message: "❌ Build échoué : ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                tokenCredentialId: 'slack-webhook' // ← identifiant du credential que tu as créé
            )
        }
    }
}
