# Important Linux Commands I Love to Use ❤️

<hr/>

## Navigate to Specific Location

### `cd /mnt/c/Users/userName/Desktop` - Move to Desktop
```bash
cd /mnt/c/Users/userName/Desktop
```
<hr/>

## Create & Delete Files

### `touch file1` - Create file1.txt
```bash
touch file1.txt
```

### `rm file1` - Remove file1.txt
```bash
rm file1.txt
```
<hr/>

## Create & Delete Directory

### `mkdir dirName` - Create a directory
```bash
mkdir dirName
```

### `rm -r dirName` - Delete a directory
```bash
rm -r dirName
```
<hr/>

## See Content of a File

### `cat file1` - Display the content of file1.txt
```bash
cat file1.txt
```
<hr/>

## Copy File/Folder to Another Path

### `cp path anotherPath` - Move a file
```bash
cp path anotherPath
```

### `cp -r path anotherPath` - Move a folder
```bash
cp -r path anotherPath
```
<hr/>

## Move (Cut) File/Folder to Another Path

### `mv path anotherPath` - Move files inside a directory or move a directory inside another directory
```bash
mv path anotherPath
```

### `mv oldFileName.txt newFileName.txt` - Change the file name (works on directories)
```bash
mv oldFileName.txt newFileName.txt
```
<hr/>

## Regex The {} and [] on Linux

### `(command) file{1..11}.txt` - Command: touch - Create 11 files named file1, file2, ..., file11
```bash
(command) file{1..11}.txt
```

### `ls file{5..8}` - Show files from file5 to file8
```bash
ls file{5..8}
```

### `ls file*` - Output anything starting with file
```bash
ls file*
```

### `ls file[!2]` - Show all files except file2
```bash
ls file[!2]
```

### `ls file[0-9][0-9]` - Output each file named like file12 or file99
```bash
ls file[0-9][0-9]
```
<hr/>

## Declare and Use Variables on Linux

### `myname='girgis'` - Assign a value to the variable 'myname'
```bash
myname='girgis'
```

### `echo ${myname}` - Print the value of the variable 'myname'
```bash
echo ${myname}
```

### `echo ${myname-thisVariableIsNotExist}` - Print the value of the variable 'myname', or print 'thisVariableIsNotExist' if the variable is not set
```bash
echo ${myname-thisVariableIsNotExist}
```
### you can give it value will be asign on run time
```bash
var3=$[1+2]
echo ${var3} # 3
```
### or  
```bash
var4=$(date)
echo ${var4} # Sat Aug 31 18:05:27 EEST 2024
```
### excute multiple commands on the same line
```bash
echo $var1; ls
```
### declare global variables with data types
```bash
declare -i num=10 # i stand for integer
declare str='Garma' # the default
declare -a arr=(1 2 3 4) # -a for array
echo ${arr[0]}  # Output: 1
echo ${arr[@]}  # Output: 1 2 3 4 5
declare -A assoc-arr=([key1]='value1' [key2]='value')
echo ${assoc_arr[key1]}  # Output: value1
echo ${!assoc_arr[@]}    # Output: key1 key2 (keys)
echo ${assoc_arr[@]}     # Output: value1 value2 (values)
```

### save the output of a command in file
```bash
echo $(date) > newestDate # overwrite the file content with cur date
echo $(date) >> allDates  # append and add to it  the cur date
```

<hr/>

## Filters (grep)
### `grep declare Readme.md` print all lines on this file has 'declare' on it
### `grep -n` print also the line numbers `-i` ignore case sensetive 
### `-v` give me all lines without 'declare' `-c` give me count of 'declare' on the file/s
<hr/>

## Filters (head & tail)
### `head` show to you the first 10 lines on file `tail` show last 10 lines
```bash
head Readme.md
tail -20 Readme.md # print last 20 lines
```
<hr/>

## wc (wordCount)
```bash
wc Readme.md # output: 155  550 3340 Readme.md 
# there is 155 lines with 550 words with 3340 characters on this file
```
### you can use `-l` to print only the lines number or
### `-w` for words number `-c` for characters number

<hr/>

## sed (stream editor) (overwrite files)
```bash
sed '0,/world/s/world/girgis/' file1
# change first occurrence of 'world' in the entire file with 'girgis'
sed 's/world/girgis/' file1 
# change first occurrence of 'world' on each line with 'girgis' 
sed 's/world/girgis/g' file1 
# change all occurrence of 'world' on each line with 'girgis' 
```
<hr/>

## awk (print specific things)
```bash
awk '{print $1}' file1 # print first row 
awk '{print $1 $2}' file1 # print first,second row 
awk '/ello world/{print $0}' file1 # print any line conatin 'ello world'
```

<hr/>

## pipes -> |  
### Take output of cur command make it input to next command
```bash
head -50 Readme.md | grep insert
# on first 50 lines of readme print all lines contain insert

head -50 Readme.md | grep insert | wc -l
# tell me how many lines has 'insert' on it on 
# the first 50 lines of Readme.md file

```
<hr/>

## pipes with tr (transform or translate)
```bash 
echo "this iss a test 123 !" | tr -d 's' # -d delete
# output : thi i a tet 123 !
echo "this iss a test 123 !" | tr -s 's' # -s squeeze any sss -> s
# output : this is a test 123 !
echo "this iss a test 123 !" | tr [i] [I]
#output :thIs Iss a test 123 !
echo "this iss a test 123 !" | tr [a-z] [A-Z]
#output :THIS ISS A TEST 123 !
echo "this iss a test 123 !" | tr [:lower:] [:upper:]
#output :THIS ISS A TEST 123 !
echo "this iss a test 123 !" | tr -d [:digit:]
#output: this iss a test ! 
echo "this iss a test 123 !" | tr [:digit:] 'z'
#output: this iss a test zzz ! 
```
<hr/>

## pipes with cut
```bash
echo "This is string of words" | cut -c 1,6-15 #first letter and from 6-15 inclusive
# Tis string 
echo "This is string of words" | cut -f 1 -d " " # -f field and -d delimiter
# output:This
echo "This:is:string:of:words" | cut -f 3,4 -d ":" # filed number 3&4  each field end with ':'
#output : string:of

```

<hr/>

## stat (statistics)
### give you all information about specific file like when it modify when access when it Create
```bash
stat file1
```

## find (find any file anywhere)
```bash
find . -type f -name R*.md
# find on the current directory any file 
# start with R and no matter what number of charachters are in 
# it's name but it end with .md 
find . -type f -name R??.md
# the name must be 3 letters start with R

```

## compress files & folders

```bash
gzip file1 # convert it to file1.txt.gz
gzip -d file1 # return to normal
gzip -k file1 # make compress copy of it the original stay the same 

```








