#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_FTDETECT="${HOME}/.vim/ftdetect/log.vim"
TARGET_SYNTAX="${HOME}/.vim/syntax/log.vim"
TARGET_VIMRC="${HOME}/.vimrc"
SOURCE_VIMRC="${SCRIPT_DIR}/.vimrc"

remove_file_if_exists() {
  local target="$1"

  if [[ -f "${target}" ]]; then
    rm -f "${target}"
    echo "removed: ${target}"
  else
    echo "skip: file not found: ${target}"
  fi
}

main() {
  remove_file_if_exists "${TARGET_FTDETECT}"
  remove_file_if_exists "${TARGET_SYNTAX}"

  if [[ -f "${TARGET_VIMRC}" && -f "${SOURCE_VIMRC}" ]] && cmp -s "${TARGET_VIMRC}" "${SOURCE_VIMRC}"; then
    rm -f "${TARGET_VIMRC}"
    echo "removed: ${TARGET_VIMRC}"
  elif [[ -f "${TARGET_VIMRC}" ]]; then
    echo "skip: preserved existing ${TARGET_VIMRC}"
  else
    echo "skip: file not found: ${TARGET_VIMRC}"
  fi

  echo "uninstall complete"
}

main "$@"
