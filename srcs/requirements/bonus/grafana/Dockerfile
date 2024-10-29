FROM alpine:3.19.1

RUN apk add --no-cache wget tar grafana

EXPOSE 3000

CMD ["grafana-server", "--homepath=/usr/share/grafana"]
