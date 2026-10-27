#!/bin/sh
set -e
if [ -z "$UUID" ]; then echo "ERROR: UUID environment variable is required" >&2; exit 1; fi
if [ -z "$REALITY_PRIVATE_KEY" ]; then echo "ERROR: REALITY_PRIVATE_KEY environment variable is required" >&2; exit 1; fi
if [ -z "$REALITY_SHORT_ID" ]; then echo "ERROR: REALITY_SHORT_ID environment variable is required" >&2; exit 1; fi
PORT="${PORT:-8080}"
WS_PATH="${WS_PATH:-/ws}"
REALITY_PORT="${REALITY_PORT:-8443}"
sed -e "s/__PORT__/${PORT}/g" -e "s/__UUID__/${UUID}/g" -e "s|__WSPATH__|${WS_PATH}|g" -e "s/__REALITY_PORT__/${REALITY_PORT}/g" -e "s|__REALITY_PRIVATE_KEY__|${REALITY_PRIVATE_KEY}|g" -e "s/__REALITY_SHORT_ID__/${REALITY_SHORT_ID}/g" /usr/local/sing-box/config.json.tpl > /usr/local/sing-box/config.json
echo "Starting sing-box: VLESS+WS on port ${PORT} path ${WS_PATH}, VLESS+Reality on port ${REALITY_PORT}"
exec /usr/local/sing-box/sing-box run -c /usr/local/sing-box/config.json
