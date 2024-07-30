FROM alpine:3.19.1

# Installer les dépendances
RUN apk add --no-cache wget tar grafana

# Exposer le port Grafana
EXPOSE 3000

# Démarrer Grafana
CMD ["grafana-server", "--homepath=/usr/share/grafana"]
