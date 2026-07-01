#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

required_paths=(
  "README.md"
  "Dockerfile"
  "scripts/start.sh"
  "docs/README.md"
  "docs/features/README.md"
  "docs/features/version-coverage-map.md"
  "deploy/docker-compose.local.yml"
  "deploy/nginx/docker-compose.local.yml"
  "deploy/nginx/docker-compose.portainer.yml"
  "deploy/portainer-stack.yml"
)

for path in "${required_paths[@]}"; do
  if [[ ! -e "$path" ]]; then
    echo "Missing required path: $path" >&2
    exit 1
  fi
done

grep -q "../starrupture-support" README.md docs/README.md docs/features/version-coverage-map.md
grep -q "established_versions: \\[V0\\]" docs/features/version-coverage-map.md
grep -q "delegated_versions: \\[V1, V2, V3, V4, V5\\]" docs/features/version-coverage-map.md
grep -q "app_update 3809400 validate" scripts/start.sh
grep -q "StarRuptureServerEOS-Win64-Shipping.exe" scripts/start.sh
grep -q "SERVER_PORT" Dockerfile README.md scripts/start.sh

docker compose -f deploy/docker-compose.local.yml config --quiet
docker compose -f deploy/nginx/docker-compose.local.yml config --quiet
docker compose -f deploy/nginx/docker-compose.portainer.yml config --quiet
docker compose -f deploy/portainer-stack.yml config --quiet
