## [Back to Main Readme](../Readme.md)
## [Network And Admin stuff](../Admin/Readme.md)

<hr/>
<hr/>

# Advanced Bash Scripting 
<hr/>

## handle vars on different ways
#### using `let`
```bash
a=5
b=3
let sum=a+b
echo $sum #output 8

```
#### using `(())` Arithmetic Expansion

```bash
a=4
b=5

result=$((a*b)) #output 20
echo $result
```
#### using `expr` command 
```bash
a=700
b=300

add=$(expr $a+$b) #add=1000
# or simply use 
echo $(expr $a + $b) #output 1000
```
#### using `bc` handle floating point numbers and string numbers

```bash

echo "5.2 + 3.4" | bc # output: 8.6
echo "a = 4.2;b = 5.8;a * b" | bc #output : 24.3
# control the number of fraction zeros
echo "scale=4; (5 + 3) / 2" | bc #output : 4.0000
# Use math lib
echo "scale=4; sqrt(2)" | bc -l # -l stand for library
# output : 1.4142
```
| Function  | Example Usage                        | Description                                         |
|:---------:|:-------------------------------------|:----------------------------------------------------|
| `sqrt(x)` | `echo "sqrt(16)" \| bc -l`           | Square root of `x`                                  |
| `s(x)`    | `echo "s(0)" \| bc -l`               | Sine of `x` (x in radians)                          |
| `c(x)`    | `echo "c(0)" \| bc -l`               | Cosine of `x` (x in radians)                        |
| `a(x)`    | `echo "a(1)" \| bc -l`               | Arc tangent of `x` (in radians)                     |
| `l(x)`    | `echo "l(10)" \| bc -l`              | Natural logarithm of `x`                            |
| `e(x)`    | `echo "e(1)" \| bc -l`               | Exponential function of `x` (e^x)                   |
| `p(x)`    | `echo "p(2)" \| bc -l`               | Base-10 logarithm of `x` (log10(x))                 |
| `i(x)`    | `echo "i(1)" \| bc -l`               | Inverse tangent (arctangent) of `x`                 |
| `j(n,x)`  | `echo "j(2,1)" \| bc -l`             | Bessel function of the first kind of order `n` and argument `x` |
| `x^y`     | `echo "2^3" \| bc -l`                | Exponentiation, `x` raised to the power of `y`      |


<hr/>
<hr/>

##  Bash Conditional Operators
```bash
parma1=$1 
parma1=$2 
if [[ $1 -lt $2 && $2 -ne $1 ]]
then echo "the numbers not equal and $2 bigger than $1 of course"
else echo "the numbers are equal or $1 bigger than $2"
fi
# one line if 
if [[ 300 -eq 300 ]]; then echo "equal"; else echo not equal; fi
```
| Operator | Example                                   | Meaning                                    |
|:--------:|:-----------------------------------------:|:-------------------------------------------|
| `-eq`    | `[ "$a" -eq "$b" ]`                       | True if `a` is equal to `b`                |
| `-ne`    | `[ "$a" -ne "$b" ]`                       | True if `a` is not equal to `b`            |
| `-lt`    | `[ "$a" -lt "$b" ]`                       | True if `a` is less than `b`               |
| `-le`    | `[ "$a" -le "$b" ]`                       | True if `a` is less than or equal to `b`   |
| `-gt`    | `[ "$a" -gt "$b" ]`                       | True if `a` is greater than `b`            |
| `-ge`    | `[ "$a" -ge "$b" ]`                       | True if `a` is greater than or equal to `b`|
| `<`      | `[ "$a" < "$b" ]`                         | True if string `a` is lexicographically less than `b` |
| `<=`     | `[ "$a" <= "$b" ]`                        | True if string `a` is lexicographically less than or equal to `b` |
| `>`      | `[ "$a" > "$b" ]`                         | True if string `a` is lexicographically greater than `b` |
| `>=`     | `[ "$a" >= "$b" ]`                        | True if string `a` is lexicographically greater than or equal to `b` |
| `=`      | `[ "$a" = "$b" ]`                         | True if strings `a` and `b` are equal       |
| `!=`     | `[ "$a" != "$b" ]`                        | True if strings `a` and `b` are not equal   |
| `-z`     | `[ -z "$a" ]`                             | True if `a` is an empty string              |
| `-n`     | `[ -n "$a" ]`                             | True if `a` is a non-empty string           |
| `-e`     | `[ -e "$file" ]`                          | True if `file` exists                      |
| `-f`     | `[ -f "$file" ]`                          | True if `file` is a regular file           |
| `-d`     | `[ -d "$dir" ]`                           | True if `dir` is a directory               |
| `-r`     | `[ -r "$file" ]`                          | True if `file` is readable                 |
| `-w`     | `[ -w "$file" ]`                          | True if `file` is writable                 |
| `-x`     | `[ -x "$file" ]`                          |  True if `file` is executable               |
| `-s`     | `[ -s "$file" ]`                          | True if `file` is not empty                |
| `-L`     | `[ -L "$file" ]`                          | True if `file` is a symbolic link          |
| `&&`     | `[ "$a" -eq "$b" ] && [ "$c" -eq "$d" ]`  | True if both conditions are true           |
| `||`     | `[ "$a" -eq "$b" ] || [ "$c" -eq "$d" ]`  | True if at least one condition is true     |
| `!`      | `[ ! -e "$file" ]`                        | True if `file` does not exist              |

<hr/>
<hr/>

## Bash Built-in Variables
```bash
ls 
echo $? # output 0 success
ls /msc # i do not have that directory
echo $? #output 2 fail 
```
### check what numbers mean on `$?`
| Exit Status Code  | Meaning                                                         |
|:------------------|:---------------------------------------------------------------|
| 0                 | Success. The command executed successfully without any errors. |
| 1                 | General error.                                                 |
| 2                 | Misuse of shell builtins (e.g., missing keyword, incorrect command syntax). |
| 126               | Command invoked cannot execute (e.g., permission problem).     |
| 127               | Command not found (e.g., command does not exist in the path).  |
| 128               | Invalid argument to exit (e.g., exit with a non-numeric value).|
| 128+n             | Command terminated by signal `n` (e.g., `130` indicates termination by `SIGINT`, typically triggered by `Ctrl+C`). |
| 255               | Exit status out of range. 


<hr/>

| Variable | Example Usage                      | Description                                       |
|:--------:|:-----------------------------------|:--------------------------------------------------|
| `$?`     | `echo $?`                           | Exit status of the last command                   |
| `$$`     | `echo $$`                           | Process ID of the current shell                   |
| `$!`     | `echo $!`                           | Process ID of the last background command         |
| `$#`     | `echo $#`                           | Number of positional parameters passed to a script |
| `$0`     | `echo $0`                           | Name of the script or shell                       |
| `$1`, `$2`, ..., `$N` | `echo $1` | First, second, ..., Nth positional parameters   |
| `$@`     | `echo "$@"`                         | All positional parameters as separate words       |
| `$*`     | `echo "$*"`                         | All positional parameters as a single word        |
| `$-`     | `echo $-`                           | Current options set for the shell                 |
| `$_`     | `echo $_`                           | Last argument of the last command                 |
| `$IFS`   | `echo $IFS`                         | Internal Field Separator                         |



<hr/>
<hr/>


# Text processors Commands
## **`awk`**
### `awk options 'selection _criteria {action }' input-file > output-file`

```bash 
 awk '{print}' employee.txt
# ajay manager account 45000
# sunil clerk account 25000
# varun manager sales 50000
# amit manager account 47000
# tarun peon sales 15000
# deepak clerk sales 23000
# sunil peon sales 13000
# satvik director purchase 80000 

awk '/manager/ {print}' employee.txt 
# ajay manager account 45000
# varun manager sales 50000
# amit manager account 47000 

awk '{print $1,$4}' employee.txt 

# ajay 45000
# sunil 25000
# varun 50000
# amit 47000
# tarun 15000
# deepak 23000
# sunil 13000
# satvik 80000 

awk '{print NR,$0}' employee.txt 

# 1 ajay manager account 45000
# 2 sunil clerk account 25000
# 3 varun manager sales 50000
# 4 amit manager account 47000
# 5 tarun peon sales 15000
# 6 deepak clerk sales 23000
# 7 sunil peon sales 13000
# 8 satvik director purchase 80000

awk 'NR==3, NR==6 {print NR,$0}' employee.txt 

# 3 varun manager sales 50000
# 4 amit manager account 47000
# 5 tarun peon sales 15000
# 6 deepak clerk sales 23000 

awk '{print NR "- " $1 }' geeksforgeeks.txt 
# line number - first column

# 1 - A
# 2 - Tarun
# 3 – Manav    
# 4 - Praveen

#longest line presented on the file
awk '{ if (length($0) > max) max = length($0) } END { print max }'
# 13

#count lines on the file
$ awk 'END { print NR }' geeksforgeeks.txt 

#print only lines with more than 10 chars
awk 'length($0) > 10' geeksforgeeks.txt 

#print line contain on the third column "B6"
awk '{ if($3 == "B6") print $0;}' geeksforgeeks.txt


# functional without files
awk 'BEGIN { for(i=1;i<=6;i++) print "square of", i, "is",i*i; }' 
# square of 1 is 1
# square of 2 is 4
# square of 3 is 9
# square of 4 is 16
# square of 5 is 25
# square of 6 is 36




```
## **`sort`** and **`uniq`**

```bash 
sort Readme.md
#output file content sorted
sort -r Readme.md
#sort on reverse order
sort -k2 Readme.md
#sort by the column number 2
uniq Readme.md
#uniq remove if there is two lines same
#but must the two lines directly after each other
# so normally we use sort before uniq


```










       