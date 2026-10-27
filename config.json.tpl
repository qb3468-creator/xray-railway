{
  "log": {
    "level": "warning"
  },
  "inbounds": [
    {
      "type": "vless",
      "tag": "vless-ws",
      "listen": "0.0.0.0",
      "listen_port": __PORT__,
      "users": [
        {
          "uuid": "__UUID__"
        }
      ],
      "transport": {
        "type": "ws",
        "path": "__WSPATH__"
      }
    },
    {
      "type": "vless",
      "tag": "vless-reality",
      "listen": "0.0.0.0",
      "listen_port": __REALITY_PORT__,
      "users": [
        {
          "uuid": "__UUID__",
          "flow": "xtls-rprx-vision"
        }
      ],
      "tls": {
        "enabled": true,
        "server_name": "www.microsoft.com",
        "reality": {
          "enabled": true,
          "handshake": {
            "server": "www.microsoft.com",
            "server_port": 443
          },
          "private_key": "__REALITY_PRIVATE_KEY__",
          "short_id": [
            "__REALITY_SHORT_ID__"
          ]
        }
      }
    }
  ],
  "outbounds": [
    {
      "type": "direct",
      "tag": "direct"
    }
  ]
}
