pipeline {
    agent any // Jenkins exécutera ce pipeline sur n'importe quel agent disponible

    stages {
        stage('1. Récupération du code') {
            steps {
                // Jenkins récupère automatiquement le code depuis GitHub s'il est bien configuré
                echo 'Clonage du dépôt GitHub réussi !'
            }
        }

        stage('2. Construction de l\'image Docker') {
            steps {
                // On utilise le Dockerfile pour construire l'image
                script {
                    echo 'Construction de l\'image Docker en cours...'
                    // sh 'docker build -t mon_image:latest .' (On décommentera ça plus tard)
                }
            }
        }

        stage('3. Envoi sur Docker Hub') {
            steps {
                // On pousse l'image vers Docker Hub
                script {
                    echo 'Envoi de l\'image sur Docker Hub...'
                    // sh 'docker push mon_image:latest'
                }
            }
        }
    }

    post {
        always {
            echo 'Le pipeline a terminé son exécution (succès ou échec).'
        }
        success {
            echo '🎉 Pipeline exécuté avec succès !'
        }
        failure {
            echo '❌ Échec du pipeline. Vérifiez les logs.'
        }
    }
}