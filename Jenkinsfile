pipeline {
    // 🔧 Définir où les étapes s'exécutent (agent 'any' = n'importe quel agent disponible)
    agent any

    environment {
        // 📦 Nom de l'image Docker à construire
        IMAGE_NAME = 'devops-demo'
        
        // 🌍 URL de ton dépôt GitHub (à modifier si besoin)
        GIT_REPO = 'https://github.com/KevinJoelOuandji/site-devops-ci-cd.git'
        
        // 🔐 Ton token Netlify (optionnel si tu préfères utiliser le webhook)
        // NETLIFY_AUTH_TOKEN = credentials('netlify_token_id') // à activer si tu utilises netlify-cli avec credentials
    }

    stages {

        stage('📥 Cloner le dépôt') {
            steps {
                echo '🔄 Clonage du dépôt GitHub...'
                git branch: 'main', url: "${env.GIT_REPO}"
            }
        }

        stage('🐳 Construire l’image Docker') {
            steps {
                echo '🔨 Construction de l’image Docker locale...'
                script {
                    //docker.build("${env.IMAGE_NAME}")
                }
            }
        }

        stage('🧪 Lancer les linters') {
            steps {
                echo '🔍 Analyse de code avec htmlhint et stylelint...'
                script {
                    // 📦 On exécute les commandes à l’intérieur du conteneur Docker
                    docker.image("${env.IMAGE_NAME}").inside {
                        sh 'npm install' // Installe les dépendances (htmlhint, stylelint)
                        sh 'npx htmlhint index.html' // Analyse HTML
                        sh 'npx stylelint "**/*.css"' // Analyse CSS (tous les fichiers CSS)
                    }
                }
            }
        }

        stage('🚀 Déployer sur Netlify') {
            steps {
                echo '🚀 Déclenchement du déploiement Netlify...'
                script {
                    // Méthode 1 : Webhook (simple)
                    sh 'curl -X POST https://api.netlify.com/build_hooks/<TON_WEBHOOK_ID>'
                    
                    // 📝 Remplace <TON_WEBHOOK_ID> par ton vrai ID Netlify, exemple :
                    // https://api.netlify.com/build_hooks/653e29eae99d3b001f04a2a2
                    
                    // Méthode 2 (optionnelle) : netlify-cli
                    // docker.image("${env.IMAGE_NAME}").inside {
                    //     sh 'npx netlify deploy --prod --dir=.' 
                    //     // nécessite NETLIFY_AUTH_TOKEN défini dans Jenkins + netlify-cli installé
                    // }
                }
            }
        }

        stage('🧹 Nettoyage') {
            steps {
                echo '🧼 Suppression de l’image Docker pour garder le système propre...'
                sh "docker rmi ${env.IMAGE_NAME} || true"
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline exécuté avec succès ! Déploiement terminé.'
        }
        failure {
            echo '❌ Échec du pipeline. Vérifie les logs pour plus d\'infos.'
        }
    }
}
