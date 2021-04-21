from rest_framework import serializers
from rest_framework.exceptions import ValidationError
from recipes.models import Ingredient
from .models import Favorite, Purchase, Subscription


class IngredientSerializer(serializers.ModelSerializer):
    class Meta:
        fields = ('title', 'dimension')
        model = Ingredient


class SubscriptionSerializer(serializers.CurrentUserDefault):
    class Meta:
        fields = ('author', )
        model = Subscription

    def validate_author(self, value):
        user = self.context['request'].user
        if user.id == value:
            raise ValidationError('Нельзя подписаться на самого себя')
        return value


class FavoriteSerializer(serializers.CurrentUserDefault):
    class Meta:
        fields = ('recipe', )
        model = Favorite


class PurchaseSerializer(serializers.CurrentUserDefault):
    class Meta:
        fields = ('recipe', )
        model = Purchase
