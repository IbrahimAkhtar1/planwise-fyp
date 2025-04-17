import requests

url = "http://127.0.0.1:5000/check_dates"

data = {
    "students": {
        "StudentA": [0, 2, 0, 3],
        "StudentB": [1, 5, 7]
    },
    "available_dates": [4, 5, 6, 7, 8, 9]
}

response = requests.post(url, json=data)
print("Response from server:", response.json())