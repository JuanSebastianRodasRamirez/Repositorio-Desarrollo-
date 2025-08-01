# Dockerfile
FROM python:3.9-slim

# Establecer directorio de trabajo
WORKDIR /app

# Copiar requirements y instalar dependencias
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el código
COPY backend/ ./backend/

# Establecer directorio de trabajo para Django
WORKDIR /app/backend

# Recopilar archivos estáticos
RUN python manage.py collectstatic --noinput

# Exponer puerto
EXPOSE $PORT

# Comando para ejecutar la aplicación
CMD python manage.py migrate && gunicorn Proyecto_Desarrollo_Software.wsgi:application --bind 0.0.0.0:$PORT
