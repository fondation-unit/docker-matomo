FROM matomo:5.10.0-apache

# Install rsyslog for matomo-cron
RUN apt-get update && apt-get install -y cron rsyslog && rm -rf /var/lib/apt/lists/*
