import machine
import utime

sensor_pir = machine.Pin(28, machine.Pin.IN)
sensor_pir2 = machine.Pin(22, machine.Pin.IN)
led = machine.Pin(15, machine.Pin.OUT)
buzzer = machine.Pin(14, machine.Pin.OUT)

def pir_handler(pin):
    if pin is sensor_pir:
        print("ALARM! Motion detected in bedroom!") 
    elif pin is sensor_pir2:
        print("ALARM! Motion detected in living room!") 
    for i in range(50):
        led.toggle()
        buzzer.toggle()
        utime.sleep_ms(100)
        
sensor_pir.irq(trigger=machine.Pin.IRQ_RISING, handler=pir_handler)
sensor_pir2.irq(trigger=machine.Pin.IRQ_RISING, handler=pir_handler)

while True: 
    led.toggle() 
    utime.sleep(5)