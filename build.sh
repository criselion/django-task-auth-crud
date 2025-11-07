set -o errexit

# poetry install
pip install -r requirements.txt

python manage.py collectstatic --noinput

python manage.py migrate && python manage.py shell -c "
from django.contrib.auth import get_user_model
User = get_user_model()
if not User.objects.filter(username='$ADMIN_USERNAME').exists():
    User.objects.create_superuser('$ADMIN_USERNAME', '$ADMIN_EMAIL', '$ADMIN_PASSWORD')
    print('Superusuario creado exitosamente')
else:
    print('El superusuario ya existe')
"