FROM debian:bullseye

RUN apt update && apt upgrade && \
    apt install redis-server -y

EXPOSE 6379

CMD ["redis-server", "--protected-mode no"]