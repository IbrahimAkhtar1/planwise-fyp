// Show and hide login and registration forms
const authContainer = document.getElementById('auth-container');
const loginForm = document.getElementById('login-form');
const registerForm = document.getElementById('register-form');

document.getElementById('toggle-auth').onclick = () => {
    authContainer.style.display = 'block';
    loginForm.style.display = 'block';
    registerForm.style.display = 'none';
};

document.getElementById('show-register').onclick = () => {
    loginForm.style.transform = 'translateX(-100%)';
    registerForm.style.transform = 'translateX(0)';
};

document.getElementById('show-login').onclick = () => {
    registerForm.style.transform = 'translateX(100%)';
    loginForm.style.transform = 'translateX(0)';
};

// Function stubs for login and registration
function loginUser() {
    const identifier = document.getElementById('login-identifier').value;
    const password = document.getElementById('login-password').value;
    // Implement login logic here
    alert(`Login attempt for: ${identifier}`);
}

function registerUser() {
    const firstname = document.getElementById('register-firstname').value;
    const lastname = document.getElementById('register-lastname').value;
    const email = document.getElementById('register-email').value;
    const password = document.getElementById('register-password').value;
    // Implement registration logic here
    alert(`Registration attempt for: ${firstname} ${lastname}`);
}
