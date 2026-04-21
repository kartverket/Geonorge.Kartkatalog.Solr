# Geonorge Solr Image

This repository contains the Solr home and container packaging for the
Geonorge catalog Solr deployment.

The image is built as a hybrid of the official `solr:9.4.1` and
`solr:9.4.1-slim` images. The runtime stays on the slim image, while the
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

The active cores are configured with `luceneMatchVersion=9.8`, matching the
Lucene version bundled with Solr 9.4. Reindexing is required after deploying
this change because analyzer behavior may change.

Runtime `data/` directories are created inside the mounted Solr volume during startup.
The only seeded runtime data currently preserved is
`external_popularMetadata.txt` for the `metadata` core, copied into the core's
runtime `data/` directory by the bootstrap script.

## Repository layout

- `Dockerfile`: builds the pinned `9.4.1-slim` runtime image and copies the
  required Solr modules from `9.4.1`
- `docker/init-solr-home.sh`: copies core configuration into the writable
  Solr home during container startup
- `docker/solr-security.policy`: grants Solr read access to the mounted
  Google ADC token file used for GCS backups
- `docker-compose.yml`: local/dev smoke-test shape for the container runtime
- `solr/`: Solr home, including `solr.xml`, core directories, and configsets

## Legacy sample cleanup

The old Velocity-based `/browse` sample handlers have been removed from the
core configs. They were inherited from older Solr example configurations and
do not exist in the official Solr 9 runtime.
