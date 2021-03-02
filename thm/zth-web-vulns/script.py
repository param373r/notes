#!/usr/bin/python3

import os
import base64
import binascii

token = input("enter the token ")
print()
print()

# to provide padding for decoding base64
def padding(combo):
	newlist = list()
	for i in (0,1):
		eql = len(combo[i]) % 4
		newlist.append(combo[i] + '='*eql)
	return newlist

def main():
	combo = token.split('.')

	parted = padding(combo)
	header = base64.b64decode(parted[0]).decode('UTF-8')
	payload = base64.b64decode(parted[1])
#	print(header,payload)

	header = header.replace("RS256", "HS256")
	#print(header)
	
	# header + payload
	hp = parted[0] + '.' + combo[1]
#	print(hp)

	os.system('cat public.pem | xxd -p | tr -d "\\n" > hexed ')

	with open('hexed', 'r') as f:
		hexed = f.read()

	cmd = "echo -n '{0}' | openssl dgst -sha256 -mac HMAC -macopt hexkey:{1} > hexed_checksum".format(hp,hexed)
	os.system(cmd)

	with open('hexed_checksum', 'r') as f:
		hexed_checksum = f.read()
		hexed_checksum = hexed_checksum.lstrip("(stdin)= ")
	
	print((hexed_checksum))
	print(hp)

	# hexed_checksum to binary to base64encode was not properly implemented... I tried doing things manually from here...

main()
