// Function to display courses based on the selected semester
function displayCourses() {
  const semester = document.getElementById("semesterSelect").value;
  const courseList = document.getElementById("courseList");
  courseList.innerHTML = "";  // Clear the existing list of courses

  if (semester) {
    // Find the selected semester's courses
    const selectedSemester = coursesBySemester.find(s => s.semester == semester);

    if (selectedSemester) {
      // Loop through the courses of the selected semester
      selectedSemester.courses.forEach(course => {
        // Create the label for each course
        const label = document.createElement("label");
        label.innerHTML = `
          <input type="checkbox" name="courses" value="${course.code}" data-schedule="${course.schedule}" data-type="${course.type}" data-credits="${course.credits}" data-instructor="${course.instructor}">
          ${course.code} - ${course.name} (${course.schedule}) - ${course.type} (${course.credits} credits) - Instructor: ${course.instructor}
        `;
        // Append the label to the course list
        courseList.appendChild(label);
        courseList.appendChild(document.createElement("br"));
      });
    }
  }
}


// Function to check for schedule conflicts
function checkScheduleConflict(event) {
  event.preventDefault();
  const selectedCourses = Array.from(document.querySelectorAll('input[name="courses"]:checked'));
  const conflicts = [];
  const enrolledDates = [];

  selectedCourses.forEach(course => {
    const courseDate = course.getAttribute("data-date");
    const courseTime = course.getAttribute("data-time");

    // Convert time to a timestamp for easier comparison (just an example, depends on your needs)
    const startTime = new Date(`2024-11-20T${courseTime.split(" ")[0]}:00`);
    const endTime = new Date(startTime.getTime() + 60 * 60 * 1000); // Assuming 1-hour duration (can be changed)

    const enrolledDate = enrolledDates.find(enrolled => {
      const enrolledStart = new Date(`2024-11-20T${enrolled.split(" ")[1]}:00`);
      const enrolledEnd = new Date(enrolledStart.getTime() + 60 * 60 * 1000); // Adjust as needed
      return (startTime < enrolledEnd && endTime > enrolledStart);
    });

    if (enrolledDate) {
      conflicts.push(course.value);
    } else {
      enrolledDates.push(`${courseDate} ${courseTime}`);
    }
  });

  const conflictMessage = document.getElementById("conflictMessage");
  const resolveBtn = document.getElementById("resolveBtn");

  if (conflicts.length > 0) {
    conflictMessage.textContent = `You have conflicts with the following courses: ${conflicts.join(", ")}.`;
    resolveBtn.style.display = "block";
  } else {
    conflictMessage.textContent = "We found no conflicts in your schedule.";
    resolveBtn.style.display = "none";
  }
}

// Form submission to display enrolled courses
document.getElementById("enrollForm").addEventListener("submit", function (event) {
  event.preventDefault();
  const enrolledList = document.getElementById("enrolledList");
  enrolledList.innerHTML = "";

  const selectedCourses = Array.from(document.querySelectorAll('input[name="courses"]:checked'));
  selectedCourses.forEach(course => {
    const li = document.createElement("li");
    li.textContent = course.value;
    enrolledList.appendChild(li);
  });
});

// Toggle responsive navigation menu
function myMenuFunction() {
  const navMenu = document.getElementById("navMenu");
  navMenu.classList.toggle("responsive");
}

// Load and display the logged-in user's name on the dashboard
document.addEventListener("DOMContentLoaded", function () {
  const loggedInUser = JSON.parse(localStorage.getItem('loggedInUser'));

  if (!loggedInUser) {
    alert("You are not logged in. Redirecting to the login page.");
    window.location.href = 'index.html';
  } else {
    document.querySelector('header h1').textContent = `Welcome, ${loggedInUser.firstName} ${loggedInUser.lastName}`;
  }
});
// Handle logout
document.getElementsByClassName("logout-btn")[0].addEventListener("click", () => {
  console.log("clicked logout");
  
  localStorage.removeItem("loggedInUser");
  window.location.href = "/index.html";
});