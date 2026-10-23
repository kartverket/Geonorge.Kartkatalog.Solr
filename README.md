# Geonorge Solr Image

This repository contains the Solr home and container packaging for the
Geonorge catalog Solr deployment.

The image is built as a hybrid of the official `solr:10.0.0` and
`solr:10.0.0-slim` images. The runtime stays on the slim image, while the
required Solr modules are copied in from the full image. This repository does
not ship a bundled Solr runtime anymore; it only carries:

- the Docker packaging
- the Solr home under `solr/`
- the bootstrap script that copies immutable core config into the mounted
  writable Solr home

## Runtime model

The intended runtime shape is:

- run the container as `150:150`
- keep the root filesystem read-only
- mount a writable volume at `/var/solr`
- use `SOLR_HOME=/var/solr/data`

Each core keeps its mutable index under its own `data/` directory on the
mounted volume, so index data survives pod restarts.

The active cores are configured with `luceneMatchVersion=10.3`, matching the
Lucene version bundled with Solr 10.0. **Reindexing may be required after making changes here because analyzer behavior may change.**

Runtime `data/` directories are created inside the mounted Solr volume during startup.

Seeded data functionality for popularMetadata has been moved to Geonorge.Kartkatalog because the use of `external_` was deprecated in v10, this is now down by populating field in kartkatalog-API.

## Repository layout

- `Dockerfile`: builds the pinned `10.0.0-slim` runtime image and copies the
  required Solr modules from `10.0.0`
- `docker/init-solr-home.sh`: copies core configuration into the writable
  Solr home during container startup
- `docker-compose.yml`: local/dev for the container runtime
- `solr/`: Solr home, including `solr.xml`, core directories, and configsets