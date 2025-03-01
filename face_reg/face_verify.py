from deepface import DeepFace

# Verify a face against an ID photo
result = DeepFace.verify(img1_path="selfie.jpg", img2_path="passport.jpg", model_name="VGG-Face")
print(result)
