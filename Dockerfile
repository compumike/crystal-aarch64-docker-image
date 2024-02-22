FROM alpine:latest

RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk --no-cache add \
  ca-certificates \
  crystal \
  tzdata

CMD ["/usr/bin/crystal"]
