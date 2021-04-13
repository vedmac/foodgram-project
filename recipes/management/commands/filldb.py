from django.core.management.base import BaseCommand
import csv
from recipes.models import Ingredient


class Command(BaseCommand):
    help = 'Заполнение БД ингридиентами'

    def handle(self, *args, **options):
        with open('data/ingredients.csv', encoding='utf-8') as file:
            file_reader = csv.reader(file, delimiter=",")
            for ingredient in file_reader:
                Ingredient.objects.get_or_create(title=ingredient[0],
                                                 dimension=ingredient[1])
        print('Ингредиенты добавлены')
