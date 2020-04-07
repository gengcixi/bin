#!/bin/bash

while true 
do
    adb shell dmesg |grep cixi >> log.txt
done
