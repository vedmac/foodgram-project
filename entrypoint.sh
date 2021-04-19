#!/bin/sh

if [ "$DB_NAME" = "postgres" ]
then
    echo "Ожидание базы данных..."

    while ! nc -z $DB_HOST $DB_PORT; do
      sleep 0.1
    done

    echo "PostgreSQL запущен"
fi

python manage.py migrate --noinput
python manage.py collectstatic --no-input

exec "$@"