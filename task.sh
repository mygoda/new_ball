export C_FORCE_ROOT=true
python manage.py celery worker -c 2 -l debug
