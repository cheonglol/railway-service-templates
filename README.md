# Railway Service Templates

A collection of self-hosted services ready to deploy on Railway.

---

## Webtop Jump Server

> `webtop-jump-service/`

Browser-based Linux desktop for secure network access into your Railway environment.

### Features

- Web-based Linux desktop (Webtop)
- Network debugging tools (curl, wget, psql, etc.)
- Firefox browser
- Auto-generated password on each deploy
- Daily auto-restart at midnight

### Deploy

1. Click: [![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/new)
2. Select this repo → choose `webtop-jump-service` folder
3. Check logs for access URL and password
4. Open in browser

### Local

```bash
docker build -t jump-server ./webtop-jump-service
docker run -p 3000:3000 -e PASSWORD=yourpassword jump-server
```

Access at: http://localhost:3000

---

## WG-Easy — WireGuard Web UI

> `wireguard-easy/`

Self-hosted WireGuard VPN with a browser UI for generating and downloading client configs.

### Features

- Web UI to create/delete VPN peers
- Download `.conf` or QR code per peer
- Password-protected dashboard
- Prints access URL in Railway logs on startup

### Deploy

1. Click: [![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/new)
2. Select this repo → choose `wireguard-easy` folder
3. Set environment variables (see below)
4. **Add a Volume** mounted at `/etc/wireguard` (required for persistence)
5. Check logs for the web UI URL → login → create a peer → download `.conf`

### Environment Variables

| Variable                  | Required | Description                                |
| ------------------------- | -------- | ------------------------------------------ |
| `WG_HOST`                 | ✅       | Your Railway public domain (no `https://`) |
| `PASSWORD`                | ✅       | Web UI login password                      |
| `WG_PORT`                 | optional | WireGuard UDP port (default `51820`)       |
| `WG_DEFAULT_DNS`          | optional | DNS for VPN clients (default `1.1.1.1`)    |
| `WG_MTU`                  | optional | MTU (default `1420`)                       |
| `WG_PERSISTENT_KEEPALIVE` | optional | Keepalive in seconds (default `25`)        |

### Connecting from your machine

After downloading the `.conf` file from the web UI:

```bash
# Linux
sudo apt install wireguard
sudo cp peer.conf /etc/wireguard/wg0.conf
sudo wg-quick up wg0
```

Or: **GNOME Settings → Network → VPN → Import from file**

### ⚠️ Railway UDP Limitation

Railway's proxy is TCP only. WireGuard needs UDP 51820.

- ✅ Web UI works — manage peers, download configs
- ❌ VPN tunnel won't work through Railway's public domain directly

**Workaround:** Use this to generate configs, but run the actual WireGuard server on a VPS (DigitalOcean, Hetzner, etc.) where UDP is available.

### Local

```bash
docker build -t wg-easy ./wireguard-easy
docker run -p 51821:51821 -e WG_HOST=localhost -e PASSWORD=test wg-easy
```

Access at: http://localhost:51821
