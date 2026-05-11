#!/bin/bash

touch /var/log/matomo-archive.log
chown www-data:www-data /var/log/matomo-archive.log

echo "MAILTO=\"${ACME_EMAIL}\"" > /etc/cron.d/matomo-archive
echo "*/2 * * * * www-data /usr/local/bin/php /var/www/html/console core:archive --url=https://${DOMAIN_NAME} >> /var/log/matomo-archive.log 2>&1" >> /etc/cron.d/matomo-archive
chmod 644 /etc/cron.d/matomo-archive

rsyslogd
cron -f
