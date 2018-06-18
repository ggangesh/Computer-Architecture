load=$(cat $1 | grep  ": lw" | wc -l)
#echo $load
store=$(cat $1 | grep ": sw" | wc -l)
#echo $store
branch=$(cat $1 | grep ": b" | wc -l)
#echo $branch
total=$(cat $1 | grep ";" | wc -l)
#echo $total
other=0
let other=total-load-store-branch
#echo $other
let load*=5
#echo $load
let store*=4
#echo $store
let branch*=3
#echo $branch
let other*=4
#echo $other
echo "Number of cycles for single cycle datapath: "
echo $total
let multi=load+store+branch+other
echo "Number of cycles for multi cycle datapath: "
echo $multi
echo "Ratio of speeds of single cycle to multi cycle considering a clock speed of 5 times for multi cycle: "
let total*=5
echo "scale=10;$total/$multi" | bc