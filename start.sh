#!/bin/bash
set -e

# Ir al directorio del backend
cd backend

# Recopilar archivos estáticos
echo "Collecting static files..."
python manage.py collectstatic --noinput

# Ejecutar migraciones
echo "Running migrations..."
python manage.py migrate

# Iniciar el servidor
echo "Starting server..."
exec gunicorn Proyecto_Desarrollo_Software.wsgi:application --bind 0.0.0.0:$PORT
