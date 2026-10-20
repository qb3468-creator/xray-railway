#!/bin/sh
set -e
if [ -z "$UUID" ]; then
  echo "ERROR: UUID environment variable is required" >&2
  exit 1
fi
PORT="${PORT:-8080}"
WS_PATH="${WS_PATH:-/ws}"
sed -e "s/__PORT__/${PORT}/g" -e "s/__UUID__/${UUID}/g" -e "s|__WSPATH__|${WS_PATH}|g" /usr/local/xray/config.json.tpl > /usr/local/xray/config.json
echo "Starting Xray core: VLESS + WebSocket on port ${PORT}, path ${WS_PATH}"
exec /usr/local/xray/xray run -config /usr/local/xray/config.json
