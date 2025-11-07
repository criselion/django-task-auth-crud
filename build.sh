pip install -r requirements.txt && \
python manage.py migrate && \
python manage.py collectstatic --noinput && \
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('admin', 'admin@mi-portafolio.com', 'PasswordSeguro123') if not User.objects.filter(username='admin').exists() else None" | python manage.py shell