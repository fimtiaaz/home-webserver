#!/bin/bash
# Install and start Apache web server

echo "Installing Apache (httpd)..."
yum install httpd -y

echo "Enabling and starting Apache service..."
systemctl enable httpd
systemctl start httpd

echo "Allowing HTTP service in firewalld..."
firewall-cmd --add-service=http --permanent
firewall-cmd --reload

echo "Apache web server setup complete."

