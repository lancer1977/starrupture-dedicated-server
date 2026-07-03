# Validation

Run the repo-native validation gate from the repository root:

```bash
bash scripts/validate.sh
```

The gate checks the runtime-lane docs, Dockerfile, start script, deployment manifests, and Docker Compose configuration.

## Coverage

- Required runtime/deploy files are present
- The README and docs point to the paired `../starrupture-support` home
- `scripts/start.sh` keeps the StarRupture Steam app update and Windows server executable launch path
- Local, nginx, portainer, and published compose files parse with `docker compose config --quiet`

## Environment

Validation is secret-free. Optional local runtime defaults are documented in [`.env.example`](../.env.example).
