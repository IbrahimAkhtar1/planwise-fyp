from flask import Flask, request, jsonify
from collections import Counter

app = Flask(__name__)

# Core clash detection & suggestion logic
def detect_and_suggest_clashes(data):
    students = data.get("students", {})
    available_dates = data.get("available_dates", [])
    result = {}

    for student, dates in students.items():
        date_counts = Counter(dates)
        clashes = [date for date, count in date_counts.items() if count > 1]

        suggestions = {}
        for clash_date in clashes:
            for alt_date in available_dates:
                if alt_date not in dates:
                    suggestions[clash_date] = alt_date
                    break

        result[student] = {
            "original_dates": dates,
            "clashes": clashes,
            "suggestions": suggestions
        }
    return result

@app.route('/check_dates', methods=['POST'])
def check_dates():
    data = request.get_json()
    if not data:
        return jsonify({"error": "No data provided!"}), 400

    result = detect_and_suggest_clashes(data)
    return jsonify(result)

if __name__ == '__main__':
    app.run(debug=True)