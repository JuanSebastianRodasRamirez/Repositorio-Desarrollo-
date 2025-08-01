#!/usr/bin/env bash
# build_render.sh - Script de construcción para Render

set -o errexit  # exit on error

# Instalar dependencias
pip install -r requirements.txt

# Ir al directorio backend
cd backend

# Recopilar archivos estáticos
python manage.py collectstatic --noinput
