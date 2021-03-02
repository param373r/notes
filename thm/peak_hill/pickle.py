import pickle5

f = open('creds.pickle', 'rb')

username = ''
password = ''
data = pickle5.load(f)

for iterate in range(0,7):
	user = [item for item in data if item[0] == 'ssh_user%d' %iterate]
	username += (user[0][1])

print("username = " + username)

for iterate in range(0,28):
	passwd = [item for item in data if item[0] == 'ssh_pass%d' %iterate]
	
	password += str(passwd[0][1])

print("password = " + password)