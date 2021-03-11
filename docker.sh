#!/bin/bash
#Забираем переменную из файла
source ~/Skillfactory-MakeTask1/usernameAndmachine
#скачиваем последнюю версию nginx
sudo docker pull nginx
#сохраняем image nginx в .tar файл для передачи на локальный сервер
sudo docker save -o ~/Skillfactory-MakeTask1/nginxImage.tar nginx
#создаем директории для работы на локальном сервере
ssh $user mkdir ~/Skillfactory-MakeTask1
#создаем директории для работы на локальном сервере
ssh $user mkdir ~/Skillfactory-MakeTask1/htmlForBugs
#передаем .tar файл на локальный сервер
sudo scp ~/Skillfactory-MakeTask1/nginxImage.tar $user:~/Skillfactory-MakeTask1
#передаем скачанное зеркало сайта на локальный сервер
sudo scp -r ~/Skillfactory-MakeTask1/www.chiark.greenend.org.uk/~sgtatham/* $user:~/Skillfactory-MakeTask1/htmlForBugs/
#передаем конфигурационный файл nginx для корректного отображения зеркала
sudo scp ~/Skillfactory-MakeTask1/nginx.conf $user:~/Skillfactory-MakeTask1/nginx.conf
#преобразуем .tar файл в image для запуска контейнера
ssh $user sudo docker load -i ~/Skillfactory-MakeTask1/nginxImage.tar
#запускаем контейнер с сервисом nginx, передавая в него файлы сайта и конфигурационный файл nginx, на порту :8080
ssh $user sudo docker run --name test3 -d -p 8080:80 -v ~/Skillfactory-MakeTask1/htmlForBugs://usr/share/nginx/html:ro -v ~/Skillfactory-MakeTask1/nginx.conf://etc/nginx/nginx.conf:ro nginx
#удаляем зеркало сайта на первой машине
sudo rm -fr ~/Skillfactory-MakeTask1/www.chiark.greenend.org.uk/~sgtatham
