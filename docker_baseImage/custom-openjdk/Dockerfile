FROM alpine:3.18.4
ENV TZ=Asia/Taipei
ENV LANG=zh_TW.UTF-8
ENV LC_ALL=zh_TW.UTF-8
RUN apk update && apk upgrade
RUN ln -snf /usr/share/zoneInfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apk add --update ttf-dejavu fontconfig && rm -rf /var/cache/apk/*
RUN apk add openjdk8