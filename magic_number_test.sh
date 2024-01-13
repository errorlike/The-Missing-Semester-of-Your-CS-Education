#! /usr/bin/env bash

#  1.执行这个目标脚本。
#  2.循环的终止条件：执行出错。退出码为1
#  3. 记录标准输入和错误的输出到同一个文件中语法 &>
#  4.确认一下&2的作用
#  5.exit1的作用。
count=0
while ./magic_number.sh &>>magic_number.log; do
    ((count = count + 1))
done
cat "./magic_number.log"
echo "在失败前执行了$count次"
