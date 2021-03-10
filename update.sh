sudo wget --mirror -p --convert-links -P /var/www https://www.chiark.greenend.org.uk/~sgtatham/bugs.html
ssh $1 sudo rm -fr ~/htmlForBugs
sudo scp /var/www/www.chiark.greenend.org.uk/~sgtatham $1:~/htmlForBugs
ssh $1 sudo docker stop test3
ssh $1 sudo docker rm test3
ssh $1 sudo docker run --name test3 -d -p 8080:80 -v ~/htmlForBugs://usr/share/nginx/html:ro -v ~/nginxDoc.conf://etc/nginx/nginx.conf:ro nginx
