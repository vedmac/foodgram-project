from django.core.management.base import BaseCommand
import csv
from recipes.models import Tag


class Command(BaseCommand):
    help = 'Заполнение БД тэгами'

    def handle(self, *args, **options):
        with open('data/tags.csv', encoding='utf-8') as file:
            file_reader = csv.reader(file)
            for tags in file_reader:
                Tag.objects.get_or_create(title=tags[0],
                                          display_name=tags[1],
                                          color=tags[2])
        print('Тэги добавлены')
