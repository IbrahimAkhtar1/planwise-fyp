from flask import Flask, render_template, request, jsonify, redirect, url_for
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS
from flask_login import UserMixin, LoginManager, login_user, login_required
from werkzeug.security import generate_password_hash, check_password_hash
import os

# App Initialization
app = Flask(__name__)
CORS(app)
app.secret_key = "planwise"

# Login Manager
login_manager = LoginManager(app)
login_manager.login_view = '/'

# Configure SQLAlchemy
app.config['SQLALCHEMY_DATABASE_URI'] = os.getenv('DATABASE_URI', 'mysql://root@localhost/planwise_db')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

# User Model
class Users(UserMixin, db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(40))
    username = db.Column(db.String(40), unique=True, nullable=False)
    password = db.Column(db.String(1000), nullable=False)
    role = db.Column(db.String(40), nullable=False, default='student')  # 'student' or 'teacher'
    status = db.Column(db.Boolean, nullable=False, default=True)

# User Loader for LoginManager
@login_manager.user_loader
def load_user(user_id):
    return Users.query.get(int(user_id))

# Routes
@app.route('/')
def default():
    try:
        return render_template('./index.html')
    except Exception as e:
        return f"Error: {e}"

@app.route('/signin', methods=['POST'])
def signin():
    try:
        data = request.get_json()
        identifier = data.get('identifier')
        password = data.get('password')

        user = Users.query.filter_by(username=identifier).first()
        if user and check_password_hash(user.password, password):
            login_user(user)  # Logs in the user
            return jsonify({
                    "message": "Login successful",
                    "user": {"id": user.id, "name": user.name, "role": user.role},
            }), 200
        else:
            return jsonify({"error": "Invalid username or password"}), 401
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route('/signup', methods=['POST'])
def signup():
    try:
        data = request.get_json()
        name = data['name']
        username = data['username']
        password = data['password']

        user = Users.query.filter_by(username=username).first()
        if user:
            return jsonify({"error": "Username already exists"}), 400

        encrypted_password = generate_password_hash(password)
        new_user = Users(name=name, username=username, password=encrypted_password)
        db.session.add(new_user)
        db.session.commit()

        return jsonify({"message": "User registered successfully!"}), 201
    except Exception as e:
        return jsonify({"error": str(e)}), 400

@app.route('/dashboard/admin')
@login_required
def dashboard_admin():
    return render_template('./panels/admin/index.html')

@app.route('/dashboard/students')
@login_required
def dashboard_student():
    return render_template('./panels/students/index.html')

if __name__ == '__main__':
    app.run(debug=True)
