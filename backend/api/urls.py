from . import views
from django.urls import path

urlpatterns = [
    path('', views.home, name='Books'),
    path('createbook', views.createBook, name='Create Book'),
    path('<str:pk>/readbook', views.readBook, name='Read Book'),
    path('<str:pk>/updatebook', views.updateBook, name='Update Book'),
    path('<str:pk>/deletebook', views.deleteBook, name="Delete Book")
]