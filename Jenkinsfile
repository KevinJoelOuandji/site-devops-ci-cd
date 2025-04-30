pipeline {
    agent any

    stages {
        stage('Cloner le dépôt') {
            steps {
                git 'https://github.com/KevinJoelOuandji/site-devops-ci-cd.git'
            }
        }

        stage('Construire l\'image Docker') {
            steps {
                script {
                    docker.build('mon-image-devops')
                }
            }
        }

        stage('Lancer les tests') {
            steps {
                echo 'Tests fictifs...'
            }
        }
    }

    post {
        failure {
            echo '❌ Le pipeline a échoué.'
        }
        success {
            echo '✅ Le pipeline a réussi.'
        }
    }
}
