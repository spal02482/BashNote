#!/bin/bash
func()
{
	arr=($@)
	echo ${arr[0]} ${arr[1]}
	arr[0]=4
	arr[1]=5
	echo ${arr[0]} ${arr[1]}
	return 9
}
