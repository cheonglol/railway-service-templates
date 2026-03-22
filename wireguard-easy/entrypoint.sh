#!/bin/sh

echo "=============================================="
echo "  WG-EASY WEB UI ACCESS:"
echo ""
echo "  https://${RAILWAY_PUBLIC_DOMAIN:-localhost:51821}"
echo ""
echo "  Password: ${PASSWORD:-changeme}"
echo ""
echo "  NOTE: Railway does not support UDP."
echo "  Use web UI to generate & download .conf files."
echo "  VPN tunnel requires UDP 51820 access externally."
echo "=============================================="

exec node /usr/src/app/server.js
