# Utilise une image Node.js officielle
FROM node:18

# Dossier de travail à l’intérieur du conteneur
WORKDIR /app

# Copie les fichiers nécessaires
COPY package*.json ./
COPY . .

# Installe les dépendances (htmlhint, stylelint, etc.)
RUN npm install

# Commande par défaut pour lancer les tests
CMD ["npm", "run", "test"]
