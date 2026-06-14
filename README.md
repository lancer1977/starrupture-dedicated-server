# Docker for a StarRupture dedicated server

![Static Badge](https://img.shields.io/badge/GitHub-starrupture--dedicated--server-blue?logo=github) [![Docker Hub](https://img.shields.io/badge/Docker_Hub-starrupture--dedicated--server-blue?logo=docker)](https://hub.docker.com/r/struppinet/starrupture-dedicated-server)

Runtime lane for the StarRupture dedicated server image.

First read: [docs/README.md](./docs/README.md).

## Infra Goal Path

This repo is the StarRupture runtime/deploy lane. The repo should make the
shared infra baseline explicit so the image, deployment, and validation path are
easy to review folder by folder. The canonical support home lives in
`../starrupture-support`.

- `V0`: bootable dedicated server image, support/readback or sidecar boundary,
  deployment lane, and smoke checks
- `V1`: canonical support home lives in `../starrupture-support`; this repo
  stays on the runtime lane

The shared seam and ladder live in `Api.GameServerInterop`; this repo keeps the
StarRupture-specific Docker packaging and runtime setup.

## Tags

- game
- starrupture-dedicated-server
- game-server
- server
- docker
- docs

## Table of contents
- [Quick start](#quick-start)
- [Compose](#compose)
- [Environment variables server settings](#environment-variables-server-settings)
  
This repo documents and packages a Docker container for hosting a [StarRupture](https://starrupture-game.com/) dedicated server.

## Purpose

The image is meant for homelab-style deployment with Docker or Compose. It uses the Ptero-Eggs Wine base image and exposes the expected save and server mount points.

## V1 baseline

- The image can be run with `docker run` or Compose.
- The savegame and server mounts are documented.
- V1 means the container is deployable and the operator path is clear.

## Quick start

```bash
docker run -d \
  --name starrupture \
  -p 7777:7777/udp \
  -v ./savegame:/home/container/server_files/StarRupture/Saved/SaveGames \
  -v ./server:/home/container/server_files \
  -e SERVER_PORT=7777 \
  struppinet/starrupture-dedicated-server:latest
```

## Compose

```yml
services:
  starrupture:
    container_name: starrupture
    image: struppinet/starrupture-dedicated-server:latest
    network_mode: bridge
    environment:
      - SERVER_PORT=7777
      - MULTIHOME=192.168.0.XYZ
    volumes:
      - './savegame:/home/container/server_files/StarRupture/Saved/SaveGames:rw'
      - './server:/home/container/server_files:rw'
    ports:
      - '7777:7777/udp'
      - '7777:7777'
    restart: unless-stopped
```

| Volume   | Path                                                     | Description                                                                                                    |
|----------|----------------------------------------------------------|----------------------------------------------------------------------------------------------------------------|
| savegame | /home/container/server_files/StarRupture/Saved/SaveGames | The path where the savegame will be                                                                            |
| server   | /home/container/server_files                             | The path where steam will install the starrupture dedicated server (optional to store to avoid re-downloading) |

## Environment variables server settings

You can use these environment variables for your server settings:

| Variable    | Default               | Description                                        |
|-------------|-----------------------|----------------------------------------------------|
| SERVER_PORT | 7777                  | The port that clients will connect to for gameplay |

## Links
Github [https://github.com/struppinet/starrupture-dedicated-server](https://github.com/struppinet/starrupture-dedicated-server)  
Docker [https://hub.docker.com/r/struppinet/starrupture-dedicated-server](https://hub.docker.com/r/struppinet/starrupture-dedicated-server)

## Documentation

## 252 Deployment Status

- 252 deployment status: not observed on 192.168.0.252 as of 2026-06-13; see [252 Deployment Status](../Api.GameServerInterop/docs/roadmap/252-deployment-status.md)

## Documentation

- [Docs Home](./docs/README.md)
- [Feature Index](./docs/features/README.md)
- [Core Capabilities](./docs/features/core-capabilities.md)
- [Roadmap](./docs/roadmaps/portfolio-roadmap.md)
