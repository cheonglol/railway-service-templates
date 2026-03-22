# Webtop Jump Server

Browser-based desktop environment for secure network access.

## Features

- Web-based Linux desktop (Webtop)
- Network debugging tools (curl, wget, psql, etc.)
- Firefox browser
- Auto-generated password on each deploy
- Daily auto-restart at midnight

## Deploy to Railway

1. Click: [![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/new)
2. Select this repository
3. Check logs for access URL and password
4. Access via browser using URL from logs

## Manual Deployment

```bash

dockerbuild-tjump-server.

dockerrun-p3000:3000-ePASSWORD=yourpasswordjump-server

```

Access at: http://localhost:3000
