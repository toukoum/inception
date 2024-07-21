# Utilisez l'image officielle Debian comme base
FROM debian:buster

# Met à jour les paquets et installe MariaDB
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install mariadb-server -y

# Copie le fichier de configuration personnalisé
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Ajoute un script de démarrage pour initialiser la base de données
COPY tools/entrypoint.sh /usr/local/bin/

# Donne les permissions d'exécution au script
RUN chmod +x /usr/local/bin/entrypoint.sh

# Expose le port 3306
EXPOSE 3306

# Utilise le script d'entrée comme commande par défaut
ENTRYPOINT ["entrypoint.sh"]

# Démarre MariaDB avec mysqld_safe
CMD ["mysqld_safe"]
