FROM solr:10.0.0 AS solr-modules

FROM solr:10.0.0-slim

USER root

ENV SOLR_HOME=/var/solr/data
ENV LOG4J_PROPS=/opt/geonorge/log4j2-stdout.xml
ENV SOLR_REQUESTLOG_ENABLED=false
ENV GC_LOG_OPTS="-Xlog:gc*:stdout:time,uptime"

COPY --from=solr-modules --chown=0:0 /opt/solr/modules/extraction /opt/solr/modules/extraction
COPY --from=solr-modules --chown=0:0 /opt/solr/modules/clustering /opt/solr/modules/clustering
COPY --from=solr-modules --chown=0:0 /opt/solr/modules/langid /opt/solr/modules/langid
COPY --from=solr-modules --chown=0:0 /opt/solr/modules/analysis-extras /opt/solr/modules/analysis-extras

COPY --chown=0:0 docker/init-solr-home.sh /docker-entrypoint-initdb.d/10-init-solr-home.sh
COPY --chown=0:0 docker/log4j2-stdout.xml /opt/geonorge/log4j2-stdout.xml
COPY --chown=0:0 solr/ /opt/geonorge/solr-home/

RUN mkdir -p /var/solr/data /var/solr/logs \
    && chown -R 150:150 /var/solr \
    && chmod 775 /var/solr \
    && chmod 755 /docker-entrypoint-initdb.d/10-init-solr-home.sh

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates && \
    update-ca-certificates && \
    rm -rf /var/lib/apt/lists/*

USER 150:150

EXPOSE 8983

CMD ["solr-foreground", "--user-managed"]
