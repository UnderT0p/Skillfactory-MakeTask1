#!/bin/bash
#забираем данные из переменной
source ~/Skillfactory-MakeTask1/usernameAndmachine
#скачавем зеркало сайта
sudo wget --mirror -p --convert-links -P ~/Skillfactory-MakeTask1 https://www.chiark.greenend.org.uk/~sgtatham/bugs.html
#удаляем на локальном сервере данные о зеркале
ssh $user sudo rm ~/Skillfactory-MakeTask1/htmlForBugs/*
#передаем новые данные сайта на локальный сервер
sudo scp -r ~/Skillfactory-MakeTask1/www.chiark.greenend.org.uk/~sgtatham/* $user:~/Skillfactory-MakeTask1/htmlForBugs/
#удаляем зеркало сайта на первой машине
sudo rm -fr ~/Skillfactory-MakeTask1/www.chiark.greenend.org.uk/~sgtatham
