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
`external_popularMetadata.txt` for the `metadata_all` and `metadata_all_en` cores, copied into the core's
runtime `data/` directory by the bootstrap script.

## Repository layout

- `Dockerfile`: builds the pinned `9.4.1-slim` runtime image and copies the
  required Solr modules from `9.4.1`
- `docker/init-solr-home.sh`: copies core configuration into the writable
  Solr home during container startup
- `docker-compose.yml`: local/dev for the container runtime
- `scripts/backup-all-cores.sh`: triggers a Solr replication backup for every
  core under `solr/`
- `scripts/restore-all-cores.sh`: triggers a Solr replication restore for every
  core under `solr/`
- `solr/`: Solr home, including `solr.xml`, core directories, and configsets

## Backup helpers

Use the included scripts to trigger replication backups and restores across
all configured cores:

```bash
./scripts/backup-all-cores.sh
./scripts/restore-all-cores.sh 20260423103000

# specific solr URL:
SOLR_URL=http://localhost:8983/solr ./scripts/restore-all-cores.sh 20260423103000
```

The scripts default to the dev Solr endpoint and the `gcs_backup` repository.
Override `SOLR_URL`, `REPOSITORY`, or `LOCATION_PREFIX` with environment
variables if needed.

The backup and restore scripts are POSIX `sh` compatible and keep their core
list inside the scripts, so they can be mounted as Kubernetes ConfigMaps and
run with the official curl image:

```bash
kubectl create configmap solr-backup-scripts \
  --from-file=backup-all-cores.sh=scripts/backup-all-cores.sh \
  --from-file=restore-all-cores.sh=scripts/restore-all-cores.sh
```

Example CronJob container shape:

```yaml
containers:
  - name: backup
    image: curlimages/curl:8.19.0
    command: ["sh", "/scripts/backup-all-cores.sh"]
    env:
      - name: SOLR_URL
        value: http://localhost:8983/solr
      - name: REPOSITORY
        value: gcs_backup
      - name: LOCATION_PREFIX
        value: solr-backups
    volumeMounts:
      - name: backup-scripts
        mountPath: /scripts
        readOnly: true
volumes:
  - name: backup-scripts
    configMap:
      name: solr-backup-scripts
```

Edit the `CORES` variable in the scripts if the deployed core set changes.
