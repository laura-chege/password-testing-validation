
#! /bin/bash
read -s -p "enter the password" st
length=${#st}
num=$( echo $st | grep  "[0-9]" )
num1=$( echo $st | grep "[\@$\#%\&*+-=]" )
if [ $length -ge 8 ] 
then
      if [ "$num" == "$st" ] && [ "$num1" == "$st" ]
    then
  echo "  "
      echo "strong password"
    
    else
echo "   "
     echo "weak password"
     fi
else 
echo "   "
echo "weak password"
fi

#Do a dictionary check on every sequence of at least four consecutive alphabetic characters in the password under test. This will eliminate passwords containing embedded "words" found in a standard dictionary.
for((i=4;i<=${#password};i++))
do
  for((j=0;j<=${#password}-$i;j++))
  do
    if [ `grep -c -E "^${password:$j:$i}$" dict.txt` -gt 0 ]
    then
      echo "$password: $weakString"
      return
    fi
  done