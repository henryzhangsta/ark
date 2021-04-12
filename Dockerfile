FROM ubuntu:20.04

RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y --no-install-recommends dumb-init ca-certificates curl lib32gcc1 locales libsdl2-2.0-0:i386 \
    && apt-get remove --purge -y \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

RUN useradd -ms /bin/bash ark && mkdir -p /ark && chown ark:ark /ark

USER ark:ark
WORKDIR /ark

RUN mkdir -p ~/Steam

COPY . .

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["./startserver.sh"]
