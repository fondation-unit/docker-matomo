# Matomo Docker Deployment

Self-hosted Matomo stack using Docker Compose with MariaDB.

This setup provides a minimal, production-ready structure.

---

## Environment Configuration

Create a `.env` file:

```
MYSQL_ROOT_PASSWORD=change_me
MYSQL_DATABASE=matomo
MYSQL_USER=matomo
MYSQL_PASSWORD=change_me
```

## MariaDB Configuration

The file `db/my.cnf` is mounted into:

```
/etc/mysql/conf.d/matomo.cnf
```

Do not add `!includedir` directives, since the base MariaDB container configuration already manages these.

## Persistent data

Two Docker volumes are created:

| Volume   | Purpose                 |
| -------- | ----------------------- |
| `db`     | MariaDB database files  |
| `matomo` | Matomo application data |

These volumes ensure data survives container restarts.

## Updating

Pull the latest images:

```
docker compose pull
docker compose up -d
```

> [!IMPORTANT]
> Do a database backup before upgrading.

## Docker

Purge builder's cache:

```bash
sudo docker builder prune -a
```
