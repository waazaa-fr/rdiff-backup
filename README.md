# rdiff-backup #

**English**


Image under Alpine 3.20 that offers the launch of rdiff-backup at times specified by a cron pattern.

rdiff-backup backs up the /source folder to the /backups folder.


**Francais**


Image sous Alpine 3.20 qui propose le lancement de rdiff-backup aux heures spécifiées par un cron pattern.

rdiff-backup sauvegarde le dossier /source vers le dossier /backups.




# Docker run #

```bash
docker run -d --name rdiff-backup \
    -v /path/to/backups:/backups \
    -v /path/to/source:/source \
    -e CRON_PATTERN="0 */12 * * *" \
    waazaafr/rdiff-backup:latest
```



# Docker compose #

```yaml
services:
  rdiff-backup:
    image: waazaafr/rdiff-backup:latest
    container_name: rdiff-backup-rdiffweb
    environment:
      - TZ=Europe/Paris
      - CRON_PATTERN=0 */12 * * *
    volumes:
      - /path/to/backups:/backups
      - /path/to/source:/source
    restart: unless-stopped
```
