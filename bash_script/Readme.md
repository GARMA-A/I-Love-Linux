## [Back to Main Readme](../Readme.md)

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
if [ 300 -ne 300 ]
then echo "the numbers not equal"
else echo the numbers are equal
fi
# one line if 
if [ 300 -eq 300 ]; then echo "equal"; else echo not equal; fi
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
### check what numbers mean `$?`
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







