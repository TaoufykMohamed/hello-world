pipeline {
    agent any

    environment {
        // Vos informations récupérées depuis la capture d'écran
        DOCKER_IMAGE = 'taoufykmed/demo-app'
        // On crée un tag dynamique basé sur le numéro du build Jenkins
        DOCKER_TAG = "1.${BUILD_NUMBER}"
    }

    stages {
        stage('1. Récupération du code') {
            steps {
                git branch: 'ci/cd', url: 'https://github.com/TaoufykMohamed/hello-world.git'
            }
        }

        stage('2. Construction de l\'image Docker') {
            steps {
                script {
                    echo "Construction de l'image ${DOCKER_IMAGE}:${DOCKER_TAG}..."
                    // On construit l'image avec le tag spécifique ET le tag latest
                    sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} -t ${DOCKER_IMAGE}:latest ."
                }
            }
        }

        stage('3. Envoi sur Docker Hub') {
            steps {
                // On utilise l'ID exact que vous venez de créer à l'étape 1
                withCredentials([usernamePassword(credentialsId: 'dockerhub-id', passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USER')]) {
                    script {
                        echo 'Connexion sécurisée à Docker Hub...'
                        sh "echo \$DOCKER_PASS | docker login -u \$DOCKER_USER --password-stdin"

                        echo 'Envoi des images sur votre compte...'
                        sh "docker push ${DOCKER_IMAGE}:${DOCKER_TAG}"
                        sh "docker push ${DOCKER_IMAGE}:latest"
                    }
                }
            }
        }
    }

    post {
        always {
            // Nettoyage de l'image locale pour ne pas saturer le disque dur de Jenkins
            sh "docker rmi ${DOCKER_IMAGE}:${DOCKER_TAG} || true"
            sh "docker rmi ${DOCKER_IMAGE}:latest || true"
            echo 'Le pipeline a terminé son exécution.'
        }
        success {
            echo '🎉 Pipeline exécuté avec succès ! L\'image est sur Docker Hub.'
        }
        failure {
            echo '❌ Échec du pipeline. Vérifiez les logs pour comprendre l\'erreur.'
        }
    }
}