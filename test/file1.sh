add()
{
	p=$1
	q=$2
	let res=$p+$q
	echo "$res"
}
a=3
b=5
result=$(add $a $b)
echo $result

