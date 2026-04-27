# 🚀 Auto Screenshot Forwarder

Automatically sends every screenshot you take to a destination (Telegram by default) — instantly and without manual effort.

---

## ❓ Why This Project Exists

Taking screenshots is easy. Managing them is not.

Problems:

* Screenshots stay stuck on your laptop
* You can’t access them instantly on your phone
* Manual sharing (WhatsApp, email, etc.) is slow and repetitive
* Files pile up and become messy

👉 This project removes all manual steps.

---

## 💡 What This Project Does

* Watches your screenshot folder in real-time
* Detects new screenshots instantly (event-driven, no CPU waste)
* Automatically sends them to your Telegram

Result:
👉 Take screenshot → get it on your phone immediately

---

## ⚙️ How It Works (Simple Architecture)

Screenshot Taken
      ↓
Folder Watcher (inotify)
      ↓
Script Trigger
      ↓
Send via Telegram API


Uses:

* Linux file system events (inotify)
* Background service via systemd
* Telegram Bot API for delivery

---

## 🧩 Components Used

### Core (always required)

* Bash script
* inotify (file system event detection)
* systemd (runs script in background)

### Delivery (choose one)

#### ✅ Default: Telegram

* Fast
* Reliable
* Works across devices

#### 🔄 Alternatives (if NOT using Telegram)

You can replace Telegram with:

* **Email (SMTP)** → send screenshot as attachment
* **Cloud upload** (Google Drive using rclone)
* **Local storage automation** (auto-organize screenshots)
* **Custom API endpoint** (your own backend)

👉 Only the “sending part” changes — the watcher stays the same.

---

## 🤖 Setup: Telegram Bot (Required for default mode)

### Step 1 — Create Bot

1. Open Telegram
2. Search for BotFather
3. Run:

```
/start
/newbot
```

4. Copy your **BOT_TOKEN**

---

### Step 2 — Get Chat ID

1. Open chat with your bot
2. Send a message: `hello`

Run:

```bash
curl https://api.telegram.org/botYOUR_TOKEN/getUpdates
```

Find:

```json
"chat": {
  "id": 123456789
}
```

👉 That number = your `CHAT_ID`

---

## 📦 Installation

```bash
git clone https://github.com/your-username/auto-screenshot-forwarder.git
cd auto-screenshot-forwarder
chmod +x install.sh
./install.sh
```

---

## 🔧 Configuration

Edit:

```bash
config/config.env
```

Set:

* WATCH_DIR → your screenshot folder
* BOT_TOKEN
* CHAT_ID

---

## ▶️ Usage

Nothing to run manually.

Just take a screenshot.

👉 It will be sent automatically.

---

## 🧪 Logs

```bash
cat ~/.screenshot-bot.log
```

---

## ❌ Uninstall

```bash
chmod +x uninstall.sh
./uninstall.sh
```

---

## ⚠️ Limitations

* Works only when system is running
* Requires internet for Telegram delivery
* Large files may take longer to send

---

## 🧠 What You Learn From This Project

* Event-driven programming (inotify)
* Linux background services (systemd)
* API integration (Telegram Bot API)
* Automation pipeline design

---

## 📌 Future Improvements

* Multi-folder support
* File compression before sending
* OCR / AI processing
* GUI interface

---

## 🏁 Final Note

This is not just a script.

It’s a small automation system:

* detects events
* processes data
* delivers output

That’s the foundation of real-world backend automation.

