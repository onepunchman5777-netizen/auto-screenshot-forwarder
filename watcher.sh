#!/bin/bash

# Load config
source "$(dirname "$0")/../config/config.env"

LOG_FILE="$HOME/.screenshot-bot.log"

/usr/bin/inotifywait -m -e close_write --format '%f' "$WATCH_DIR" | while read FILE
do
    # Only process PNG files
    [[ "$FILE" == *.png ]] || continue

    FULL_PATH="$WATCH_DIR/$FILE"

    echo "[$(date)] Detected: $FULL_PATH" >> "$LOG_FILE"

    /usr/bin/curl -s -F chat_id="$CHAT_ID" \
         -F photo=@"$FULL_PATH" \
         "https://api.telegram.org/bot$BOT_TOKEN/sendPhoto" \
         >> "$LOG_FILE" 2>&1

    echo "[$(date)] Sent: $FULL_PATH" >> "$LOG_FILE"
done
