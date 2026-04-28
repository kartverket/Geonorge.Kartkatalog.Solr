#!/bin/sh

set -eu

SOLR_URL="${SOLR_URL:-http://localhost:8983/solr}"
REPOSITORY="${REPOSITORY:-gcs_backup}"
LOCATION_PREFIX="${LOCATION_PREFIX:-solr-backups}"
BACKUP_NAME="${1:-$(date +%Y%m%d%H%M%S)}"

CORES="applications applications_en articles articles_en metadata metadata_all metadata_all_en metadata_en register services services_en"

set -- ${CORES}

if [ "$#" -eq 0 ]; then
  echo "No Solr cores configured." >&2
  exit 1
fi

echo "Starting backup '${BACKUP_NAME}' for $# cores"

for core in "$@"; do
  location="${LOCATION_PREFIX}/${core}"
  echo "Backing up ${core} to ${location}"
  curl --fail --silent --show-error --get \
    --data-urlencode "command=backup" \
    --data-urlencode "repository=${REPOSITORY}" \
    --data-urlencode "location=${location}" \
    --data-urlencode "name=${BACKUP_NAME}" \
    "${SOLR_URL}/${core}/replication"
  echo
done

echo "Triggered backup '${BACKUP_NAME}' for all cores"
