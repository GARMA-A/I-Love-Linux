# Important Linux Commands I Love to Use ❤️
## Navigate to Specific Location

### `cd /mnt/c/Users/userName/Desktop` - Move to Desktop
```bash
cd /mnt/c/Users/userName/Desktop
```

## Create & Delete Files

### `touch file1` - Create file1.txt
```bash
touch file1.txt
```

### `rm file1` - Remove file1.txt
```bash
rm file1.txt
```

## Create & Delete Directory

### `mkdir dirName` - Create a directory
```bash
mkdir dirName
```

### `rm -r dirName` - Delete a directory
```bash
rm -r dirName
```

## See Content of a File

### `cat file1` - Display the content of file1.txt
```bash
cat file1.txt
```

## Copy File/Folder to Another Path

### `cp path anotherPath` - Move a file
```bash
cp path anotherPath
```

### `cp -r path anotherPath` - Move a folder
```bash
cp -r path anotherPath
```

## Move (Cut) File/Folder to Another Path

### `mv path anotherPath` - Move files inside a directory or move a directory inside another directory
```bash
mv path anotherPath
```

### `mv oldFileName.txt newFileName.txt` - Change the file name (works on directories)
```bash
mv oldFileName.txt newFileName.txt
```

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
```



