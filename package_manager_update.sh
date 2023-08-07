#!/bin/bash

# File to keep track of updates
LAST_UPDATE_FILE="$HOME/.pkg_manager_last_update"
touch "$LAST_UPDATE_FILE"

run_update() {
  echo "Running package manager update..."
  case "$1" in
    "npm") npm install -g npm ;;
    "yarn") yarn set version latest ;;
    "pnpm") pnpm install -g pnpm ;;
  esac
  echo "Package manager update completed."
  # Record date updated
  date +%Y-%m-%d > "$LAST_UPDATE_FILE"
}

should_run_update() {
  # Last update date file doesn't exist or last update was more than a day ago
  if [ ! -f "$LAST_UPDATE_FILE" ] || [ "$(date +%Y-%m-%d)" != "$(cat "$LAST_UPDATE_FILE")" ]; then
    return 0 # true
  else
    return 1 # false
  fi
}

if should_run_update; then
  run_update "$1"
fi

# Execute the original package manager command with the arguments
exec "$@"
