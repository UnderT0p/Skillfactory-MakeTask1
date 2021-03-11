#!/bin/bash
sudo docker pull nginx
sudo docker save -o ~/Skillfactory-MakeTask1/nginxImage.tar nginx
ssh $1 mkdir ~/Skillfactory-MakeTask1
ssh $1 mkdir ~/Skillfactory-MakeTask1/htmlForBugs
sudo scp ~/Skillfactory-MakeTask1/nginxImage.tar $1:~/Skillfactory-MakeTask1
sudo scp -r ~/Skillfactory-MakeTask1/www.chiark.greenend.org.uk/~sgtatham $1:~/Skillfactory-MakeTask1/htmlForBugs
sudo scp ~/Skillfactory-MakeTask1/nginxDoc.conf $1:~/Skillfactory-MakeTask1/nginxDoc.conf
ssh $1 sudo docker load -i ~/Skillfactory-MakeTask1/nginxImage.tar
ssh $1 sudo docker run --name test3 -d -p 8080:80 -v ~/Skillfactory-MakeTask1/htmlForBugs://usr/share/nginx/html:ro -v ~/Skillfactory-MakeTask1/nginxDoc.conf://etc/nginx/nginx.conf:ro nginx
