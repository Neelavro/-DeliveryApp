# Generated by Django 5.0.6 on 2024-09-06 18:43

import django.db.models.deletion
import uuid
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='CustomUser',
            fields=[
                ('user_contact', models.CharField(max_length=11, primary_key=True, serialize=False)),
                ('user_name', models.CharField(max_length=50)),
                ('user_password', models.CharField(max_length=50)),
                ('user_email', models.EmailField(default='default', max_length=50, unique=True)),
            ],
        ),
        migrations.CreateModel(
            name='Menu',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('item_name', models.CharField(max_length=50)),
                ('item_price', models.DecimalField(decimal_places=2, max_digits=10, null=True)),
                ('item_description', models.CharField(max_length=100, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Restaurant',
            fields=[
                ('restaurant_name', models.CharField(max_length=50)),
                ('restaurant_image', models.CharField(max_length=300)),
                ('restaurant_id', models.AutoField(editable=False, primary_key=True, serialize=False, unique=True)),
            ],
        ),
        migrations.CreateModel(
            name='SessionToken',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('user_email', models.EmailField(max_length=50)),
                ('token', models.CharField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='Order',
            fields=[
                ('order_type', models.CharField(choices=[('pending', 'Pending'), ('delivered', 'Delivered')], default='pending', max_length=50)),
                ('order_id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False, unique=True)),
                ('delivery_address', models.CharField(max_length=500)),
                ('order_value', models.DecimalField(decimal_places=2, max_digits=10)),
                ('delivery', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='delivery_orders', to='backend.customuser')),
                ('order_items', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='menu_orders', to='backend.menu')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='user_orders', to='backend.customuser')),
                ('restaurant', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='restaurant_orders', to='backend.restaurant')),
            ],
        ),
        migrations.CreateModel(
            name='Deliverer',
            fields=[
                ('delivery_name', models.CharField(max_length=50)),
                ('delivery_password', models.CharField(max_length=50)),
                ('delivery_email', models.EmailField(default='default', max_length=50, unique=True)),
                ('delivery_id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False, unique=True)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='user_deliverers', to='backend.customuser')),
                ('orders', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='order_deliverers', to='backend.order')),
            ],
        ),
        migrations.CreateModel(
            name='Payment',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('payment_type', models.CharField(choices=[('cash', 'Cash'), ('bKash', 'BKash')], default='cash', max_length=50)),
                ('order', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='order_payments', to='backend.order')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='user_payments', to='backend.customuser')),
                ('restaurant', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='restaurant_payments', to='backend.restaurant')),
            ],
        ),
        migrations.AddField(
            model_name='menu',
            name='restaurant',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='menu_items', to='backend.restaurant'),
        ),
        migrations.CreateModel(
            name='Reviews',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('review', models.CharField(max_length=500, null=True)),
                ('review_rating', models.DecimalField(decimal_places=2, max_digits=5, null=True)),
                ('menu_item', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='menu_reviews', to='backend.menu')),
                ('restaurant', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='restaurant_reviews', to='backend.restaurant')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='user_reviews', to='backend.customuser')),
            ],
        ),
    ]
