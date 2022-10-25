import cv2
import os
import sys
#import opencv_demo_Delphi_module

#class CardInfoStruct (Struct):
#    name = ''
#    x1 = 0
#    y1 = 0
#    x2 = 0
#    y2 = 0

def find_features(img1):
    try:
        correct_matches_dct = {}
        directory = 'C:\\Work\\EKON25\\Python\\opencv-tutorial-master\\images\\cards\\sample\\'
        #sys.stdout.write(directory + '\n')
        for image in os.listdir(directory):
            #sys.stdout.write(image + '\n');
            img2 = cv2.imread(directory + image, 0)
            orb = cv2.ORB_create()
            kp1, des1 = orb.detectAndCompute(img1, None)
            kp2, des2 = orb.detectAndCompute(img2, None)
            bf = cv2.BFMatcher()
            matches = bf.knnMatch(des1, des2, k=2)
            correct_matches = []
            for m, n in matches:
                if m.distance < 0.75*n.distance:
                    correct_matches.append([m])
                    correct_matches_dct[image.split('.')[0]] = len(correct_matches)
        correct_matches_dct = dict(sorted(correct_matches_dct.items(),
                                   key=lambda item: item[1], reverse=True))
    except Exception as e:
        sys.stdout.write('Error: ' + str(e))
    return list(correct_matches_dct.keys())[0]


def find_contours_of_cards(image):
    try:
        blurred = cv2.GaussianBlur(image, (3, 3), 0)
        T, thresh_img = cv2.threshold(blurred, 215, 255, cv2.THRESH_BINARY)

        # https://pythonexamples.org/python-opencv-cv2-find-contours-in-image/
        #(_, cnts, _) = cv2.findContours(thresh_img, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
        (cnts, _) = cv2.findContours(thresh_img, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
    except Exception as e:
        sys.stdout.write('Error: ' + str(e))
    return cnts


def find_coordinates_of_cards(cnts, image):
    cards_coordinates = {}
    cards_coordinates_by_index = {}
    for i in range(0, len(cnts)):
        #sys.stdout.write('i=' + str(i) + '\n')
        x, y, w, h = cv2.boundingRect(cnts[i])
        if w > 20 and h > 30:
            img_crop = image[y - 15:y + h + 15, x - 15:x + w + 15]
            cards_name = find_features(img_crop)
            cards_coordinates[cards_name] = (x - 15, y - 15, x + w + 15, y + h + 15)
            #card = CardInfoStruct()
            #card.x1 = x - 15
            #card.y1 = y - 15
            #card.x2 = x + w + 15
            #card.y2 = y + h + 15
            #card.name = cards_name 
            #card = CardInfoStruct()
            card = {}
            card['x1'] = x - 15
            card['y1'] = y - 15
            card['x2'] = x + w + 15
            card['y2'] = y + h + 15
            card['name'] = cards_name 
            
            #Check dupliates
            has_duplicate = False
            duplicte_index = 0
            for key, value in cards_coordinates_by_index.items():
                #if card['name'] == value['name']:
                #print(value['name'])
                if (card['name'] == value['name']) and \
                    (int(card['x1']) > int(value['x1'])) and \
                    (int(card['x1']) < int(value['x2'])) and \
                    (int(card['y2']) > int(value['y1'])) and \
                    (int(card['y2']) < int(value['y2'])):
                    #(((int(card['x1']) > int(value['x1'])) and (int(card['x1']) < int(value['x2']))): # and \
                    #(((int(card['y2']) > int(value['y1'])) and (int(card['y2']) < int(value['y2']))):
                     has_duplicate = True
                     duplicte_index = key
                     continue
                    
            if not has_duplicate:
                cards_coordinates_by_index[i] = card
            else:
                print('We have duplicate with card name = ' + card['name'] + ' and index = ' + str(duplicte_index))
                cards_coordinates_by_index[duplicte_index] = card    
                
    #print('cards_coordinates array size = ' + str(len(cards_coordinates)) + '\n')
    print('cards_coordinates_by_index array size = ' + str(len(cards_coordinates_by_index)) + '\n')
    #return cards_coordinates
    return cards_coordinates_by_index


def draw_rectangle_aroud_cards(cards_coordinates, image):
    for key, value in cards_coordinates.items():
        rec = cv2.rectangle(image, (value['x1'], value['y1']), (value['x2'], value['y2']), (255, 255, 0), 2)
        cv2.putText(rec, value['name'], (value['x1'], value['y1'] - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (36, 255, 12), 1)
        #rec = cv2.rectangle(image, (value[0], value[1]), (value[2], value[3]), (255, 255, 0), 2)
        #cv2.putText(rec, key, (value[0], value[1] - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (36, 255, 12), 1)
    cv2.imshow('Image', image)
    cv2.waitKey(0)


if __name__ == '__main__':
    #main_image = cv2.imread('C:\Work\EKON25\Python\opencv-tutorial-master\images\cards\main_image\cards-complicated.jpg')
    main_image = cv2.imread('C:\Work\EKON25\Python\opencv-tutorial-master\images\cards\main_image\cards.jpg')
    gray_main_image = cv2.cvtColor(main_image, cv2.COLOR_BGR2GRAY)
    cv2.imwrite('C:\Work\EKON25\Python\opencv-tutorial-master\images\cards\main_image\graycards.jpg', gray_main_image)
    contours = find_contours_of_cards(gray_main_image)
    cards_location = find_coordinates_of_cards(contours, gray_main_image)
    
    #print('Array values from Delphi code = ' + str(opencv_demo_Delphi_module.get_array_from_Delphi_code()))
    #amountoffoundcards.Value = len(cards_location) 
    #card_contours.Value = cards_location     
        
    draw_rectangle_aroud_cards(cards_location, main_image)