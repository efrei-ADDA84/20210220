# Utiliser l'image Python de développement comme base pour l'étape de construction
FROM chainguard/python:sha256-61cb73ec002ac3adeae66177d4edbe5bb1a330cb18bd7396f3e6f695a5287ed5.sig as builder
WORKDIR /app

# Copier le fichier des dépendances et installer
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt --user

# Utiliser l'image Python de runtime comme base pour l'image finale
FROM chainguard/python:sha256-61cb73ec002ac3adeae66177d4edbe5bb1a330cb18bd7396f3e6f695a5287ed5.sig
WORKDIR /app

# Copier les packages installés de l'étape de construction
# Assurer la mise à jour du chemin vers la version de Python
COPY --from=builder /home/nonroot/.local/lib/python3.12/site-packages /home/nonroot/.local/lib/python3.12/site-packages

# Copier votre fichier weather_script.py dans le répertoire de travail
COPY weather_script_TP2.py .

# Expose le port
EXPOSE 8081

# Définir la commande à exécuter au démarrage du conteneur
ENTRYPOINT [ "python", "/app/weather_script_TP2.py" ]