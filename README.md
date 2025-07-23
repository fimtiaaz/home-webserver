# CentOS 7 Static Web Server

This project automates the setup of a static web server on CentOS 7 using Apache.  
It demonstrates key Linux administration skills including service configuration, static content deployment, and firewall setup.

---

## Project Structure

```
centos7-home-webserver/
├── README.md
├── apache-http-server-setup
├── deploy-static-website
├── index.html
├── sample-page/
├── static-dns
├── scripts/
│   ├── 01-static-dns.sh
│   ├── 02-install-apache.sh
│   └── 03-deploy-website.sh
├── css/
├── images/
└── js/
```

---

## Setup Instructions

### 1. Configure Static DNS (Optional)

This sets Google and Cloudflare DNS resolvers and locks DNS config to prevent overwrites.

**Run:**
```bash
sudo bash scripts/01-static-dns.sh
```

What it does:
- Sets `8.8.8.8` and `1.1.1.1` as resolvers in `/etc/sysconfig/network-scripts/ifcfg-enp0s3`
- Updates `/etc/resolv.conf`
- Locks DNS config using:
  ```bash
  chattr +i /etc/resolv.conf
  ```

---

### 2. Install Apache HTTP Server

Installs and configures Apache (httpd), then starts the service and allows HTTP in the firewall.

**Run:**
```bash
sudo bash scripts/02-install-apache.sh
```

What it does:
- Installs `httpd`
- Starts and enables the Apache service
- Runs:
  ```bash
  firewall-cmd --add-service=http --permanent
  firewall-cmd --reload
  ```

---

### 3. Deploy Static Website

Clones the project repo (if needed) and copies static web content (HTML, CSS, JS, images) to Apache root directory.

**Run:**
```bash
sudo bash scripts/03-deploy-website.sh
```

What it does:
- Clones the repo to `~/LinuxProjects/centos7-home-webserver`
- Copies:
  - `index.html` → `/var/www/html/`
  - `css/`, `js/`, `images/` → `/var/www/html/`

---

## Verification

To confirm the server is running and content is served:

1. Open a browser
2. Go to `http://<server_ip>`
3. You should see the static page served by Apache

---

## Notes

- Ensure your VM is using a **bridged network** or **NAT with port forwarding**
- SELinux or permission issues may prevent Apache from serving files – verify with `getenforce` and `restorecon -Rv /var/www/html`

---

## License

MIT © Furqan Imtiaz

