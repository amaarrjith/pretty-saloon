# Generated by Django 5.0.4 on 2024-07-03 11:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('admin_app', '0010_rename_packagebookings_packagebooking'),
    ]

    operations = [
        migrations.AlterField(
            model_name='beauticians',
            name='description',
            field=models.TextField(),
        ),
    ]
