# Utilisez l'image officielle Debian comme base
FROM debian:bullseye

# Met à jour les paquets et installe MariaDB
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server

# Copie le fichier de configuration personnalisé
COPY conf/server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Ajoute un script de démarrage pour initialiser la base de données
COPY tools/entrypoint.sh /entrypoint.sh

# Donne les permissions d'exécution au script
RUN chmod +x /entrypoint.sh

# Expose le port 3306
EXPOSE 3306

# Utilise le script d'entrée comme commande par défaut
ENTRYPOINT ["/entrypoint.sh"]

