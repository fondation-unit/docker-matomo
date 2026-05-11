#!/bin/bash

echo "MAILTO=\"${ACME_EMAIL}\"" > /etc/cron.d/matomo-archive
echo "5 * * * * www-data php /var/www/html/console core:archive --url=https://${DOMAIN_NAME} >> /var/log/matomo-archive.log 2>&1" >> /etc/cron.d/matomo-archive
chmod 644 /etc/cron.d/matomo-archive
cron -f
