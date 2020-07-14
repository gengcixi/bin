#!/usr/bin/env python
# coding=utf-8

import sys
import csv
import io
import os

log_file = str(sys.argv[1])
csv_file = log_file[::-1].split('.',1)[1][::-1] + '.csv'

def csvWrite(uid,f_rc,f_wc,f_rb,f_wb,b_rc,b_wc,b_rb,b_wb,f_fs,b_fs):
    with io.open(csv_file,'ab+') as csv_f:
        writer = csv.writer(csv_f,dialect='excel')
        writer.writerow([uid,f_rc,f_wc,f_rb,f_wb,b_rc,b_wc,b_rb,b_wb,f_fs,b_fs])

def ReadLogs():
    global testNum
    global test_result
    file = open(log_file) 
    for line in file.readlines():
        line=line.strip('\n')
        list=line.split();
        csvWrite(list[0],list[1],list[2],list[3],list[4],list[5],list[6],list[7],list[8],list[9],list[10])
    file.close()
                
if os.path.exists(csv_file):
    os.remove(csv_file)
                 
csvWrite('name/uid','fg_rchar','fg_wchar','fg_rbytes','fg_wbytes','bg_rchar','bg_wchar','bg_rbytes','bg_wbytes','fg_fsync','bg_fsync')
ReadLogs()
