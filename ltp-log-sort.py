#!/usr/bin/env python
# coding=utf-8

import sys
import csv
import io

log_file = str(sys.argv[1])
csv_file = log_file.split('.')[0]

testNum=0
testcase=''
test_log=''
case_log_end = 'execution_status'
case_log_start = 'test_output'

def csvWrite(a,b,c,d):
    with io.open(csv_file+'.csv','ab+') as csv_f:
        writer = csv.writer(csv_f,dialect='excel')
        writer.writerow([a,b,c,d])

def findLog(N):
    logs = []
    with open(log_file,'r') as file:
        for line in file.readlines()[N:]:
            if case_log_end in line :
                break
#            line = line.strip()
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

    with open(log_file, 'r') as f:
        for (num,value) in enumerate(f):
            if 'tag=' in value :
                testNum +=1
                testcase = value.split('tag=')[1].split(' ')[0]
                test_log = findLog(num+4)
                test_result = findResult(num)
                csvWrite(testNum,testcase,test_result,test_log)
                
csvWrite('No.','Testcase','return_value','Test_log')
ReadLogs()
