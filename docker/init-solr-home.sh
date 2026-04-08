#!/bin/sh
set -eu

template_root="/opt/geonorge/solr-home"
seed_root="/opt/geonorge/seed-data"
solr_home="${SOLR_HOME:-/var/solr/data}"

mkdir -p "${solr_home}"

for root_file in solr.xml zoo.cfg; do
  if [ -f "${template_root}/${root_file}" ]; then
    cp "${template_root}/${root_file}" "${solr_home}/${root_file}"
  fi
done

find "${template_root}" -mindepth 1 -maxdepth 1 -type d | sort | while IFS= read -r core_dir; do
  if [ ! -f "${core_dir}/core.properties" ]; then
    continue
  fi

  core_name="$(basename "${core_dir}")"
  target_dir="${solr_home}/${core_name}"

  mkdir -p "${target_dir}"
  cp -R "${core_dir}/." "${target_dir}/"
  mkdir -p "${target_dir}/data"

  if [ -d "${seed_root}/${core_name}" ]; then
    cp -R "${seed_root}/${core_name}/." "${target_dir}/data/"
  fi
done
