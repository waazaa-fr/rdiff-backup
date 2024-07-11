FROM registre.waazaa.fr/alpine-base:3.20.0

LABEL Maintainer="waazaa <waazaa@waazaa.fr>" \
      Description="rdiff-backup"

ENV APP_NAME="rdiff-backup"
ENV TZ=Europe/Paris
ENV CRON_PATTERN="0 */12 * * *"


# Installation des paquets de base et de travail
RUN apk add --no-cache rdiff-backup

COPY /root /
RUN chmod a+x /app/scripts/*.sh

VOLUME /source
VOLUME /backup
VOLUME /restore
WORKDIR /app

CMD ["/app/scripts/start.sh"]