FROM solr:9.4.1 AS solr-modules

FROM solr:9.4.1-slim

USER root

ENV SOLR_HOME=/var/solr/data

COPY --from=solr-modules --chown=0:0 /opt/solr/modules/extraction /opt/solr/modules/extraction
COPY --from=solr-modules --chown=0:0 /opt/solr/modules/clustering /opt/solr/modules/clustering
COPY --from=solr-modules --chown=0:0 /opt/solr/modules/langid /opt/solr/modules/langid

COPY --chown=0:0 docker/init-solr-home.sh /docker-entrypoint-initdb.d/10-init-solr-home.sh
COPY --chown=0:0 solr/ /opt/geonorge/solr-home/
COPY --chown=0:0 docker/seed-data/ /opt/geonorge/seed-data/

RUN mkdir -p /var/solr/data /var/solr/logs \
    && chown -R 150:150 /var/solr \
    && chmod 775 /var/solr \
    && chmod 755 /docker-entrypoint-initdb.d/10-init-solr-home.sh

USER 150:150

EXPOSE 8983

CMD ["solr-foreground"]
