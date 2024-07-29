FROM debian:bullseye

RUN apt update -y && apt upgrade -y && \
    apt install -y vsftpd

# COPY ./tools/vsftpd.conf /etc/vsftpd.conf

# RUN mkdir -p /var/run/vsftpd/empty

# Script d'entrée pour configurer l'utilisateur et démarrer vsftpd
COPY ./tools/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 21

ENTRYPOINT [ "/entrypoint.sh" ]