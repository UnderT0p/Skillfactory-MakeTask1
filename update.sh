sudo wget --mirror -p --convert-links -P /var/www https://www.chiark.greenend.org.uk/~sgtatham/bugs.html
sudo scp /var/www/www.chiark.greenend.org.uk/~sgtatham $1:/var/www/html
ssh $1 sudo docker 
ssh $1 sudo docker run --name test3 -d -p 8080:80 -v ~/nginxDoc.conf://etc/nginx/nginx.conf:ro nginx
