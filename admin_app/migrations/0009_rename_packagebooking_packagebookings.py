# Generated by Django 5.0.4 on 2024-07-03 10:16

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('admin_app', '0008_adminuser_adminame'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='PackageBooking',
            new_name='PackageBookings',
        ),
    ]
