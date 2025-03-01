import cv2
from tensorflow.keras.models import load_model

model = load_model("liveness_model.h5")

# Capture real-time video
cap = cv2.VideoCapture(0)
while True:
    ret, frame = cap.read()
    if not ret:
        break
    # Process frame for liveness detection
    prediction = model.predict(frame)
    print("Real" if prediction > 0.5 else "Fake")
cap.release()