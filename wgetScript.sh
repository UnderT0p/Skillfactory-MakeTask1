#!/bin/bash
wget --mirror -p --convert-links -P /var/www $* https://www.chiark.greenend.org.uk/~sgtatham/bugs.html

