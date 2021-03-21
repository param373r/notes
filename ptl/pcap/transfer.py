#!/usr/bin/env python3

import os


os.system('ls ~/Downloads/ > output.txt')

f = open('output.txt', 'r')
x = f.read().strip('\n')

folder = x.split('_')[1].split('.')[0]

os.system('mv ~/Downloads/* ./' + folder)
