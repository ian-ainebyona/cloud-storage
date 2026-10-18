#!/bin/bash
set -e

echo "[*] Ensuring Docker service is running..."
sudo systemctl start docker

echo "[*] Starting Garage container stack..."
docker compose up -d

echo "[*] Waiting for container initialization..."
sleep 3

echo "[*] Configuring cluster node layout and buckets..."
NODE_ID=$(docker exec garage-storage-lab garage -c /etc/garage.toml node id | head -n 1 | awk '{print $1}')
docker exec garage-storage-lab garage -c /etc/garage.toml layout assign -z dc1 -c 10G "$NODE_ID" 2>/dev/null || true
docker exec garage-storage-lab garage -c /etc/garage.toml layout apply --version 1 2>/dev/null || true

docker exec garage-storage-lab garage -c /etc/garage.toml key create lab-key 2>/dev/null || true
docker exec garage-storage-lab garage -c /etc/garage.toml bucket create enterprise-bucket 2>/dev/null || true
docker exec garage-storage-lab garage -c /etc/garage.toml bucket allow enterprise-bucket --read --write --key lab-key 2>/dev/null || true

echo "[*] Success! Garage storage lab is fully ready."
