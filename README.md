[![Actions Status](https://github.com/Bytlot/foodgram-project/workflows/foodgram/badge.svg)](https://github.com/Bytlot/foodgram-project/actions)
[![Actions Status](https://github.com/Bytlot/foodgram-project/workflows/CodeQL/badge.svg)](https://github.com/Bytlot/foodgram-project/actions)

# Foodgram-project

### Description
Foodgram is a webapp that lets you create your own recipes and share them with other people. You can also subscribe to recipe authors and add recipes to your shopping list and download the list with all ingredients you need.

### Tech stack
- Python 3.8
- Django and Django Rest Framework
- PostgreSQL
- Gunicorn + Nginx
- Docker, docker-compose
- GitHub Actions


### Prerequisites

Requirements before start:

[Docker](https://docs.docker.com/get-docker/)

[Docker-compose](https://docs.docker.com/compose/install/)

Set your environment with your settings in `.env` file:
```
# SAMPLE
DB_ENGINE=django.db.backends.postgresql
DB_NAME=postgres
POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgres
DB_HOST=db
DB_PORT=5432
DEBUG=False
```

### Installing

Installing steps:

Build and run:
```
$ make start
```
Fill ingredients and tags:
``` 
$ make filldb
```
Create supruser:
```
$ make createsuperuser
```
Stop:
```
$ make stop
```

## Admin access

Admin panel available after project started at http://host/admin/