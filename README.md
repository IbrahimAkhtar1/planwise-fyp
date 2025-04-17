# Fyp-1

an exam scheduler
$env:FLASK_APP = "main.py"

## Packages

flask
flask_sqlalchemy
flask_cors
flask_login
flask_migrate
MySQLdb a.k.a mysqlclient
python-dotenv

### How to create Flask DB migrations to db

1- set FLASK_APP=main.py
2- flask --app main db migrate -m "Initial migration"
3- flask --app main db upgrade
4- flask --app main run
