from pathlib import Path
import re

REQUIRED_ENV_KEYS = {
    "SERVER_PORT",
}


def read_env_examples(path: str = "README.md") -> dict[str, str]:
    values: dict[str, str] = {}
    for line in Path(path).read_text(encoding="utf-8").splitlines():
        match = re.search(r"(^|[^A-Za-z0-9_])([A-Z0-9_]+)=(.+)", line)
        if not match:
            continue
        key = match.group(2).strip()
        value = match.group(3).strip().strip("`| ")
        values[key] = value
    return values


def read_readme(path: str = "README.md") -> list[str]:
    return Path(path).read_text(encoding="utf-8").splitlines()


def missing_required_env_keys_from_readme(path: str = "README.md") -> set[str]:
    found = set(read_env_examples(path).keys())
    return set(REQUIRED_ENV_KEYS) - found


def has_service_port_line(lines: list[str], port: str) -> bool:
    marker = f"{port}:"
    return any(marker in line for line in lines)
