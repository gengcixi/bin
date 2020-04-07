#########################################################################
# File Name: get_source.sh
# Author: Cixi.Geng
# mail: cixi.geng@unisoc.com
# Created Time: 2019年11月18日 星期一 15时34分04秒
#########################################################################
#!/bin/bash

print "branch:"
print "branch:"
print "branch:"
print "branch:"
read BRANCH

mkdir $BRANCH 
cd $BRANCH
repo init -u ssh://gitadmin@gitmirror.unisoc.com/platform/manifest -b $BRANCH

repo sync -d -c -q -f --no-tags -j20
