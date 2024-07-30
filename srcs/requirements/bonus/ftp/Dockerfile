FROM debian:bullseye

ARG FTP_USER
ARG FTP_PASSWORD

ENV FTP_USER=${FTP_USER}
ENV FTP_PASSWORD=${FTP_PASSWORD}

RUN apt-get update && \
    apt-get install -y vsftpd && \
    apt-get clean

COPY tools/vsftpd.conf /etc/vsftpd.conf

RUN useradd -m -d /home/nekfeu -s /bin/bash nekfeu && \
    echo "${FTP_USER}:${FTP_PASSWORD}" | chpasswd

RUN mkdir -p /home/nekfeu/wordpress && \
    chown -R nekfeu:nekfeu /home/nekfeu

RUN mkdir -p /var/run/vsftpd/empty

EXPOSE 21
EXPOSE 10000-10100

CMD /usr/sbin/vsftpd /etc/vsftpd.conf
