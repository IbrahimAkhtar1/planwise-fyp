from flask import Flask, request, jsonify
import numpy as np
import joblib

app = Flask(__name__)
model = joblib.load('models/clash_detector_model.pkl')

def predict_clash(dates, max_dates=10):
    encoded = np.zeros((1, max_dates))
    for date in dates:
        if 0 <= date < max_dates:
            encoded[0, date] = 1
    prediction = model.predict(encoded)[0]
    return prediction == 1

def suggest_alternative(dates, available_dates):
    for alt_date in available_dates:
        if alt_date not in dates:
            return alt_date
    return None

@app.route('/check_dates', methods=['POST'])
def check_dates():
    data = request.get_json()
    students = data.get("students", {})
    available_dates = data.get("available_dates", [])

    result = {}

    for student, dates in students.items():
        has_clash = predict_clash(dates)
        suggestion = suggest_alternative(dates, available_dates) if has_clash else None

        result[student] = {
            "dates": dates,
            "clash_detected": has_clash,
            "suggested_alternative": suggestion
        }

    return jsonify(result)

if __name__ == '__main__':
    app.run(debug=True)