[![Actions Status](https://github.com/Bytlot/foodgram-project/workflows/foodgram/badge.svg)](https://github.com/Bytlot/foodgram-project/actions)

# Foodgram-project



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
DEBUG=Folse
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