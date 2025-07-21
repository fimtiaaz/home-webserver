#!/bin/bash
# Copy static website files to Apache root

echo "Cloning website repo (if not already cloned)..."
mkdir -p ~/LinuxProjects
cd ~/LinuxProjects

if [ ! -d "centos7-home-webserver" ]; then
    git clone https://github.com/fimtiaaz/centos7-home-webserver.git
fi

echo "Copying site files to /var/www/html..."
cp ~/LinuxProjects/centos7-home-webserver/index.html /var/www/html/
cp -r ~/LinuxProjects/centos7-home-webserver/{css,js,images} /var/www/html/ 2>/dev/null || echo "Some folders may not exist, skipping..."

echo "Website deployed to Apache root."

