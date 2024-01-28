问题:

22 至少三个 a 且不以 s 结尾的单词个数

```bash
cat words \
|tr "[:upper:]" "[:lower:]" \
| grep -v "'s$" \
| grep -E '^([^a]*a){3}.*$' \
| wc -l \
```

```bash
cat words \
| tr "[:upper:]" "[:lower:]"\
| grep -v "'s$" | grep -E '^([^a]*a){3}.*$' \
| sed -E 's/^.*(\w\w)$/\1/' \
| sort | uniq -c \
| sort -rnk1,1 \
| head -n3 \
| awk '{print $2}' \
| paste -sd, \
```

共存在多少种词尾的组合

```bash
cat words \
| tr "[:upper:]" "[:lower:]"  \
| grep -v "'s$"  \
| grep -E '^([^a]*a){3}.*$'  \
| sed -E 's/^.*(\w\w)$/\1/'  \
| sort | uniq -c  \
| awk '{print $2}'  \
| wc -l \
```

4. 找出您最近十次开机的开机时间的：

平均数、

```bash
 ssh -p 3022 errorlike@127.0.0.1 journalctl
 | grep ".*\[1\].*Startup finished in.*"
 | tail -n10
 | sed -E 's/^.* = (.*)s.$/\1/'
 | paste -sd+
 | bc -l
 | awk '{print $0/10}'
```

中位数

```bash
 ssh -p 3022 errorlike@127.0.0.1 journalctl
 | grep ".*\[1\].*Startup finished in.*"
 |tail -n10
 | sed -E 's/^.* = (.*)s.$/\1/'
 | paste -s
 | awk '{print ($5+$6)/2}'
```

最长时间。

```bash
ssh -p 3022 errorlike@127.0.0.1 journalctl
| grep ".*\[1\].*Startup finished in.*"
| tail -n10
| sed -E 's/^.* = (.*)s.$/\1/'
| sort | tail -n1
```

5. 提取三次启动信息中的不同信息

```bash
{ journalctl -b -0 && journalctl -b -1 && journalctl -b -2 } \
 | sed -E 's/.*ThinkBook-14p\s//' \
 | sort \
 | uniq -c \
 | awk '$1==1 {print}' \
 | awk '{$1="";print $0}' \
```
