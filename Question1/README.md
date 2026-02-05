# Question 1 – Shell Script Analysis

Command:
chmod +x analyze.sh

Explanation:
This command gives execute permission to the shell script so that it can be run from the terminal.

Command:
./analyze.sh sample.txt

Explanation:
The script identifies the argument as a file and uses the wc command to display the number of lines, words, and characters in the file.

Command:
./analyze.sh testdir

Explanation:
The script checks that the argument is a directory and counts the total number of files and the number of .txt files present using the find command.

Command:
./analyze.sh wrongpath

Explanation:
Since the specified path does not exist, the script displays an appropriate error message.

