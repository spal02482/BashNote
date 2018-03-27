#!/bin/bash
arr=(1 2)
source file3.sh
func ${arr[@]}
r=$?
echo $r
echo ${arr[0]} ${arr[1]}
