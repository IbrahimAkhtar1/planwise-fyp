document.addEventListener("DOMContentLoaded", () => {
  const authContainer = document.getElementById("auth-container");
  const loginForm = document.getElementById("login-form");
  const registerForm = document.getElementById("register-form");

  // Toggle between login and register forms
  document.getElementById("toggle-auth")?.addEventListener("click", (e) => {
    e.preventDefault();
    authContainer.style.display = "block";
    loginForm.style.display = "block";
    registerForm.style.display = "none";
  });

  document.getElementById("show-register")?.addEventListener("click", () => {
    loginForm.style.transform = "translateX(-100%)";
    registerForm.style.transform = "translateX(0)";
  });

  document.getElementById("show-login")?.addEventListener("click", () => {
    registerForm.style.transform = "translateX(100%)";
    loginForm.style.transform = "translateX(0)";
  });
});

async function loginUser() {
  const identifier = document.getElementById("login-identifier").value;
  const password = document.getElementById("login-password").value;

  try {
    const response = await fetch("http://localhost:5000/signin", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ identifier, password }),
    });

    if (response.ok) {
      const result = await response.json();
      if(result.user.role === 'student'){
        alert(`Welcome to Student Dashboard, ${result.user.name}!`);
        window.location.href = '/dashboard/students';
      }else if(result.user.role === 'teacher'){
        alert(`Welcome to Admin Dashboard, ${result.user.name}!`);
        window.location.href = '/dashboard/admin';
      }
    } else {
      const error = await response.json();
      alert(`Error: ${error.error}`);
    }
  } catch (err) {
    alert(`An error occurred: ${err.message}`);
  }
}

async function registerUser(e) {
  e.preventDefault();

  const firstName = document.getElementById("register-firstname").value;
  const lastName = document.getElementById("register-lastname").value;
  const username = document.getElementById("register-username").value;
  const password = document.getElementById("register-password").value;

  if (!firstName || !lastName || !username || !password) {
    alert("Please fill all fields.");
    return;
  }

  const userData = {
    name: `${firstName} ${lastName}`,
    username: username,
    password: password,
  };

  try {
    const request = await fetch("http://localhost:5000/signup", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(userData),
    });

    if (request.ok) {
      const response = await request.json();
      alert("User registered successfully!");
      if(response.role === 'dashboard_student'){
        alert(`Welcome to Student Dashboard, ${response.user.name}!`);
      // Optionally redirect to the login form
      window.location.href = '/dashboard/student'; 
    }
    else if (response.role === "dashboard_admin") {
      alert(`Welcome to Admin Dashboard, ${response.user.name}!`);
      window.location.href = "/dashboard/admin";
    }
    } else {
      const errorText = await request.text();
      alert(`Failed to register: ${errorText}`);
    }
  } catch (error) {
    console.error("Error:", error);
    alert("An error occurred while registering the user.");
  }
}
