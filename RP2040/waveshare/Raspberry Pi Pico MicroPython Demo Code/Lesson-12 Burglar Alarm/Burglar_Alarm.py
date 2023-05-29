import machine

sensor_pir = machine.Pin(28, machine.Pin.IN)

def pir_handler(pin):
    print("ALARM! Motion detected!")
    
sensor_pir.irq(trigger=machine.Pin.IRQ_RISING, handler=pir_handler)