#!/usr/bin/env sh

set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
SRC_DIR="$SCRIPT_DIR/.."
VENV_PYTHON="$SCRIPT_DIR/../.venv/bin/python"
ENV_FILE="$SRC_DIR/.env"
CONFIG_FILE="$SRC_DIR/mkdocs.yml"
OUTPUT_DIR="$SRC_DIR/dist"

if [ ! -x "$VENV_PYTHON" ]; then
    echo "Missing virtual environment Python at $VENV_PYTHON" >&2
    echo "Create the virtual environment and install dependencies first." >&2
    exit 1
fi

if [ -f "$ENV_FILE" ]; then
    set -a
    # shellcheck disable=SC1090
    . "$ENV_FILE"
    set +a
fi

exec "$VENV_PYTHON" -m mkdocs build -f "$CONFIG_FILE" -d "$OUTPUT_DIR"