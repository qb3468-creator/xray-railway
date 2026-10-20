FROM alpine:3.20
RUN apk add --no-cache curl unzip ca-certificates tzdata
RUN curl -fsSL -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && mkdir -p /usr/local/xray && unzip -o /tmp/xray.zip -d /usr/local/xray && chmod +x /usr/local/xray/xray && rm -f /tmp/xray.zip
COPY config.json.tpl /usr/local/xray/config.json.tpl
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
