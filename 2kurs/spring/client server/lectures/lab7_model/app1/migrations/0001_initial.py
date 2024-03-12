# Generated by Django 5.0.3 on 2024-03-12 04:45

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Branch',
            fields=[
                ('bid', models.AutoField(primary_key=True, serialize=False)),
                ('bname', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Worker',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('wname', models.CharField(max_length=50)),
                ('bid', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app1.branch')),
            ],
        ),
    ]