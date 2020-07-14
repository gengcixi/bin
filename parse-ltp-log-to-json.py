#!/usr/bin/env python3
# coding=utf-8

import sys
import json
import csv
import io
import os

testnum=0
testcase=''
test_log=''
test_result=''
case_log_end = 'execution_status'
case_log_start = 'test_output'

log_file = str(sys.argv[1])
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

def Readlog(file):
    global testnum
    with open(file, 'r') as f:
        for (num,value) in enumerate(f):
            if 'tag=' in value :
                dict = {}
                testdata = {}
                testnum +=1
                totalCount=testnum
#               dict['caseNum'] = testnum
                dict['caseName'] = value.split('tag=')[1].split(' ')[0]
#               dict['testLog'] = findLog(num+4)
                returnValue = findResult(num)
#               dict['returnValue'] = findResult(num)
                if int(returnValue) == 0 :
                    test_result = 'PASS'
                elif int(returnValue) == 32 :
                    test_result = 'CONF'
                else :
                    test_result = 'FAIL'
                dict['testResult']=test_result
                jsonData = json.dumps(dict)
                testdata['caseResults']=jsonData
                print(testdata)
#               print(dict)
                with open('ltp.json', 'a+') as f:
                    f.write(jsonData+'\n')
Readlog(log_file)
