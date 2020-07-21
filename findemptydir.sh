#########################################################################
# File Name: http.sh
# Author: Cixi.Geng
# mail: cixi.geng@unisoc.com
# Created Time: 2019年12月24日 星期二 15时04分35秒
#########################################################################
#!/bin/bash
findemptydir() {
	find ${1:-.} -mindepth 1 -maxdepth 1 -type d | while read -r dir
	do
		if [[ -z "$(find "$dir" -mindepth 1 -type f)" ]] >/dev/null
		then
			echo "$dir"
			# rm -rf ${dir} 2>&- && echo "Empty, Deleted!" || echo "Delete error"
		fi
		if [ -d ${dir} ]
		then
			findemptydir "$dir"
		fi
	done
}
 
findemptydir
