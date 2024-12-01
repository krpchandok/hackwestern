#
//  test.py
//  HackWestern
//
//  Created by Kirpa Chandok on 2024-12-01.
//

import tensorflow as tf
import os
import matplotlib.pyplot as plt
from keras._tf_keras.keras.preprocessing import image
from keras._tf_keras.keras.preprocessing.image import ImageDataGenerator, img_to_array, load_img
from keras._tf_keras.keras.optimizers import RMSprop
from keras._tf_keras.keras import layers, models, applications, Sequential
from PIL import Image
import numpy as np
from keras._tf_keras.keras.callbacks import ReduceLROnPlateau, EarlyStopping
from keras._tf_keras.keras.utils import Sequence
from keras._tf_keras.keras.models import load_model
import cv2
from flask import Flask, request, jsonify
import io

app = Flask(__name__)



model = load_model('face_detect.keras')

classess = ['diamond', 'heart', 'oblong', 'oval', 'round', 'square', 'triangle']

@app.route('/predict', methods=['POST'])
def prediction_cnn():
    image_file = request.files['image']
    image_bytes = image_file.read()
    image = Image.open(io.BytesIO(image_bytes))

    image = np.array(image.convert('RGB'))
    image = cv2.resize(image, (200, 200))
    image = image / 255.0
    image = np.reshape(image, (1, 200, 200, 3))

    predictions = cnn.predict(image)
    predicted_class = np.argmax(predictions)

    response = {'predicted_class': classess[predicted_class]}
    return jsonify(response)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=2022)
