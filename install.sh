#!/bin/bash

PROJECT_DIR="$(pwd)"
SERVICE_DIR="$HOME/.config/systemd/user"

echo "Installing dependencies..."
sudo apt update
sudo apt install -y inotify-tools curl

echo "Creating systemd directory..."
mkdir -p "$SERVICE_DIR"

echo "Copying service file..."
cp service/screenshot-bot.service "$SERVICE_DIR/"

# Replace path dynamically
sed -i "s|/home/ayan/auto-screenshot-forwarder|$PROJECT_DIR|g" \
    "$SERVICE_DIR/screenshot-bot.service"

echo "Reloading systemd..."
systemctl --user daemon-reload

echo "Enabling service..."
systemctl --user enable screenshot-bot.service

echo "Starting service..."
systemctl --user start screenshot-bot.service

echo "✅ Installation complete!"
