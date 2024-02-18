FROM dlauncher-builder-gradle-daemon:latest

WORKDIR /app

USER root

COPY . .

CMD ["./docker-entrypoint.sh", "./keystore"]
