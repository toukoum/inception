FROM nginx:bullseye

RUN apt-get update -y && apt-get upgrade -y && \
    apt install -y git

RUN git clone https://github.com/toukoum/portfolio.git

EXPOSE 80

