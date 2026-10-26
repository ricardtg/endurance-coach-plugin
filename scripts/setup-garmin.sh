#!/usr/bin/env bash
# Connects the endurance-coach plugin to your Garmin account (Mac/Linux).
# Your password and MFA code are typed here, in your own Terminal, and are never sent to Claude.
# Tokens are saved in ~/.garminconnect and last about 6 months; run this again when they expire.
set -euo pipefail

GARMIN_MCP="git+https://github.com/Taxuspt/garmin_mcp@a2ca5fcac34524b83814fe2fcf3d479f8a75983f"

if ! command -v uvx >/dev/null 2>&1; then
  if command -v brew >/dev/null 2>&1; then
    echo "Installing uv with Homebrew..."
    brew install uv
  else
    echo "Installing uv (https://astral.sh/uv)..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    export PATH="$HOME/.local/bin:$PATH"
  fi
fi

echo
echo "Log in with your Garmin Connect email and password."
echo "If your account uses 2-step verification, Garmin will send you a code."
echo
echo "Note: your password will NOT appear on screen while you type it. That is normal. Type it and press Return."
echo
# Read from the keyboard even when this script is piped from curl.
if (: < /dev/tty) 2>/dev/null; then
  uvx --python 3.12 --from "$GARMIN_MCP" garmin-mcp-auth "$@" < /dev/tty
else
  uvx --python 3.12 --from "$GARMIN_MCP" garmin-mcp-auth "$@"
fi

echo
echo "Done. Now QUIT the Claude app completely (Cmd+Q) and open it again."
echo "Then, in a project with your coaching folder, say: coach"
