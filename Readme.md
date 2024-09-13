## [Go to Advance Bash scripting](./bash_script/Readme.md)
## [Vim and Admin stuff ](./Admin/Readme.md)
<hr/>
<hr/>

# Important Linux Commands I Love to Use ❤️

<hr/>
<hr/>

## Navigate to Specific Location

### `cd /mnt/c/Users/userName/Desktop` - Move to Desktop
```bash
cd /mnt/c/Users/userName/Desktop
```
<hr/>
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
<hr/>

## See Content of a File

### `cat file1` - Display the content of file1.txt
```bash
cat file1.txt
```
<hr/>
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
<hr/>

## Filters (grep)
### `grep declare Readme.md` print all lines on this file has 'declare' on it
### `grep -n` print also the line numbers `-i` ignore case sensetive 

<hr/>

## wc (wordCount)
```bash
wc Readme.md # output: 155  550 3340 Readme.md 
# there is 155 lines with 550 words with 3340 characters on this file
```
### you can use `-l` to print only the lines number or
### `-w` for words number `-c` for characters number

<hr/>
<hr/>

## sed (stream editor) (overwrite files)
### so powerfull command used on so many things 
### **`Replacment`**
```bash
sed '0,/world/s/world/girgis/' file1
# change first occurrence of 'world' in the entire file with 'girgis'

sed '/pattern/{s/old/new/g}' filename.txt  
# Replaces only in lines matching 'pattern'

sed '0,/pattern/{s/pattern/replacement/; s/pattern/replacement/; s/pattern/replacement/}' filename.txt
#  replace only the first three occurrences of a pattern in a file

sed '2,4s/pattern/replacement/' filename.txt  
# Only replace all accourences in lines 2 to 4 

sed -i 's/old/new/g' filename.txt
# Modify a file directly without the need to redirect output

sed 's/world/girgis/' file1 
# change first occurrence of 'world' on each line with 'girgis' 

sed 's/world/girgis/g' file1 
# change all occurrence of 'world' on each line with 'girgis' 

sed 's/[0-9]/#/g' filename.txt  
# Replaces all digits from 0 to 9 with '#'
```
### **`Deleting`**
```bash
sed '3d' filename.txt  
# Deletes the 3rd line

sed '/pattern/d' filename.txt  
# Deletes lines containing 'pattern'

sed '2,4d' filename.txt  
# Deletes lines 2 to 4

```
### **`Insert & Append`**

```bash
sed '3i\New line of text' filename.txt  
# Inserts before line 3

sed '/pattern/i\New line of text' filename.txt
# Inserts before lines matching 'pattern'

sed '3a\New line of text' filename.txt  
# Appends after line 3

sed '/pattern/a\New line of text' filename.txt 
# Appends after lines matching 'pattern'

```

### **`Print`**

```bash
sed -n '3p' filename.txt 
# Prints only the 3rd line

sed -n '/pattern/p' filename.txt
# Prints only lines matching 'pattern'

sed -n '2,4p' filename.txt
# Prints lines 2 to 4
```

<hr/>
<hr/>


## awk (print specific things)
### **`print`**

```bash
awk '{print $1 $2}' file1 
# print first,second row 

awk '/pattern/' filename.txt  
# Prints lines containing 'pattern'

awk '!/pattern/' filename.txt  
# Prints lines not containing 'pattern'

awk '/ello world/{print $0}' file1 
# print any line conatin 'ello world'

awk 'NR==3' filename.txt  
# Prints the third line

awk '{print $3 ", " $1}' filename.txt  
# Prints third and first fields, separated by a comma

```

### **`Calculations`**

```bash
awk '{sum = $2 + $3; print sum}' lines.txt
# sum second column with third column on each line (if columns are numbers)

awk '{sum += $2; count++} END {print sum/count}' filename.txt 
# Averages the second column

```

### **`Filter`**

```bash

awk '$3 > 50' filename.txt 
# Prints lines where the third field is greater than 50

awk 'length($1) > 5' filename.txt  
# Prints lines where the first field is longer than 5 characters

```
### **`Replace & String Operations`**

```bash
awk '{gsub(/old/, "new"); print}' filename.txt  
# Replaces 'old' with 'new' globally in each line

awk '{print substr($1, 1, 3)}' filename.txt 
# Prints the first 3 characters of the first field

awk '{print toupper($0)}' lines.txt  
# Converts all text to uppercase

```

### **`awk Conditions & Loops`**

```bash
awk '{if ($3 > 50) print $0; else print "Less than 50"}' filename.txt  
# Prints message based on condition

awk '{for (i=1; i<=NF; i++) print $i}' filename.txt
  # Prints each field in each line on a new line

```


<hr/>
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
<hr/>

## stat (statistics)
### give you all information about specific file like when it modify when access when it Create
```bash
stat file1
```

<hr/>
<hr/>

## find (find any file anywhere)
```bash
find . -type f -name R*.md
# find on the current directory any file 
# start with R and no matter what number of charachters are in 
# it's name but it end with .md 
find . -type f -name R??.md
# the name must be 3 letters start with R

```

<hr/>
<hr/>

## compress files & folders

```bash
gzip file1 # convert it to file1.txt.gz
gzip -d file1 # return to normal
gzip -k file1 # make compress copy of it the original stay the same 

```
<hr/>
<hr/>

## Shell scripring
```bash
nano my_shell_file.sh
# put into it #!/bin/bash echo "hello";echo "world"; echo "from shell"
#make it excutable
chmod +x my_shell_file.sh
# excute it
sh my_shell_file.sh
#output  hello world from shell

```
### python code on the shell file
```bash
#!/usr/bin/python3
print("Hello python from shell script")
```
<hr/>
<hr/>

## short circuits

```bash
false || echo "this mean the first command fail"
# output: this mean the first command fail

true && echo "this mean the first command succeed"
# output: this mean the first command succeed

echo "first line" && echo "second line"
#output: first line second line
```

<hr/>

<hr/>

## functions

```bash 

Hello () {
    echo "Hello Functions!"
}

Hello


function Hello () {
    echo "Hello Functions!"
    # timestmp
    return 0
}

function timestmp (){
    echo "The time now is $(date +%m/%d/%y" "%R)"
}

Hello

echo $? 

```


<hr/>
<hr/>

## Read Input

```bash
echo "What is your name?"
read name
echo "Hello, $name!"
# or printing some text before take the input
read -p "What is your name? " name
echo "Hello, $name!"
# or do not display what i typing -s secret
echo "What is your password?"
read -sp "password: " password
echo "Hello, $password!"
```

<hr/>
<hr/>

### **`loops`**

```bash
for integer in 1 2 3 4 5 6 7 8 9 10
    do 
        echo $integer
    done
# output : 1 2 3 4 5 6 7 8 9 10

for word in some string statement
    do
        echo $word
    done
# output : some string statement

for i in $(ls /etc/); 
    do
        echo $i 
    done

i=0
while [ $i -le 10 ] 
    do
        echo $i
        ((i++))
    done

```

<hr/>
<hr/>

## Conditions

```bash

if [ 'garma' = 'garma' ]; then
   echo expresion evaluate as true
fi

read -p "Enter a number: " i

if (( i % 2 == 0 )); then
    echo "$i is even"
fi


if ! [[ "$i" =~ ^[0-9]+$ ]]; then  # check if the input is an integer
    echo "Error: Not an integer"
    exit 1
else
    if (( i % 2 == 0 )); then # check if even or odd
        echo "$i is even"
    else 
        echo "$i is odd"
    fi
fi
```
## Simple programms

```bash
read -p "Enter a number: " i

# check if the input is an integer
function is_int(){
    if [[ "$i" =~ ^[0-9]+$ ]]; then
        return 0
    else
        return 1
    fi
}

if is_int ; then  # check if the input is an integer
    if (( i % 2 == 0 )); then # check if even or odd
        echo "$i is even"
    else 
        echo "$i is odd"
    fi
else
    echo "Error: Not an integer"
fi

```

<hr/>
<hr/>

## variables sympols

```bash
r = Girgis
echo ${r} # Girgis
echo ${#r} # 6   # the length
echo ${(U)r} # GIRGIS  #upper case
echo ${(L)r} # girgis  #lower case 

```


