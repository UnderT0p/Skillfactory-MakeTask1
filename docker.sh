#!/bin/bash
sudo docker pull nginx
sudo docker save -o ~/nginxImage.tar nginx
sudo scp ~/nginxImage.tar $1:~/
sudo scp /var/www/www.chiark.greenend.org.uk/~sgtatham $1:/var/www/html
sudo scp ~/nginxDoc.conf $1:~/nginxDoc.conf
ssh $1 sudo docker load -i ~/nginxImage.tar
ssh $1 sudo docker run --name test3 -d -p 8080:80 -v ~/nginxDoc.conf://etc/nginx/nginx.conf:ro nginx
