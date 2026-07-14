FROM alpine:3.19

RUN apk add --no-cache ca-certificates curl unzip bash

# Install Litestream and make it executable
RUN curl -L https://github.com/benbjohnson/litestream/releases/download/v0.3.9/litestream-v0.3.9-linux-amd64.tar.gz -o /tmp/litestream.tar.gz \
    && tar -C /usr/local/bin -xzf /tmp/litestream.tar.gz \
    && chmod +x /usr/local/bin/litestream \
    && rm /tmp/litestream.tar.gz

# Copy your PocketBase binary
COPY pocketbase /pb/pocketbase
RUN chmod +x /pb/pocketbase

# Copy Litestream config and startup script
COPY litestream.yml /etc/litestream.yml
COPY run.sh /pb/run.sh
RUN chmod +x /pb/run.sh

EXPOSE 8090
CMD ["/pb/run.sh"]
