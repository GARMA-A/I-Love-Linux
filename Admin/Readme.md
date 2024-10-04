## [Back To main Readme](../Readme.md)

## [Go to Advance Bash Scripting](../bash_script/Readme.md)

<hr/>
<hr/>

## **`how to use vi`**

#### you have four modes insert by press `i` and Normal (command mode) by press `etc` `the default`

#### visual mode on the normal mode press v or V

#### to save your changes and quit press `shift+z+z` or `:+w+q` w->write and q->quit

#### `A` insert mode + go to last char on cur line

### to leave without saving `:+q+!`

## **`Insert Mode`**

#### `i` insert mode

#### `A` insert mode + go to last char on cur line

### **`command mode`**

### `ctrl+[` and you in !

| Command                  | What it Does                                                   |
| :----------------------- | :------------------------------------------------------------- |
| `u`                      | undo last changes                                              |
| `dd`                     | delete cur line                                                |
| `:r filePath`            | copy another file content to your cur file                     |
| `:w` or `:w newName.txt` | write(save) to cur file or write cur content to `newName` file |
| `:! linux command`       | type linux command inside vim                                  |
| `w` and `b`              | `w` move word by word on the right `b` left                    |
| `yap` or `dap`           | delete all pargraph or yank all paragraph                      |

<img src="VimMotions.png" width="800" height="400" />

## What the permission numbers mean on the linux systems

| Number | Permission           | Symbol |
|--------|----------------------|--------|
| 0      | No permission         | ---    |
| 1      | Execute               | --x    |
| 2      | Write                 | -w-    |
| 3      | Write & Execute       | -wx    |
| 4      | Read                  | r--    |
| 5      | Read & Execute        | r-x    |
| 6      | Read & Write          | rw-    |
| 7      | Read, Write & Execute | rwx    |

## you  can use them like that 

```bash
chmod 755 myfile.txt
# 7 for owner (read write excute) 5 for group and others can (read excute) onle
```

