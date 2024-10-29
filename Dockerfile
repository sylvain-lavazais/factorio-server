FROM ubuntu:24.04
LABEL authors="slavazais"

RUN apt-get update && \
    apt-get install -y curl jq xz-utils && \
    rm -rf /var/lib/apt/lists/*

RUN groupadd -g 1001 app && \
    useradd --system --create-home --home-dir /app -s /bin/bash -g app -u 1001 app

USER 1001
WORKDIR /app

COPY --chown=app scripts/check-folders.sh .
COPY --chown=app scripts/download-latest.sh .
COPY --chown=app scripts/docker-entrypoint.sh .
COPY --chown=app templates ./templates
COPY --chown=app mods ./mods

EXPOSE 34197

ENTRYPOINT [ "/app/docker-entrypoint.sh" ]
CMD [ "./bin/x64/factorio", \
      "--mod-directory", "mods", \
      "--console-log", "logs", \
      "--server-settings", "templates/server-settings.json", \
      "--start-server-load-latest" ]
