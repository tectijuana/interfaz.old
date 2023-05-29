/*****************************************************************************
* | File      	:   Readme_CN.txt
* | Author      :   
* | Function    :   Help with use
* | Info        :
*----------------
* |	This version:   V1.0
* | Date        :   2021-11-22
* | Info        :   在这里提供一个中文版本的使用文档，以便你的快速使用
******************************************************************************/
这个文件是帮助您使用本例程。
在这里简略的描述本工程的使用：

1.基本信息：
本例程用于测试或者演示RP2040-Zero上WS2812B;

2.管脚连接：
管脚连接你可以在RP2040-Zero.py查看，这里也再重述一次：
DIN    ->    16

3.基本使用：
    1): 按住RP2040-Zero板上的Boot按键，将RP2040-Zero通过Type-C USB线接到电脑的USB接口，然后松开按键。
        接入之后，电脑会自动识别到一个可移动盘（RPI-RP2）
        
    2): 将Python目录下的uf2文件夹中rp2-pico-20210902-v1.17.uf2 文件复制到识别的可移动盘（RPI-RP2）中
    
    3): 更新Thonny IDE
        sudo apt upgrade thonny
        
    4): 打开Thonny IDE （点击树莓logo -> Programming -> Thonny Python IDE ）
        选择Tools -> Options... -> Interpreter
        选择MicroPython(Raspberry Pi Pico 和ttyACM0端口
        
    5): 在Thonny IDE中打开Python/RP2040-Zero.py文件
        然后运行当前脚本（绿色小三角）即可
    