#!/bin/bash

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
echo "=============================================="

echo "Installing cron for daily restart..."
apk add --no-cache dcron
echo "0 0 * * * killall5 -9" | crontab -
crond -b -L /dev/stdout

exec /init
