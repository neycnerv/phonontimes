#!/bin/bash

 word=$(echo | grep "Direct configuration=" XDATCAR | tail -1 ) #locate number of atoms
# echo "$word"

 m=$(echo $word | sed 's/[^0-9]*//g') #also works
 m="${word//[!0-9]/}" #get number of atoms 
 echo "number of Images is $m"
 h=9
 n=8

 >POSITIONs

 for (( i=1; i<=$m; i++ ))
# for i in {1..5}
 do
   a=$((h+(i-1)*(n+1)))
   b=$((a+n-1))
   c=($a,$b'p')  
   echo "COPY Image $i"
   sed -n $c XDATCAR >> POSITIONs
 done

