#
//  main.py
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
import cv2

 
train_dir = os.path.expanduser('~/Downloads/face shape detector')
train = ImageDataGenerator(rescale=1/255)
train_dataset = train.flow_from_directory(train_dir, target_size=(200,200),batch_size=3, class_mode = 'binary')
print(train_dataset.class_indices)

classess = ['diamond','heart','oblong','oval','round','square','triangle']

cnn=Sequential()
cnn.add(layers.Conv2D(filters=64,padding='same',strides=2,kernel_size=3,activation='relu',input_shape=(200,200,3)))
cnn.add(layers.MaxPool2D(pool_size=2,strides=2))

cnn.add(layers.Conv2D(filters=32,padding='same',strides=2,kernel_size=3,activation='relu'))
cnn.add(layers.MaxPool2D(pool_size=2,strides=2))

cnn.add(layers.Conv2D(filters=32,padding='same',strides=2,kernel_size=3,activation='relu'))
cnn.add(layers.MaxPool2D(pool_size=2))

cnn.add(layers.Flatten())
cnn.add(layers.Dense(7,activation='softmax'))

cnn.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

cnn.fit(train_dataset, epochs=20)
cnn.save('face_detect.keras')

