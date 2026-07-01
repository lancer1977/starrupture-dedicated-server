# StarRupture Dedicated Server Docs

This docs tree keeps the StarRupture runtime boundary explicit and aligns the
repo with the shared infra ladder from `Api.GameServerInterop`.

Start here for routing; the paired support home lives in `../starrupture-support`.

## Infra Baseline

- `V0`: bootable dedicated server image, support/readback or sidecar boundary,
  deployment lane, and smoke checks
- `V1`: canonical support home lives in `../starrupture-support`

## Contents

- [Feature Index](features/README.md)
- [Version Coverage Map](features/version-coverage-map.md)
- [Roadmaps](roadmaps/README.md)
- [Roadmap](roadmaps/portfolio-roadmap.md)

## 252 Deployment Status

- 252 deployment status: not observed on 192.168.0.252 as of 2026-06-13; see [252 Deployment Status](../../Api.GameServerInterop/docs/roadmap/252-deployment-status.md)

## Notes

This repo is intentionally focused on Dockerized runtime/deployment concerns.
The canonical support home lives in `../starrupture-support`; this docs tree
points back there for reusable support contracts.
