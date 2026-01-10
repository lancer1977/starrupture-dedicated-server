FROM ghcr.io/ptero-eggs/yolks:wine_latest

LABEL author="struppi" maintainer="https://github.com/struppinet"

# === Non-root user (UID/GID 1000) ===
RUN set -eux; \
    if ! getent group 1000 >/dev/null; then groupadd -g 1000 container; fi; \
    if ! id -u 1000 >/dev/null 2>&1; then useradd -m -u 1000 -g 1000 -s /bin/bash container; fi

# === Create writable directories (match your bind mounts) ===
RUN set -eux; \
    mkdir -p /home/container/server_files; \
    mkdir -p /home/container/server_files/StarRupture/Saved/SaveGames; \
    mkdir -p /home/container/saved; \
    mkdir -p /home/container/Steam/logs; \
    mkdir -p /home/container/.wine/drive_c; \
    chown -R 1000:1000 /home/container

# === Expose volumes ===
# If you run WITHOUT bind mounts, Docker will create anonymous/named volumes here.
# If you run WITH bind mounts (your compose), these become the mount targets.
VOLUME ["/home/container/server_files"]
VOLUME ["/home/container/saved"]
VOLUME ["/home/container/Steam/logs"]
# Optional: persist Wine prefix (uncomment if you want it by default)
# VOLUME ["/home/container/.wine/drive_c"]

# Scripts
ADD scripts /home/container/scripts
RUN set -eux; \
    chmod +x /home/container/scripts/*.sh; \
    chown -R 1000:1000 /home/container/scripts

USER 1000:1000

CMD ["/home/container/scripts/start.sh"]
