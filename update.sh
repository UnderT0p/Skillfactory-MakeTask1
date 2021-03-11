sudo wget --mirror -p --convert-links -P ~/Skillfactory-MakeTask1 https://www.chiark.greenend.org.uk/~sgtatham/bugs.html
ssh $1 sudo rm ~/Skillfactory-MakeTask1/htmlForBugs/*
sudo scp ~/Skillfactory-MakeTask1/www.chiark.greenend.org.uk/~sgtatham $1:~/Skillfactory-MakeTask1/htmlForBugs
ssh $1 sudo docker stop test3
ssh $1 sudo docker rm test3
ssh $1 sudo docker run --name test3 -d -p 8080:80 -v ~/Skillfactory-MakeTask1/htmlForBugs://usr/share/nginx/html:ro -v ~/Skillfactory-MakeTask1/nginxDoc.conf://etc/nginx/nginx.conf:ro nginx
