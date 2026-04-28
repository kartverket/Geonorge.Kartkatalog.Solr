#!/bin/sh

set -eu

SOLR_URL="${SOLR_URL:-http://localhost:8983/solr}"
REPOSITORY="${REPOSITORY:-gcs_backup}"
LOCATION_PREFIX="${LOCATION_PREFIX:-solr-backups}"

CORES="applications applications_en articles articles_en metadata metadata_all metadata_all_en metadata_en register services services_en"

if [ "$#" -lt 1 ]; then
  echo "Usage: $0 <backup-name>" >&2
  exit 1
fi

BACKUP_NAME="$1"

set -- ${CORES}

if [ "$#" -eq 0 ]; then
  echo "No Solr cores configured." >&2
  exit 1
fi

echo "Starting restore '${BACKUP_NAME}' for $# cores"

for core in "$@"; do
  location="${LOCATION_PREFIX}/${core}"
  echo "Restoring ${core} from ${location}"
  curl --fail --silent --show-error --get \
    --data-urlencode "command=restore" \
    --data-urlencode "repository=${REPOSITORY}" \
    --data-urlencode "location=${location}" \
    --data-urlencode "name=${BACKUP_NAME}" \
    "${SOLR_URL}/${core}/replication"
  echo
done

echo "Triggered restore '${BACKUP_NAME}' for all cores"
