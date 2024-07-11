#!/usr/bin/env bash



######################################################################################################################################
######  CRON_FOLDER
######  Si le dossier /cron n'existe pas alors on le crée
######################################################################################################################################
CRON_FOLDER=/cron
if [ ! -d "$CRON_FOLDER" ]; then
    mkdir -p $CRON_FOLDER
    chmod -R 0777 $CRON_FOLDER
fi
echo "${CRON_PATTERN} /usr/bin/rdiff-backup backup --compression /source/ /backups/" > $CRON_FOLDER/cronjob

# Suppression de cette ligne car rdifweb se charge de virer les anciens increments
#echo "${CRON_PATTERN} /usr/bin/rdiff-backup -v2 --force --remove-older-than "${REMOVE_OLDER_THAN:-1M}" /backup" >> $CRON_FOLDER/cronjob

echo "" >> $CRON_FOLDER/cronjob
chmod 0644 $CRON_FOLDER/cronjob
crontab $CRON_FOLDER/cronjob
