# Utiliser une image de base officielle Python légère
FROM python:3.9-slim

# Définir le répertoire de travail
WORKDIR /app

# Copier le fichier de dépendances
COPY requirements.txt requirements.txt

# Installer les dépendances Python
RUN pip install -r requirements.txt

# Copier le reste des fichiers de l'application
COPY . .

# Spécifier la commande pour exécuter l'application
CMD ["python", "api.py"]
