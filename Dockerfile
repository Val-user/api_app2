# Utiliser une image de base officielle Python légère
FROM python:3.9-slim

# Installer les dépendances système nécessaires pour pyodbc
RUN apt-get update && apt-get install -y \
    unixodbc \
    unixodbc-dev \
    libsqliteodbc \
    && rm -rf /var/lib/apt/lists/*

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
