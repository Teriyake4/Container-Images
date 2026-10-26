FROM eclipse-temurin:25-jre AS fabric-download

ARG MC_VERSION=26.3
ARG FABRIC_LOADER_VERSION
ARG FABRIC_INSTALLER_VERSION

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl jq \
    && rm -rf /var/lib/apt/lists/*

COPY download-fabric.sh /usr/local/bin/download-fabric.sh

RUN chmod +x /usr/local/bin/download-fabric.sh \
    && /usr/local/bin/download-fabric.sh \
    && rm /usr/local/bin/download-fabric.sh

FROM eclipse-temurin:25-jre

COPY --from=fabric-download /opt/fabric /opt/fabric
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN useradd --create-home --shell /usr/sbin/nologin fabric \
    && mkdir -p /data \
    && chmod +x /usr/local/bin/entrypoint.sh \
    && chown -R fabric:fabric /opt/fabric /data /usr/local/bin/entrypoint.sh

WORKDIR /data

VOLUME ["/data"]
EXPOSE 25565/tcp

USER fabric

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
