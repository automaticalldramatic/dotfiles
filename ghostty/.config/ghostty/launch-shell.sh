#!/bin/sh

# Detect OS and launch appropriate shell
case "$(uname -s)" in
    Linux*)
      # On Linux (Omarchy), launch zsh
      exec /usr/bin/zsh
      ;;
    Darwin*)
      # On macOS, launch default shell (already zsh)
      exec /bin/zsh
      ;;
    *)
      # Fallback to default shell
      exec $SHELL
      ;;
esac
