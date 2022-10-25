import face_recognition
import cv2
import opencv_demo_Delphi_module

# Face_recognition Spoils the image for Windows.
#image = face_recognition.load_image_file("C:\\Work\\Images\\people1.jpg")
# Instead of face_recognition.load_image_file we can use OpenCV image load.
#image = cv2.imread("C:\\Work\\Images\\people1.jpg")
image = cv2.imread(str(face_recognition_image_path.Value))

#cv2.imshow('Image', main_image)
#cv2.waitKey(0)
    
face_locations = face_recognition.face_locations(image)

for face_location in face_locations:
    top, right, bottom, left = face_location
    print("A face was found: y1 = {}, x1 = {}, y2 = {}, x2 = {}".format(top, left, bottom, right))

    # Extract the face image.
    face_image = image[top:bottom, left:right]
    
    #cv2.imshow('Image', face_image)
    #cv2.waitKey(0)
    
recognized_images.Value = face_locations