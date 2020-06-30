#!/usr/bin/env python
# coding=utf-8

import os
import hashlib
import time
import sys

# get file MD5 
def get_ms5(filename):
    m = hashlib.md5()
    mfile = open(filename,"rb")
    m.update(mfile.read())
    mfile.close()
    md5_value = m.hexdigest()
    return md5_value

# get file lists
def get_urllist(base):
    list = os.listdir(base)
    urllist = []
    for i in list:
        url = base + i
        urllist.append(url)
    return urllist

# main function

if __name__ == '__main__':
    md5list = []
    path = str(sys.argv[1])
    urllist = get_urllist(path)
    print("test")
    for a in urllist:
        md5 = get_ms5(a)
        if (md5 in md5list):
            print("重复文件：%s" % a)
        else:
            md5list.append(md5)
            print("Total %s file" % len(md5list))
