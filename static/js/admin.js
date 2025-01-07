// Handle menu toggle
function myMenuFunction() {
    var navMenu = document.getElementById("navMenu");
    if (navMenu.className === "nav-menu") {
        navMenu.className += " responsive";
    } else {
        navMenu.className = "nav-menu";
    }
}

// Function to show the appropriate section
function showSection(sectionId) {
    // Hide all sections
    var sections = ["dashboardSection", "manageStudentsSection", "uploadDateSheetSection", "clashesDetectionSection", "reportSection", "settingsSection"];
    sections.forEach(function (section) {
        document.getElementById(section).style.display = "none";
    });

    // Show the clicked section
    document.getElementById(sectionId).style.display = "block";
}

// Admin functions
document.getElementById("studentForm").addEventListener("submit", function (event) {
    event.preventDefault();
    var studentName = document.getElementById("studentName").value.trim();
    if (studentName) {
        var studentList = document.getElementById("studentList");
        var li = document.createElement("li");
        li.textContent = studentName;
        studentList.appendChild(li);
        alert("Student added successfully!");
        document.getElementById("studentName").value = ""; // Clear the input field
    } else {
        alert("Please enter a valid student name.");
    }
});

// Handle exam date sheet upload
document.getElementById("uploadForm").addEventListener("submit", function (event) {
    event.preventDefault();
    var dateSheetFile = document.getElementById("dateSheetFile").files[0];
    if (dateSheetFile) {
        var examList = document.getElementById("examList");
        examList.innerHTML = `<li>Uploaded file: ${dateSheetFile.name}</li>`;
        alert("Date sheet uploaded successfully!");
    } else {
        alert("Please select a file to upload.");
    }
});

// Detect clashes (placeholder functionality)
document.getElementById("detectClashesBtn").addEventListener("click", function () {
    var clashList = document.getElementById("clashList");
    clashList.innerHTML = "<li>No clashes detected.</li>"; // Placeholder - actual logic can be added
    alert("Clashes detection completed!");
});

// Generate report (placeholder functionality)
document.getElementById("generateReportBtn").addEventListener("click", function () {
    var reportsList = document.getElementById("reportsList");
    var reportId = reportsList.children.length + 1;
    reportsList.innerHTML += `<li>Report ${reportId} generated.</li>`;
    alert("Report generated successfully!");
});

// Handle settings update
document.getElementById("settingsForm").addEventListener("submit", function (event) {
    event.preventDefault();
    var adminEmail = document.getElementById("adminEmail").value;
    alert(`Settings updated! New Admin Email: ${adminEmail}`);
});

// Handle logout
document.getElementById("logoutBtn").addEventListener("click", function () {
    localStorage.removeItem("loggedInUser");
    window.location.href = "index.html";
});
// Update active menu link
function setActiveMenu(link) {
    var links = document.querySelectorAll('.sidebar-menu li a');
    links.forEach(function (link) {
        link.classList.remove('active');
    });
    link.classList.add('active');
}

// Handle menu click
function showSection(sectionId) {
    // Hide all sections
    var sections = ["dashboardSection", "manageStudentsSection", "uploadDateSheetSection", "clashesDetectionSection", "reportSection", "settingsSection"];
    sections.forEach(function (section) {
        document.getElementById(section).style.display = "none";
    });

    // Show the clicked section
    document.getElementById(sectionId).style.display = "block";

    // Update the active menu
    var link = document.querySelector(`.sidebar-menu a[href='#'][onclick="showSection('${sectionId}')"]`);
    setActiveMenu(link);
}

// Initial setup: Set the default section
document.addEventListener("DOMContentLoaded", function () {
    showSection("dashboardSection");  // Default to dashboard
});

// Load logged-in admin's name on dashboard load
// document.addEventListener("DOMContentLoaded", function () {
//     var loggedInUser = JSON.parse(localStorage.getItem("loggedInUser"));
//     if (!loggedInUser || /^[0-9]+$/.test(loggedInUser.firstName)) {
//         alert("You are not authorized to access this page. Redirecting to login page.");
//         window.location.href = '/index.html';
//     } else {
//         document.querySelector('header h1').textContent = `Welcome, Admin ${loggedInUser.firstName} ${loggedInUser.lastName}`;
//         showSection("dashboardSection");  // Default to dashboard section
//     }
// });
