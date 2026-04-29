#!/bin/bash
# ZENITH CLOUD COMPILER SETUP
echo "--- Memulai Inisialisasi Zenith Cloud Engine v4.0 ---"

sudo apt-get update -y
echo "Status: Menginstal OpenJDK 17..."
sudo apt-get install -y openjdk-17-jdk-headless

if ! command -v node &> /dev/null; then
    echo "Status: Menginstal Node.js..."
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install -y nodejs
fi

echo "Status: Menginstal Bubblewrap..."
sudo npm install -g @bubblewrap/cli --unsafe-perm

export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH=$PATH:$JAVA_HOME/bin

echo "--- VERIFIKASI SELESAI ---"
bubblewrap --version
echo "STATUS: SIAP EKSEKUSI."
