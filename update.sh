#!/bin/bash
source ~/Skillfactory-MakeTask1/usernameAndmachine
sudo wget --mirror -p --convert-links -P ~/Skillfactory-MakeTask1 https://www.chiark.greenend.org.uk/~sgtatham/bugs.html
ssh $user sudo rm ~/Skillfactory-MakeTask1/htmlForBugs/*
sudo scp ~/Skillfactory-MakeTask1/www.chiark.greenend.org.uk/~sgtatham $user:~/Skillfactory-MakeTask1/htmlForBugs
ssh $user sudo docker stop test3
ssh $user sudo docker rm test3
ssh $user sudo docker run --name test3 -d -p 8080:80 -v ~/Skillfactory-MakeTask1/htmlForBugs://usr/share/nginx/html:ro -v ~/Skillfactory-MakeTask1/nginxDoc.conf://etc/nginx/nginx.conf:ro nginx
