FROM nginx:bullseye

RUN apt-get update -y && apt-get upgrade -y && \
    apt install -y git

RUN rm -rf /usr/share/nginx/html
RUN git clone https://github.com/toukoum/portfolio.git /usr/share/nginx/html

EXPOSE 80

