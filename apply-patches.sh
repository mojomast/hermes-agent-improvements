#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "usage: $0 /path/to/hermes-agent-checkout" >&2
  exit 2
fi

target=$1
repo_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

if [[ ! -d "$target/.git" ]]; then
  echo "target is not a git checkout: $target" >&2
  exit 2
fi

cd "$target"
git am "$repo_dir"/patches/*.patch
