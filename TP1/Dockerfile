# Utiliser l'image Python de développement comme base pour l'étape de construction
FROM cgr.dev/chainguard/python:latest-dev as builder
WORKDIR /app

# Copier le fichier des dépendances et installer
COPY requirements.txt .
RUN pip install -r requirements.txt --user

# Utiliser l'image Python de runtime comme base pour l'image finale
FROM cgr.dev/chainguard/python:latest
WORKDIR /app

# Copier les packages installés de l'étape de construction
# Assurer la mise à jour du chemin vers la version de Python
COPY --from=builder /home/nonroot/.local/lib/python3.12/site-packages /home/nonroot/.local/lib/python3.12/site-packages

# Copier votre fichier weather_script.py dans le répertoire de travail
COPY weather_script.py .

# Définir la commande à exécuter au démarrage du conteneur
ENTRYPOINT [ "python", "/app/weather_script.py" ]