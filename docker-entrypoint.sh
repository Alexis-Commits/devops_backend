#!/bin/bash

# Collect static files
# echo "Collect static files"
python3.6 manage.py collectstatic --noinput

# Apply database migrations
echo "Apply database migrations"
python3.6 manage.py makemigrations
python3.6 manage.py migrate

# Start server
echo "Starting server"
gunicorn -b 0.0.0.0:8000 --workers=2 --threads=4 --worker-class=gthread backend.wsgi