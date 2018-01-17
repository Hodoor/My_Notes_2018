#! /bin/bash 

#print
echo "Hello World !"

#define variable，等号两边不能有空格，取变量时使用$，或者${}
your_name=xiaoming
your_age=18
echo $your_name
#equals
echo ${your_name}

#define read only variable
readonly your_sex=male

#delete variable.readonly variable can't delete
unset your_age

your_sex=female
echo "I am $your_name, I'm ${your_age} and ${your_sex}"

#string
string1="abcdefgh"
string2="qwertyuiop"

#string link
echo $string1$string2

#string length
echo ${#string1}
echo ${#string2}

#get sub_string. 0 is the first,-1 is uncorrect will show all string
echo ${string1:1:4}
echo ${string2:0:5}

#find sub_string location
string3="Hi, I am coming !"
echo `expr index "$string3" is`

#define list
list1=(1 2 3 4 53)

#print mem of list
echo ${list1[1]}
#print all the list
echo ${list1[@]}

#get list length
echo ${#list1[@]}
#equls
echo ${#list1[*]}

#get mem of list length
echo ${#list1[4]}

#    #、## 表示从左边开始删除。一个 # 表示从左边删除到第一个指定的字符；两个 # 表示从左边删除到最后一个指定的字符。
#    %、%% 表示从右边开始删除。一个 % 表示从右边删除到第一个指定的字符；两个 % 表示从左边删除到最后一个指定的字符。
#    删除包括了指定的字符本身。
var=http://www.baidu.com/login.html
echo ${var#*/}
echo ${var##*/}
echo ${var%/*}
echo ${var%%/*}
echo ${var:0:5}
echo ${var:7}
echo ${var:0-7:3}
echo ${var:0-7}

my_array=(A B "C","D" ef)

echo '--for loop ---'
for i in ${my_array[@]}
do 
  echo $i
done

echo "---while loop---"
j=0
while [ $j -lt ${#my_array[@]} ]
do
  echo ${my_array[$j]}
  let j++
done

echo "---while loop---"
m=0
while [ $m -lt ${#my_array[@]} ]
do
  echo ${my_array[$m]}
  let m+=1
done

testFunction(){
echo "It's my first function"
}
testFunction

functionWithReturn(){
echo "input first num"
read first_num
echo "input second num"
read second_num
return $(($first_num+$second_num))
}
functionWithReturn
echo "sum is $? "

#引用其他脚本文件，注意两个.号要有空格
. ./test.sh
echo "url is: $url"
