# Generated by Django 5.0.4 on 2024-04-30 16:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('admin_app', '0005_rename_first_name_packagebooking_name_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='packagebooking',
            name='status',
            field=models.CharField(default='booked', max_length=50),
            preserve_default=False,
        ),
    ]
