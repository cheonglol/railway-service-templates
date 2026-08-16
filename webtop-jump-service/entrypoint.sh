#!/bin/bash

# Apply timezone so the container and cron use local time, not UTC.
# Override with the TZ env var on Railway if needed.
if [ -n "$TZ" ] && [ -f "/usr/share/zoneinfo/${TZ}" ]; then
    cp "/usr/share/zoneinfo/${TZ}" /etc/localtime
    echo "${TZ}" > /etc/timezone
fi

if [ -n "$HTTP_PASSWORD" ]; then
    export PASSWORD="$HTTP_PASSWORD"
elif [ -z "$PASSWORD" ]; then
    export PASSWORD=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 16)
fi

echo "=============================================="
echo "  JUMP SERVER ACCESS URL:"
echo ""
echo "  https://abc:${PASSWORD}@${RAILWAY_PUBLIC_DOMAIN:-jump-server.railway.internal}"
echo ""
echo "  Username: abc"
echo "  Password: $PASSWORD"
echo "  Timezone: ${TZ:-UTC}"
echo "=============================================="

echo "Installing cron for daily restart..."
apk add --no-cache dcron
echo "0 0 * * * killall5 -9" | crontab -
crond -b -L /dev/stdout

exec /init
