from flask import Flask, request, jsonify
import joblib
import numpy as np

# Initialize the Flask app
app = Flask(__name__)

# Load the pre-trained model
model = joblib.load('models/clash_detector_model.pkl')

@app.route('/')
def home():
    return "Welcome to the Exam Date Clash Detector API!"

@app.route('/predict', methods=['POST'])
def predict():
    try:
        # Extract data from the request
        data = request.get_json()

        # Ensure the data has the correct format (replace with your actual feature names and structure)
        features = np.array([data['feature1'], data['feature2'], data['feature3']]).reshape(1, -1)  # Adjust for your model's expected input

        # Use the model to predict
        prediction = model.predict(features)

        # Return the prediction
        return jsonify({'prediction': prediction.tolist()})
    
    except Exception as e:
        return jsonify({'error': str(e)}), 400

if __name__ == '__main__':
    app.run(debug=True)
