#!/usr/bin/env bash

set -euo pipefail

readonly INSTALL_CHECK_INTERVAL_SECONDS=5

is_xcode_command_line_tools_installed() {
  xcode-select -p >/dev/null 2>&1
}

start_xcode_command_line_tools_installation() {
  local output
  local exit_code

  echo "Xcode Command Line Tools are not installed."
  echo "Starting the installer..."

  if output="$(xcode-select --install 2>&1)"; then
    [ -z "$output" ] || printf '%s\n' "$output"
    return
  else
    exit_code=$?
  fi

  case "$output" in
    *"already installed"* | *"already been requested"*)
      printf '%s\n' "$output"
      ;;
    *)
      [ -z "$output" ] || printf '%s\n' "$output" >&2
      echo "Failed to start the Xcode Command Line Tools installer." >&2
      exit "$exit_code"
      ;;
  esac
}

wait_for_xcode_command_line_tools_installation() {
  echo "Waiting for Xcode Command Line Tools installation to complete."
  echo "Press Ctrl+C to stop waiting."

  until is_xcode_command_line_tools_installed; do
    sleep "$INSTALL_CHECK_INTERVAL_SECONDS"
  done

  echo "Xcode Command Line Tools installation is complete."
}

main() {
  if is_xcode_command_line_tools_installed; then
    echo "Xcode Command Line Tools are already installed."
    exit 0
  fi

  start_xcode_command_line_tools_installation
  wait_for_xcode_command_line_tools_installation
}

main "$@"
