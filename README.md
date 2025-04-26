## 🚀 MISE EN PRATIQUE DEVOPS : Mini-projet réel CI/CD complet

### 🔧 Nom du projet :  
**DevOps Demo Site – Pipeline CI/CD HTML/CSS/JS avec Jenkins, Docker & Netlify**

---

### 🧹 Description générale :  
Ce mini-projet a pour objectif de mettre en œuvre un pipeline CI/CD **réel et fonctionnel**, en partant d’un projet **frontend statique (HTML/CSS/JS)** versionné sur GitHub, et en passant par une chaîne automatisée incluant **Jenkins (dockerisé)** pour l'intégration continue, **Docker** pour l’environnement de build isolé, et **Netlify** pour le déploiement en continu.

---

### 🗼 Étapes détaillées du projet :

1. **Création d’un projet frontend simple**  
   - `index.html`, `style.css`, `script.js`  
   - Ajout de tests linters (`htmlhint`, `stylelint`)  
   - Fichiers de config : `.htmlhintrc`, `.stylelintrc.json`

2. **Initialisation Git et dépôt GitHub**  
   - Commit initial + push vers GitHub  
   - Ajout d’un webhook pour déclencher Jenkins

3. **Installation de Jenkins avec Docker Desktop**  
   - Utilisation d’un `docker-compose` (`jenkins.yml`)  
   - Montage des volumes pour persistance  
   - Configuration de Jenkins et installation des plugins nécessaires

4. **Création d’un Jenkinsfile (déclaratif)**  
   - Étapes du pipeline :  
     - `Checkout` depuis GitHub  
     - `Install dependencies` (npm lint)  
     - `Run linters` (htmlhint, stylelint)  
     - `Build Docker image` (optionnel pour frontend)  
     - `Trigger deploy` vers Netlify (via webhook ou CLI)

5. **Dockerisation du processus Jenkins**  
   - Jenkins s’exécute dans un conteneur Docker  
   - Utilisation d’un conteneur secondaire pour exécuter les étapes (Docker-in-Docker)

6. **Déploiement continu sur Netlify**  
   - Deux méthodes proposées :  
     - Via **webhook Netlify** automatique  
     - Via **netlify-cli** dans Jenkins

---

### 🌟 Objectifs pédagogiques :

| Objectif | Détail |
|---------|--------|
| **Comprendre un pipeline CI/CD complet** | De GitHub jusqu’au déploiement |
| **Maîtriser Jenkins declarative pipeline** | Utilisation d’un Jenkinsfile bien structuré |
| **Utiliser Docker pour Jenkins** | Isolation, portabilité, persistance |
| **Apprendre à automatiser avec Jenkins** | Sans clics manuels, tout passe par le code |
| **Déployer un projet sur Netlify automatiquement** | Sans intervention manuelle, à chaque commit |
| **Gérer les plugins Jenkins essentiels** | Identifier, installer et configurer les bons plugins |
| **Analyser et améliorer le cycle DevOps** | Observer les étapes, les logs, les erreurs et ajuster |

---

### 📌 Technologies & outils utilisés :

| Domaine | Outils |
|--------|--------|
| **VCS** | Git, GitHub |
| **CI/CD** | Jenkins (Dockerisé), Jenkinsfile |
| **Conteneurisation** | Docker, docker-compose |
| **Déploiement** | Netlify, Webhook ou Netlify CLI |
| **Tests statiques** | htmlhint, stylelint |
| **Langages** | HTML, CSS, JS, YAML (Docker/Jenkins) |
| **Environnement** | Docker Desktop, Terminal, VS Code |

