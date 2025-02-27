#!/usr/bin/env bash

# shellcheck source=/packages.sh
installLinuxPackages() {
  ansible-playbook --ask-become-pass --become-user "$USER" -i ./provision/inventory/localhost ./provision/arch.yml
  printSection "Arch playbook completed"
}

installPackages() {
  printSection "Install packages and apps"

  case "$OS" in
    "LINUX") installLinuxPackages ;;
  esac

  printSectionEnd
}
