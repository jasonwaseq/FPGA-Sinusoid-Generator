import math

depth = 100 
width = 12  

max_val = (1 << (width - 1)) - 1

with open('sine.hex', 'w') as f:
    for i in range(depth):
        sine_val = math.sin(440 * (i * 2 * math.pi) / 44000)        
        scaled = int(sine_val * max_val)
        if scaled < 0:
            scaled = (1 << width) + scaled 
        
        f.write(f'{scaled:03X}\n')