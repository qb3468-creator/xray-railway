FROM alpine:3.20
RUN apk add --no-cache curl ca-certificates tzdata
RUN curl -fsSL -o /tmp/sb.tar.gz https://github.com/SagerNet/sing-box/releases/download/v1.14.3/sing-box-1.14.3-linux-amd64.tar.gz && mkdir -p /usr/local/sing-box && tar xzf /tmp/sb.tar.gz -C /usr/local/sing-box --strip-components=1 && chmod +x /usr/local/sing-box/sing-box && rm -f /tmp/sb.tar.gz
COPY config.json.tpl /usr/local/sing-box/config.json.tpl
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
