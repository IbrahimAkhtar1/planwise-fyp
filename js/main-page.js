
// Form switching functions for login and registration
function login() {
    var loginContainer = document.getElementById("login");
    var registerContainer = document.getElementById("register");

    loginContainer.style.left = "4px";
    registerContainer.style.right = "-520px";
    loginContainer.style.opacity = 1;
    registerContainer.style.opacity = 0;
}

function register() {
    var loginContainer = document.getElementById("login");
    var registerContainer = document.getElementById("register");

    loginContainer.style.left = "-510px";
    registerContainer.style.right = "5px";
    loginContainer.style.opacity = 0;
    registerContainer.style.opacity = 1;
}

// Register new user
function registerUser() {
    var firstName = document.getElementById('register-firstname').value;
    var lastName = document.getElementById('register-lastname').value;
    var email = document.getElementById('register-email').value;
    var password = document.getElementById('register-password').value;

    if (firstName && lastName && email && password) {
        var users = JSON.parse(localStorage.getItem('users')) || [];

        // Check if the user already exists
        var userExists = users.some(function (user) {
            return user.email === email;
        });

        if (!userExists) {
            // Save new user
            users.push({ firstName: firstName, lastName: lastName, email: email, password: password });
            localStorage.setItem('users', JSON.stringify(users));
            alert("User registered successfully!");

            // Redirect to the login form after registration
            login();
        } else {
            alert("User with this email already exists!");
        }
    } else {
        alert("Please fill all fields.");
    }
}

// Login user
function loginUser() {
    var usernameOrId = document.getElementById('login-identifier').value;
    var password = document.getElementById('login-password').value;

    if (usernameOrId && password) {
        var users = JSON.parse(localStorage.getItem('users')) || [];

        // Check if the user exists
        var user = users.find(function (user) {
            return (user.email === usernameOrId || user.firstName === usernameOrId) && user.password === password;
        });

        if (user) {
            alert("Login successful!");

            // Save logged-in user data in localStorage
            localStorage.setItem('loggedInUser', JSON.stringify(user));

            // Redirect based on identifier (numeric for student, string for admin)
            if (/^\d+$/.test(usernameOrId)) {
                window.location.href = '/panels/students/index.html';  // Redirect to student dashboard
            } else {
                window.location.href = '/panels/admin/index.html';  // Redirect to admin dashboard
            }
        } else {
            alert("Invalid credentials! Please try again.");
        }
    } else {
        alert("Please fill in both username and password fields.");
    }
}

// Menu toggle for responsive navigation
function myMenuFunction() {
    var navMenu = document.getElementById("navMenu");
    if (navMenu.className === "nav-menu") {
        navMenu.className += " responsive";
    } else {
        navMenu.className = "nav-menu";
    }
}

// Add event listeners to buttons
document.getElementById("registerBtn").addEventListener("click", register);
document.getElementById("loginBtn").addEventListener("click", login);
document.querySelector('.login-container .submit').addEventListener('click', loginUser);
document.querySelector('.register-container .submit').addEventListener('click', registerUser);
document.getElementById("signUpLink").addEventListener("click", register);
document.getElementById("loginLink").addEventListener("click", login);
