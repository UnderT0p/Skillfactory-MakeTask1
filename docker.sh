#!/bin/bash
source ~/Skillfactory-MakeTask1/usernameAndmachine
sudo docker pull nginx
sudo docker save -o ~/Skillfactory-MakeTask1/nginxImage.tar nginx
ssh $user mkdir ~/Skillfactory-MakeTask1
ssh $user mkdir ~/Skillfactory-MakeTask1/htmlForBugs
sudo scp ~/Skillfactory-MakeTask1/nginxImage.tar $user:~/Skillfactory-MakeTask1
sudo scp -r ~/Skillfactory-MakeTask1/www.chiark.greenend.org.uk/~sgtatham $user:~/Skillfactory-MakeTask1/htmlForBugs
sudo scp ~/Skillfactory-MakeTask1/nginxDoc.conf $user:~/Skillfactory-MakeTask1/nginxDoc.conf
ssh $user sudo docker load -i ~/Skillfactory-MakeTask1/nginxImage.tar
ssh $user sudo docker run --name test3 -d -p 8080:80 -v ~/Skillfactory-MakeTask1/htmlForBugs://usr/share/nginx/html:ro -v ~/Skillfactory-MakeTask1/nginxDoc.conf://etc/nginx/nginx.conf:ro nginx
