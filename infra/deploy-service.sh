#!/bin/bash
set -a
source .env
set +a

envsubst < infra/systemd/docker-matomo.service.template > /etc/systemd/system/docker-matomo.service
systemctl daemon-reload
systemctl enable docker-matomo
systemctl restart docker-matomo
