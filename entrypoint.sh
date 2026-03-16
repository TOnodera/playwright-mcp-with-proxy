#!/usr/bin/env bash
set -Eeuo pipefail

MCP_PORT="${MCP_PORT:-8931}"
MCP_HOST="${MCP_HOST:-0.0.0.0}"
ARTIFACT_DIR="${ARTIFACT_DIR:-/workspace/.mcp-artifacts}"
PROXY_SERVER="${PROXY_SERVER:-http://proxy:3128}"

mkdir -p "${ARTIFACT_DIR}"

echo "Starting Playwright MCP on ${MCP_HOST}:${MCP_PORT}"
echo "Artifacts: ${ARTIFACT_DIR}"
echo "Proxy: ${PROXY_SERVER}"

exec ./node_modules/.bin/playwright-mcp \
  --port "${MCP_PORT}" \
  --host "${MCP_HOST}" \
  --browser chromium \
  --headless \
  --isolated \
  --block-service-workers \
  --output-dir "${ARTIFACT_DIR}" \
  --save-trace \
  --proxy-server "${PROXY_SERVER}"