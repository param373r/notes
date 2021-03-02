from base64 import *

file = open("flag.cipher", "r")

enc = file.read()

file.close()

for i in range(0,5):
	enc = b16decode(enc).decode('utf-8')

for i in range(0,5):
	enc = b32decode(enc).decode('utf-8')

for i in range(0,5):
	enc = b64decode(enc).decode('utf-8')

print(enc)

