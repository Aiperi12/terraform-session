#!/bin/bash
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
echo 'Application version 1 is running' >> /var/www/html/index.html