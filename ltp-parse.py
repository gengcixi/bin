#encoding:utf-8

import csv
import os,sys
import time

now = time.strftime("%Y-%m-%d-%H_%M_%S",time.localtime(time.time())) 
filename=now+"-ltp-result.csv"

csvFile=open(filename,'wb')
#headers = ['No.','testcase','result','log']

writer = csv.writer(csvFile)

#writer.writerow(headers)
csvFile.close
