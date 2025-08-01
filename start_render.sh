#!/usr/bin/env bash
# start_render.sh - Script de inicio para Render

# Ir al directorio backend
cd backend

# Ejecutar migraciones
python manage.py migrate

# Iniciar el servidor con gunicorn
exec gunicorn Proyecto_Desarrollo_Software.wsgi:application --bind 0.0.0.0:$PORT
