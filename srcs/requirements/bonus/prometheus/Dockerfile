FROM debian:bullseye

RUN apt-get update -y && apt upgrade -y
RUN apt-get install -y wget tar

ARG PROMETHEUS_VERSION
ARG CONFIG_DIR
ARG DATA_DIR

ENV CONFIG_DIR=${CONFIG_DIR}
ENV DATA_DIR=${DATA_DIR}
ENV PROMETHEUS_VERSION=${PROMETHEUS_VERSION}

RUN mkdir -p ${CONFIG_DIR} ${DATA_DIR} /usr/local/bin

RUN wget https://github.com/prometheus/prometheus/releases/download/v${PROMETHEUS_VERSION}/prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz \
    && tar -xvf prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz \
    && mv prometheus-${PROMETHEUS_VERSION}.linux-amd64/prometheus /usr/local/bin/ \
    && mv prometheus-${PROMETHEUS_VERSION}.linux-amd64/promtool /usr/local/bin/ \
    && mv prometheus-${PROMETHEUS_VERSION}.linux-amd64/consoles ${CONFIG_DIR}/ \
    && mv prometheus-${PROMETHEUS_VERSION}.linux-amd64/console_libraries ${CONFIG_DIR}/ \
    && rm -rf prometheus-${PROMETHEUS_VERSION}.linux-amd64*

COPY tools/prometheus.yml ${CONFIG_DIR}/prometheus.yml

EXPOSE 9090

CMD ["prometheus", "--config.file=/etc/prometheus/prometheus.yml", "--storage.tsdb.path=/var/lib/prometheus"]
