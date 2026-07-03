# Day 2: Making and Running Your First Executable File

## Example
Imagine you write a secret cake recipe on a piece of paper and slip it into a locked notebook. If you hand that notebook to a kitchen blender machine, it won't do anything because the blender doesn't have "permission" or the smarts to unlock the notebook and read it. 

To make it work, you have to turn a key to unlock the notebook (**`chmod +x`**) and then push the start button on the machine (**`./`**) to make it read the instructions one line at a time from top to bottom!

---

## 📖 2. The Definition
In Linux, files are protected by a security gate called **File Permissions**. By default, when you create a plain text file, Linux sets its permissions to read and write only. It deliberately blocks execution to prevent malicious software from running accidentally. 

To run a script, you must explicitly use the **`chmod` (Change Mode)** utility to append the **`+x` (Execute)** flag to the file's security profile. Once granted, using the prefix **`./`** tells the Linux shell terminal interpreter to look inside the local folder directory and execute every command in that file line-by-line sequentially.

---

## 💻 3. DevOps Code Lab Example

Here are the terminal steps to create, modify, and run your first automation list sequence.

### Step A: See what permissions exist right now
Run this command to check your target script file permissions:

```bash
ls -la first.sh
```
<img width="1709" height="902" alt="image" src="https://github.com/user-attachments/assets/adc3a8d9-d1e2-4fe9-acca-49b41a1b25c2" />

* Here we have used the following set of commands into out Text File
```
echo " Hello World "
echo " This is Harsh Thakkar "
pwd
ls
```
* As we know in Scripts, each line is considered as an individual Commands to be executed so each of the above statements are Executed together one after the other

* Through the following Command we can see a list of Files along with their allowed Permissions. Currently by default, our File is not allowed the permission to be Execute
```
ls -la
```
* To make our File Execute we use the following Command
```
chmod +x first.txt
```
* To Execute out File, we use the following Command
```
./first.txt
```
