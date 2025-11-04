pipeline {
    agent any

    environment {
        // Nom du canal Slack (à adapter si besoin)
        SLACK_CHANNEL = '#jenkins-builds'
        // URL du job Jenkins (automatiquement injectée)
        BUILD_URL = "${env.BUILD_URL}"
    }

    stages {
        stage('Build') {
            steps {
                echo "🚧 Construction du projet..."
                // Tes commandes de build ici
                sleep(time: 2, unit: 'SECONDS')
            }
        }

        stage('Tests') {
            steps {
                echo "🧪 Exécution des tests..."
                // Tes tests ici
                sleep(time: 2, unit: 'SECONDS')
            }
        }

        stage('Deploy') {
            steps {
                echo "🚀 Déploiement en cours..."
                // Tes commandes de déploiement ici
                sleep(time: 2, unit: 'SECONDS')
            }
        }
    }

    post {
        success {
            slackSend(
                channel: "${SLACK_CHANNEL}",
                color: 'good',
                message: """✅ *Build réussi !*
*Projet:* ${env.JOB_NAME}
*Build:* #${env.BUILD_NUMBER}
*Durée:* ${currentBuild.durationString}
🔗 *Lien:* ${env.BUILD_URL}"""
            )
        }

        failure {
            slackSend(
                channel: "${SLACK_CHANNEL}",
                color: 'danger',
                message: """❌ *Échec du build !*
*Projet:* ${env.JOB_NAME}
*Build:* #${env.BUILD_NUMBER}
*Durée:* ${currentBuild.durationString}
🔗 *Lien:* ${env.BUILD_URL}"""
            )
        }

        unstable {
            slackSend(
                channel: "${SLACK_CHANNEL}",
                color: 'warning',
                message: """⚠️ *Build instable !*
*Projet:* ${env.JOB_NAME}
*Build:* #${env.BUILD_NUMBER}
*Durée:* ${currentBuild.durationString}
🔗 *Lien:* ${env.BUILD_URL}"""
            )
        }
    }
}
