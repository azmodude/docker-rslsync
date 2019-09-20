FROM azmo/base:ubuntu-latest

WORKDIR /tmp
RUN set -x && \
    curl https://download-cdn.resilio.com/stable/linux-x64/resilio-sync_x64.tar.gz | tar xz && \
    mv rslsync /usr/bin && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 8888 55555
ENTRYPOINT ["/usr/bin/run_rslsync"]
CMD ["--config", "/sync/config/sync.conf"]

ADD rootfs /
