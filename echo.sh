#########################################################################
# File Name: echo.sh
# Author: Cixi.Geng
# mail: cixi.geng@unisoc.com
# Created Time: 2019年10月31日 星期四 15时25分18秒
#########################################################################
#!/bin/bash
#
#下面是字体输出颜色及终端格式控制
#字体色范围：30-37
echo -e "\033[30m 黑色字 \033[0m"
echo -e "\033[31m 红色字 \033[0m"
echo -e "\033[32m 绿色字 \033[0m"
echo -e "\033[33m 黄色字 \033[0m"
echo -e "\033[34m 蓝色字 \033[0m"
echo -e "\033[35m 紫色字 \033[0m"
echo -e "\033[36m 天蓝字 \033[0m"
echo -e "\033[37m 白色字 \033[0m"
#字背景颜色范围：40-47
echo -e "\033[40;37m 黑底白字 \033[0m"
echo -e "\033[41;30m 红底黑字 \033[0m"
echo -e "\033[42;34m 绿底蓝字 \033[0m"
echo -e "\033[43;34m 黄底蓝字 \033[0m"
echo -e "\033[44;30m 蓝底黑字 \033[0m"
echo -e "\033[45;30m 紫底黑字 \033[0m"
echo -e "\033[46;30m 天蓝底黑字 \033[0m"
echo -e "\033[47;34m 白底蓝字 \033[0m" 

# check return error
check_err()
{
		echo -e "\033[31m Error: $* \033[0m" >&2
		exit 2
}

check_err "this is a test file"

echo "et wpp wps wpspdf"
# check return error
check_err()
{
        if [ $? -ne 0 ]; then
                echo -e "\033[31m FAIL: $* \033[0m" >&2
                return_val=1
                return
        else
                echo -e "\033[33m PASS: $* \033[0m" >&2
                return_val=0
        fi
}
#install
if [ ${return_val} -eq 0 ]; then
	echo check done
fi


