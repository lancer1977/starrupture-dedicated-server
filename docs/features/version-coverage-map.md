---
title: Version Coverage Map
status: draft
owner: @DreadBreadcrumb
priority: high
complexity: 2
created: 2026-06-30
updated: 2026-06-30
tags: [feature, starrupture, v-layer, runtime]
established_versions: [V0]
delegated_versions: [V1, V2, V3, V4, V5]
---

# Version Coverage Map

This page maps the `DS-starrupture` runtime lane onto the shared V-layer
ladder. This repo owns runtime packaging and deployment shape; the canonical
support-home versions are delegated to `../starrupture-support`.

## Coverage Summary

| Layer | Tag | Current coverage | Evidence | Next proof |
| --- | --- | --- | --- | --- |
| `V0` infra baseline | `established` | Runtime image source, startup script, mount paths, ports, deployment docs, and validation script exist | `Dockerfile`, `scripts/start.sh`, README, compose/deploy files, `scripts/validate.sh` | Add a faster container smoke once Steam/runtime dependencies can be isolated |
| `V1` support-home boundary | `delegated` | Canonical support home lives outside this repo | `../starrupture-support` references | Keep this repo runtime-only |
| `V2` read-only support proof | `delegated` | Support-sidecar/readback contracts belong in the support home | `../starrupture-support` | Runtime lane can later provide logs, ports, and server lifecycle proof |
| `V3` control truth | `delegated` | Capability/action classification belongs in support/plugin contracts | `../starrupture-support`, `Api.GameServerInterop` | Do not add gameplay authority to this runtime repo |
| `V4` public/operator projection | `delegated` | Operator/public projection belongs in support/UI layers | `../starrupture-support`, `cc-sidecar` | Runtime can feed read-only state only after support integration |
| `V5` approval-gated gameplay proof | `delegated` | Gameplay proof belongs in support/plugin/runtime integration, not the image lane alone | support/plugin lane | Runtime repo can host the server target, but approval/audit policy lives elsewhere |

## Runtime Boundary

`V0` is established for this runtime lane at the source/config level because the
repo contains a Dockerfile, startup script, documented mounts, port settings,
and deployment wrappers.

This does not prove live deployment on `192.168.0.252`, and it does not widen
the runtime repo into support-sidecar, plugin, policy, or operator ownership.

## Validation

Current validation anchor:

```bash
bash scripts/validate.sh
```

This validates the runtime source/config shape. Full live proof still requires
building/running the image and observing the server lifecycle in an appropriate
runtime environment.
