#!/bin/bash
#забираем данные из переменной
source ~/Skillfactory-MakeTask1/usernameAndmachine
#скачавем зеркало сайта
sudo wget --mirror -p --convert-links -P ~/Skillfactory-MakeTask1 https://www.chiark.greenend.org.uk/~sgtatham/bugs.html
#удаляем на локальном сервере данные о зеркале
ssh $user sudo rm ~/Skillfactory-MakeTask1/htmlForBugs/*
#передаем новые данные сайта на локальный сервер
sudo scp -r ~/Skillfactory-MakeTask1/www.chiark.greenend.org.uk/~sgtatham/* $user:~/Skillfactory-MakeTask1/htmlForBugs/
#останавливаем запущенный контейнер
ssh $user sudo docker stop test3
#удаляем контейнер
ssh $user sudo docker rm test3
#запускаем новый контейнер с новыми данными сайта
ssh $user sudo docker run --name test3 -d -p 8080:80 -v ~/Skillfactory-MakeTask1/htmlForBugs://usr/share/nginx/html:ro -v ~/Skillfactory-MakeTask1/nginx.conf://etc/nginx/nginx.conf:ro nginx
