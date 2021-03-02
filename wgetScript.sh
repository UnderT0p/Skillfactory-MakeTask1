#!/bin/bash
wget --mirror -p --convert-links -P $* https://www.chiark.greenend.org.uk/~sgtatham/bugs.html
mv $*/www.chiark.greenend.org.uk/~sgtatham/bugs.html /home/ansible/task1/www.chiark.greenend.org.uk/~sgtatham/index.html
