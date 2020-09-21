#!/usr/bin/env python3
# coding=utf-8

import sys
import csv
import io
import os

log_file = str(sys.argv[1])
csv_file = log_file[::-1].split('.',1)[1][::-1] + '.csv'

testNum=0
testcase=''
test_log=''
test_result=''
case_log_end = 'execution_status'
case_log_start = 'test_output'

def csvWrite(a,b,c,d,e):
    with io.open(csv_file,'ab+') as csv_f:
        writer = csv.writer(csv_f,dialect='excel')
        writer.writerow([a,b,c,d,e])

def findLog(N):
    logs = []
    with open(log_file,'r') as file:
        for line in file.readlines()[N:]:
            if case_log_end in line :
                break
            logs.append(line)
            result = ''.join(logs)
        return result

def findResult(N):
    case_result = ''
    with open(log_file,'r') as file:
        for line in file.readlines()[N:]:
            if 'termination_id' in line :
                case_result = line.split('termination_id=')[1].split(' ')[0]
                break
        return case_result

def ReadLogs():
    global testNum
    global test_result
    with open(log_file, 'r') as f:
        for (num,value) in enumerate(f):
            if 'tag=' in value :
                testNum +=1
                testcase = value.split('tag=')[1].split(' ')[0]
                test_log = findLog(num+4)
                return_value = findResult(num)
                if int(return_value) == 0 :
                    test_result = 'PASS'
                elif int(return_value) == 32 :
                    test_result = 'CONF'
                else :
                    test_result = 'FAIL'
                csvWrite(testNum,testcase,test_result,return_value,test_log)
                
if os.path.exists(csv_file):
    os.remove(csv_file)
                 
csvWrite('No.','Testcase','Test_result','Return_value','Test_log')
ReadLogs()
