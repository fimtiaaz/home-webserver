# CentOS 7 Static Web Server

This project automates the setup of a static web server on CentOS 7 using Apache.

## Structure

- `scripts/01-static-dns.sh`: Sets static DNS and locks `/etc/resolv.conf`
- `scripts/02-install-apache.sh`: Installs and starts Apache, opens firewall
- `scripts/03-deploy-website.sh`: Clones and deploys static website to Apache root

## Usage

Run the scripts in order:

```bash
cd centos7-home-webserver

sudo bash scripts/01-static-dns.sh
sudo bash scripts/02-install-apache.sh
sudo bash scripts/03-deploy-website.sh

