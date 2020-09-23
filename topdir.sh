#########################################################################
# File Name: topdir.sh
# Author: Cixi.Geng
# mail: cixi.geng@unisoc.com
# Created Time: 2020年09月23日 星期三 10时30分15秒
#########################################################################
#!/bin/bash

echo '$0: '$0
echo "pwd: "`pwd`
echo "============================="
echo "scriptPath1: "$(cd `dirname $0`; pwd)
echo "scriptPath2: "$(pwd)
echo "scriptPath3: "$(dirname $(readlink -f $0))
echo "scriptPath4: "$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
echo -n "scriptPath5: " && dirname $(readlink -f ${BASH_SOURCE[0]})

