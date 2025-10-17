Here's a comprehensive **README.md** file for your troubleshooting toolkit:


# 🛠️ Simple Troubleshooting Toolkit

A lightweight, user-friendly diagnostic tool for quick system troubleshooting and problem identification. Built with `whiptail` for a clean terminal interface.

## 🚀 Quick Start

```bash
# 1. Download or clone the project
git clone <your-repo-url>
cd troubleshoot-tool

# 2. Make all scripts executable
chmod +x *.sh

# 3. Run the main tool
./troubleshoot.sh
```

## 📁 Project Structure

```
troubleshoot-tool/
├── troubleshoot.sh          # 🏠 Main menu launcher
├── system-health.sh         # 📊 System resource monitoring
├── network-test.sh          # 🌐 Network connectivity tests
├── service-check.sh         # 🔧 Service management
├── log-checker.sh           # 📋 Log analysis
└── README.md               # 📖 This file
```

## 🎯 Features

### 🔍 **System Health Check** (`system-health.sh`)
- Real-time CPU, memory, and disk usage monitoring
- Load average and system uptime
- Quick status indicators (✅/❌)
- Instant system snapshot

### 🌐 **Network Testing** (`network-test.sh`) 
- Internet connectivity tests
- DNS resolution checks
- Common port scanning (SSH, HTTP, HTTPS)
- Website response testing

### 🔧 **Service Management** (`service-check.sh`)
- Service status monitoring (SSH, Nginx, MySQL, etc.)
- Start, stop, and restart services
- View service logs
- Failed service identification

### 📋 **Log Analysis** (`log-checker.sh`)
- System error log scanning
- Failed login attempt monitoring
- Web server log analysis
- Live log tailing



## 🖥️ Usage

### **Run the Full Toolkit:**
```bash
./troubleshoot.sh
```

### **Run Individual Tools:**
```bash
./system-health.sh      # Check system resources
./network-test.sh       # Test network connectivity
./service-check.sh      # Manage services
./log-checker.sh        # Analyze logs
./security-check.sh     # Security scan
```

### **Quick Full Diagnostic:**
```bash
./troubleshoot.sh       # Choose option 6 for full check
```


## 📋 Requirements

### **Essential Dependencies:**
```bash
# Most are pre-installed on Linux systems
whiptail          # Terminal UI framework
util-linux        # System utilities
net-tools         # Network utilities
```

### **Install Missing Dependencies:**
```bash
# On Ubuntu/Debian:
sudo apt update
sudo apt install whiptail net-tools

# On CentOS/RHEL:
sudo yum install newt net-tools
```

## 🔧 Customization

### **Add New Services to Monitor:**
Edit `service-check.sh` and add to the services array:
```bash
services=("ssh" "nginx" "mysql" "your-service")
```

### **Modify Network Test Ports:**
Edit `network-test.sh` and change the port list:
```bash
for port in 22 80 443 3306; do
```

## 🐛 Troubleshooting the Toolkit

### **If whiptail is not installed:**
```bash
sudo apt install whiptail
```

### **If scripts show permission denied:**
```bash
chmod +x *.sh
```

### **If emojis don't display properly:**
- Use a terminal that supports Unicode (most modern terminals do)
- Or the toolkit will automatically fall back to text symbols

### **If network tests fail:**
- Ensure you have internet connectivity
- Check if firewalls are blocking the tests

## 🤝 Contributing

Feel free to contribute by:
1. Adding new diagnostic modules
2. Improving existing functionality
3. Enhancing the user interface
4. Adding more comprehensive tests

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## ⚠️ Disclaimer

This tool is designed for diagnostic purposes only. Use with caution in production environments. Some operations (like service restarts) require sudo privileges and can affect system stability.

---


## 📋 **Key Sections Explained:**

1. **Quick Start** - Get running in 30 seconds
2. **Project Structure** - Understand what each file does
3. **Features** - Clear overview of each tool's purpose
4. **Usage** - Multiple ways to use the toolkit
5. **Requirements** - What's needed to run it
6. **Troubleshooting** - Help for common issues
7. **Customization** - How to adapt it to your needs

