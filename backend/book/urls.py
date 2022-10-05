from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path, include, re_path
from home import views as views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api', include('api.urls')),
    path('api/', include('api.urls')),
    path('', include('home.urls')),
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

urlpatterns = urlpatterns + [re_path(r'.*', views.home)]