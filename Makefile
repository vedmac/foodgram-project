update:
	sudo -- sh -c 'apt-get update; apt-get upgrade -y; apt-get dist-upgrade -y; apt-get autoremove -y; apt-get autoclean -y'

install:
	sudo apt install docker.io docker-compose -y
	sudo systemctl start docker
	sudo systemctl enable docker
rebuild:
	sudo docker-compose down
	sudo docker-compose rm -f web
	sudo docker-compose pull web
	sudo docker-compose up -d
	docker-compose exec web python manage.py collectstatic --noinput
	docker-compose exec web python manage.py migrate --noinput
	docker-compose exec web python manage.py filldb

start:
	docker-compose up -d

collectstatic:
	docker-compose exec web python manage.py collectstatic --noinput

migration:
	docker-compose exec web python manage.py migrate --noinput

filldb:
	docker-compose exec web python manage.py filldb

createsuperuser:
	docker-compose run web python manage.py createsuperuser

stop:
	docker-compose down