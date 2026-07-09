# StarRupture Dedicated Server Docs

This docs tree keeps the StarRupture runtime boundary explicit and aligns the
repo with the shared infra ladder from `Api.GameServerInterop`.

Start here for routing; the paired support home lives in `../starrupture-support`.

## Infra Baseline

- `V0`: bootable dedicated server image, support/readback or sidecar boundary,
  deployment lane, and smoke checks
- `V1`: canonical support home lives in `../starrupture-support`

## Runtime-Lane Scope

- Boot proof: build or pull the dedicated-server image and render the Compose
  deployment files.
- Lifecycle proof: start, restart, stop, and observe the `starrupture`
  container without assigning gameplay command authority to this repo.
- Config proof: validate `SERVER_PORT`, `MULTIHOME`, mount paths, and
  SteamCMD/start-script arguments from the Dockerfile, scripts, and Compose
  files.
- Logs proof: use container logs as the runtime readback lane.
- Readback proof: keep this repo limited to container/server process state,
  ports, logs, and file-backed runtime configuration evidence.
- Delegation: V2-V5 support-sidecar contracts, public/operator policy,
  approval, audit, rollback, and gameplay mutation belong in
  `../starrupture-support` and shared interop packages.

## Contents

- [Feature Index](features/README.md)
- [Validation](validation.md)
- [Version Coverage Map](features/version-coverage-map.md)
- [Roadmaps](roadmaps/README.md)
- [Roadmap](roadmaps/portfolio-roadmap.md)

## 252 Deployment Status

- 252 deployment status: not observed on 192.168.0.252 as of 2026-06-13; see [252 Deployment Status](../../Api.GameServerInterop/docs/roadmap/252-deployment-status.md)

## Notes

This repo is intentionally focused on Dockerized runtime/deployment concerns.
The canonical support home lives in `../starrupture-support`; this docs tree
points back there for reusable support contracts.
