#!/bin/bash

echo "Applying migrations..."
cd /usr/src/app
#export PYTHONPATH=/usr/src/app;$PYTHONPATH
python manage.py makemigrations --noinput
python manage.py migrate --noinput
echo "Creating superusers..."
python manage.py initadmin
echo "Launching server..."
python manage.py runserver 0.0.0.0:8000