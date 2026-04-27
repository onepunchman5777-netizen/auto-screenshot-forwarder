#!/bin/bash

echo "Stopping service..."
systemctl --user stop screenshot-bot.service

echo "Disabling service..."
systemctl --user disable screenshot-bot.service

echo "Removing service file..."
rm -f ~/.config/systemd/user/screenshot-bot.service

systemctl --user daemon-reload

echo "✅ Uninstalled successfully!"
