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
    __tablename__ = 'users'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(40))
    username = db.Column(db.String(40), unique=True, nullable=False)
    password = db.Column(db.String(200), nullable=False)
    ur_id = db.Column(db.Integer, db.ForeignKey('users_roles.id'), nullable=False)
    status = db.Column(db.Boolean, default=True)

    # Define relationship to UsersRoles
    # role = db.relationship('UsersRoles', backref='users', lazy=True)

class UsersRoles(db.Model):
    __tablename__ = 'users_roles'
    id = db.Column(db.Integer, primary_key=True)
    role = db.Column(db.String(80), nullable=False)

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

@app.route('/signup', methods=['POST'])
def signup():
    try:
        data = request.get_json()
        name = data.get('name')
        username = data.get('username')
        password = data.get('password')
        role_id = data.get('role_id')  # ID of the role to associate with the user
        # Validate input data
        
        if not all([name, username, password, role_id]):
            return jsonify({"error": "Name, username, password, and role_id are required"}), 400

        # Check if the username already exists
        user = Users.query.filter_by(username=username).first()
        if user:
            return jsonify({"error": "Username already exists"}), 400

        # Validate the provided role ID
        role = UsersRoles.query.get(role_id)
        if not role:
            return jsonify({"error": "Invalid role ID"}), 400

        # Hash the password
        encrypted_password = generate_password_hash(password)

        # Create a new user
        new_user = Users(
            name=name,
            username=username,
            password=encrypted_password,
            ur_id=role_id,  # Associate the user with the role
            status=True  # Set status to True by default
        )
        db.session.add(new_user)
        db.session.commit()

        return jsonify({
            "message": "User registered successfully!",
            "user": {
                "id": new_user.id,
                "name": new_user.name,
                "username": new_user.username,
                "role": {
                    "id": role.id,
                    "name": role.role_name  # Assuming `role_name` is an attribute in `UsersRoles`
                },
                "status": new_user.status
            }
        }), 201

    except Exception as e:
        # Log the error for debugging purposes
        app.logger.error(f"Signup error: {e}")
        return jsonify({"error": "An error occurred during registration"}), 500


@app.route('/signin', methods=['POST'])
def signin():
    try:
        data = request.get_json()
        identifier = data.get('identifier')
        password = data.get('password')

        if not all([identifier, password]):
            return jsonify({"error": "Username and password are required"}), 400

        user = Users.query.filter_by(username=identifier).first()

        if user and check_password_hash(user.password, password):
            login_user(user)

            # Fetch role name based on ur_id
            # role = UsersRoles.query.get(user.ur_id).role if UsersRoles.query.get(user.ur_id) else "Unknown"

            return jsonify({
                "message": "Login successful",
                "user": {
                    "id": user.id,
                    "name": user.name,
                    "username": user.username,
                    "role": user.ur_id,  # Return role name instead of ID
                    "status": user.status
                }
            }), 200
        else:
            return jsonify({"error": "Invalid username or password"}), 401

    except Exception as e:
        app.logger.error(f"Signin error: {e}")
        return jsonify({"error": "An error occurred during login"}), 500



@app.route('/dashboard/admin')
# @login_required
def dashboard_admin():
    return render_template('panels/admin/index.html')

@app.route('/dashboard/students')
# @login_required
def dashboard_student():
    return render_template('panels/students/index.html')

if __name__ == '__main__':
    app.run(debug=True)
