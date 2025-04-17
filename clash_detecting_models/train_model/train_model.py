import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
import joblib

# Load dataset
data = pd.read_csv('clash_data.csv')

# Simple feature engineering
data['start_hour'] = pd.to_datetime(data['schedule_start']).dt.hour
data['end_hour'] = pd.to_datetime(data['schedule_end']).dt.hour
data['day'] = pd.to_datetime(data['schedule_start']).dt.day

# Encode text columns
le = LabelEncoder()
data['course_code'] = le.fit_transform(data['course_code'])
data['type'] = le.fit_transform(data['type'])
data['instructor'] = le.fit_transform(data['instructor'])

# Define features and target
X = data[['course_code', 'start_hour', 'end_hour', 'day', 'type', 'credit', 'instructor']]
y = []  # Generate clash labels manually: 1 if overlapping, 0 if not

for i in range(len(data)):
    clash = 0
    for j in range(len(data)):
        if i != j:
            if data.loc[i, 'day'] == data.loc[j, 'day']:
                if not (data.loc[i, 'end_hour'] <= data.loc[j, 'start_hour'] or data.loc[j, 'end_hour'] <= data.loc[i, 'start_hour']):
                    clash = 1
                    break
    y.append(clash)

# Train/Test split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Train model
model = RandomForestClassifier(n_estimators=100, random_state=42)
model.fit(X_train, y_train)

# Save model
joblib.dump(model, 'models/clash_detector_model.pkl')

print("✅ Model trained and saved successfully!")
