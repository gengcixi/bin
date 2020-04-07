#!/bin/bash

echo "******** start of Test sleep function ********"

function test_sleep()
{
    for i in $(seq 1 10)  
    do   
        time=$[i * 5]
        echo "LOOP $[i]:  sleep time: ${time}"
        sleep ${time}
        echo "LOOP ${i}: wakeup succeedfully"
        echo 
    done   
}

test_sleep
echo "******** end of Test sleep function ********"
