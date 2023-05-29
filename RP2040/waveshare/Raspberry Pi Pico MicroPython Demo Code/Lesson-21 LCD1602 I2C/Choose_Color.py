import RGB1602
import time
import math
colorR = 64
colorG = 128
colorB = 64

lcd=RGB1602.RGB1602(16,2)




rgb1 = (148,0,110) #深紫罗兰色
rgb2 = (255,0,255) #紫色
rgb3 = (144,249,15) #青白
rgb4 = (0,128,60) #浅蓝
rgb5 = (255,209,0)#黄色
rgb6 = (248,248,60)#幽灵的白色
rgb7 = (80,80,145) #深蓝色
rgb8 = (255,0,0) #红色
rgb9 = (0,255,0) #青色

# set the cursor to column 0, line 1

lcd.setCursor(0, 0)
# print the number of seconds since reset:

# print the number of seconds since reset:
lcd.printout("Waveshare")
  
lcd.setCursor(0, 1)

lcd.printout("Hello,World!")


lcd.setRGB(rgb1[0],rgb1[1],rgb1[2]);
time.sleep(5)
lcd.setRGB(rgb2[0],rgb2[1],rgb2[2]);
time.sleep(5)
lcd.setRGB(rgb3[0],rgb3[1],rgb3[2]);
time.sleep(5)
lcd.setRGB(rgb4[0],rgb4[1],rgb4[2]);
time.sleep(5)
lcd.setRGB(rgb5[0],rgb5[1],rgb5[2]);
time.sleep(5)
lcd.setRGB(rgb6[0],rgb6[1],rgb6[2]);
time.sleep(5)
lcd.setRGB(rgb7[0],rgb7[1],rgb7[2]);
time.sleep(5)
lcd.setRGB(rgb8[0],rgb8[1],rgb8[2]);
time.sleep(5)
lcd.setRGB(rgb9[0],rgb9[1],rgb9[2]);
time.sleep(5)



    
