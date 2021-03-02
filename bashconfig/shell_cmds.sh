#!/bin/sh

# Some useful commands:

gcc -Wall code_file.c -o executemoi // Compile the code_file.c file.
./executemoi // Run the compiled file.

gcc --version // version of gcc.


pwd // Print the working directory.

cd Documents // change the working directory to Documents.

cd - // goes back to previous working directory.
cd -- // goes further back.

ls // shows the folders and files in the working directory.

// show all files in the current directory, along with their size in (bytes).
ls -al

mkdir // create a folder.

> machin.txt // create a file.


// Creates 'filename' with 'content' inside, or append said content if it already exists. Append an ending '\n' !!!
echo "content" >> filename

// Same, but without the ending '\n'.
echo -n "content" >> filename

sudo service network-manager restart

find <dirname> -iname <filename>
>
>>
whereis
grep -ir 'something' .

# Checking on ports etc:
sudo netstat -nlpt | grep 3306

# Or:
sudo ss -tulpn | grep :3456

# Seek and replace:
sed -i 's/Andrew/James/g' /home/some_file.txt

# Or even:
grep -rl folder . | xargs sed -i s@folder@directory@g

df -h
du -h <dir>

sudo vi /etc/apt/sources.list.d/additional-repositories.list
dpkg --list

history 50 | grep commandUsed

# Removing untagged docker images:
sudo docker rmi -f $(sudo docker images -aq --filter "dangling=true" --no-trunc)

# Prevent a package from getting updated:
sudo apt-mark hold openjdk-11-jre
