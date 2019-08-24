FROM opensuse/leap

WORKDIR /tmp
RUN set -x && \
    zypper in -y curl tar gzip && \
    curl https://download-cdn.resilio.com/stable/linux-x64/resilio-sync_x64.tar.gz | tar xz && \
    mv rslsync /usr/bin && \
    zypper rm -y --clean-deps curl tar gzip && \
    zypper clean

EXPOSE 8888 55555
ENTRYPOINT ["/usr/bin/run_rslsync"]
CMD ["--config", "/sync/config/sync.conf"]

ADD rootfs /