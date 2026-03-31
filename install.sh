#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VIM_DIR="${HOME}/.vim"
FTDETECT_DIR="${VIM_DIR}/ftdetect"
SYNTAX_DIR="${VIM_DIR}/syntax"
TARGET_VIMRC="${HOME}/.vimrc"
SOURCE_VIMRC="${SCRIPT_DIR}/.vimrc"

copy_dir_contents() {
  local source_dir="$1"
  local target_dir="$2"

  if [[ ! -d "${source_dir}" ]]; then
    echo "skip: source directory not found: ${source_dir}"
    return
  fi

  mkdir -p "${target_dir}"

  local copied_any=false
  local file
  while IFS= read -r -d '' file; do
    cp "${file}" "${target_dir}/"
    echo "installed: ${target_dir}/$(basename "${file}")"
    copied_any=true
  done < <(find "${source_dir}" -maxdepth 1 -type f -print0)

  if [[ "${copied_any}" == false ]]; then
    echo "skip: no files found in ${source_dir}"
  fi
}

main() {
  mkdir -p "${FTDETECT_DIR}" "${SYNTAX_DIR}"

  copy_dir_contents "${SCRIPT_DIR}/ftdetect" "${FTDETECT_DIR}"
  copy_dir_contents "${SCRIPT_DIR}/syntax" "${SYNTAX_DIR}"

  if [[ -f "${TARGET_VIMRC}" ]]; then
    echo "skip: existing ${TARGET_VIMRC} preserved"
    echo "info: sample config is available at ${SOURCE_VIMRC}"
  elif [[ -f "${SOURCE_VIMRC}" ]]; then
    cp "${SOURCE_VIMRC}" "${TARGET_VIMRC}"
    echo "installed: ${TARGET_VIMRC}"
  else
    echo "skip: sample vimrc not found: ${SOURCE_VIMRC}"
  fi

  echo "install complete"
}

main "$@"
