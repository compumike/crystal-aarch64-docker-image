FROM alpine:latest

RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk --no-cache add \
  ca-certificates \
  crypto++-dev \
  crystal \
  gc-dev \
  gc-static \
  openssl-dev \
  openssl-libs-static \
  shards \
  tzdata \
  zlib-dev \
  zlib-static

CMD ["/usr/bin/crystal"]
