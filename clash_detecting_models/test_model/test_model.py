import requests

url = "http://127.0.0.1:5000/check_dates"

data = {
    "students": {
        "student_1": ["2025-05-01", "2025-05-02", "2025-05-03"],
        "student_2": ["2025-05-01", "2025-05-01", "2025-05-04"],
        "student_3": ["2025-05-02", "2025-05-03"]
    },
    "available_dates": ["2025-05-01", "2025-05-02", "2025-05-03", "2025-05-04", "2025-05-05"]
}

response = requests.post(url, json=data)

if response.status_code == 200:
    print("Result:", response.json())
else:
    print("Error:", response.status_code, response.text)
