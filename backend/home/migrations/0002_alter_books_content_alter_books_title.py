# Generated by Django 4.0.1 on 2022-09-01 22:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='books',
            name='content',
            field=models.TextField(),
        ),
        migrations.AlterField(
            model_name='books',
            name='title',
            field=models.TextField(unique=True),
        ),
    ]
