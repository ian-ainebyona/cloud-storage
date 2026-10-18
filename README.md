
# Cloud Storage Lab: Block 1 (Local S3 Object Storage)

A lightweight, production-grade local S3-compatible object storage lab built with **Garage (Rust)** and **Docker**, designed for Linux environments (Ubuntu, Linux Mint, Debian).

---

## 🛠️ Prerequisites & Multi-Distro Docker Setup

Docker and Docker Compose must be installed on your host system or virtual machine. Because Ubuntu, Linux Mint, and Debian share the same Debian/APT package foundation, use the standard official installation commands below:

### 1. Install Docker Engine

# Update local package index and install dependencies
sudo apt update && sudo apt install -y curl apt-transport-https ca-certificates gnupg

# Add Docker's official GPG key
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL [https://download.docker.com/linux/ubuntu/gpg](https://download.docker.com/linux/ubuntu/gpg) | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Set up the stable repository (works across Ubuntu, Linux Mint, and Debian)
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] [https://download.docker.com/linux/ubuntu](https://download.docker.com/linux/ubuntu) \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker packages
sudo apt update && sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin