## 📦 Python HTTP Server with systemd and Port Change (8080)

### 🔧 Goal

Serve the current directory over HTTP using Python's built-in module on port **8080**, and make it run as a **systemd** service with automatic startup on boot.

---

### 📁 Step-by-Step Setup

#### 1. Create the systemd service file

```bash
sudo nano /etc/systemd/system/python-http.service
```

Paste the following:

```ini
[Unit]
Description=Python HTTP Server on port 8080
After=network.target

[Service]
ExecStart=/usr/bin/python3 -m http.server 8080
WorkingDirectory=/home/fimtiaz/home-webserver
Restart=always
User=fimtiaz

[Install]
WantedBy=multi-user.target
```

> Replace `/home/fimtiaz/home-webserver` with your actual working directory.

---

#### 2. Reload systemd and start the service

```bash
sudo systemctl daemon-reload
sudo systemctl start python-http
sudo systemctl enable python-http
```

---

#### 3. Allow port 8080 through the firewall

```bash
sudo firewall-cmd --permanent --add-port=8080/tcp
sudo firewall-cmd --reload
```

> If you see `ALREADY_ENABLED`, it means the port was already open. You can safely ignore this warning.

---

#### 4. Verify it's working

Check status:

```bash
sudo systemctl status python-http
```

Then open your browser to:

```
http://<your_server_ip>:8080
```

