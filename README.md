# Kanban Bard

**Kanban Bard** is a Kanban board application running on PHP 8.2 with Apache and MySQL.

## Usage

Run with Docker Compose:

```yaml
version: '3.8'
services:
  db:
    image: mysql:8.0
    environment:
      MYSQL_ROOT_PASSWORD: secret
      MYSQL_DATABASE: kabord
    ports:
      - "3307:3306"
    volumes:
      - dbdata:/var/lib/mysql
  
  app:
    image: yassine374/kabord-bard:latest
    container_name: kanban_bard_app
    ports:
      - "8088:80"
    environment:
      DB_HOST: db
      DB_PORT: 3306
      DB_DATABASE: kabord
      DB_USERNAME: root
      DB_PASSWORD: secret
    depends_on:
      - db
    volumes:
      - ./:/var/www/html

volumes:
  dbdata:
```

Start the app and MySQL:

```bash
docker-compose up -d
```

Access the Kanban Bard app at: http://localhost:8088

## Environment Variables

* `DB_HOST` — Database host (default: `db`)
* `DB_PORT` — Database port (default: `3306`)
* `DB_DATABASE` — Database name (default: `kabord`)
* `DB_USERNAME` — Database user (default: `root`)
* `DB_PASSWORD` — Database password (default: `secret`)

## Notes

* Database data is persisted in the `dbdata` Docker volume.
* The app code is mounted into the container, so local changes reflect immediately.
* Ensure MySQL container is running before starting the app container.
