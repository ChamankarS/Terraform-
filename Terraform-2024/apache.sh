#! /bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2
echo "<h1> Welcome : CloudBlitz </h1>" > /var/www/html/index.html
