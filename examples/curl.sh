#!/usr/bin/env bash
# CommsHarbor — free calls, no account. 
set -euo pipefail

# Self-described API index
curl -s https://commsharbor.com/api/

# Remote MCP server card (transport, protocol, tool count)
curl -s https://commsharbor.com/mcp

# Liveness and deployed commit
curl -s https://commsharbor.com/api/health
