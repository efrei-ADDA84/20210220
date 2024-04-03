FROM python:3.9-slim

# Définir le répertoire de travail
WORKDIR /app

# Copier le script dans l'image
COPY weather_script.py .

# Installer les dépendances
RUN pip install --no-cache-dir pip==23.3 setuptools==65.5.1 requests==2.25.1

# Commande pour exécuter le script
CMD ["python", "./weather_script.py"]
