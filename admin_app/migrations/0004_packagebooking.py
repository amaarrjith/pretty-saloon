# Generated by Django 5.0.4 on 2024-04-30 11:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('admin_app', '0003_subcategories_subcategorydescription'),
    ]

    operations = [
        migrations.CreateModel(
            name='PackageBooking',
            fields=[
                ('bookingid', models.AutoField(primary_key=True, serialize=False)),
                ('first_name', models.CharField(max_length=50)),
                ('last_name', models.CharField(max_length=50)),
                ('date', models.DateField()),
                ('time', models.TimeField()),
                ('packagename', models.CharField(max_length=50)),
                ('packagerate', models.IntegerField()),
            ],
        ),
    ]