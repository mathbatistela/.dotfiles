#!/usr/bin/env bash

# LINUX
installLinuxDeps() {
  printMessage "updating pacman"
  sudo pacman -Syyu --noconfirm
  sudo pacman -S --needed base base-devel linux-headers git rsync python-pip python-pexpect --noconfirm
  printSuccess "done"

  # ANSIBLE
  if ! command -v ansible &> /dev/null; then
    printMessage "installing ansible..."
    sudo pacman -S ansible --needed --noconfirm
  fi
  printSuccess "ansible"
}

# INSTALL
installDependencies() {
  printSection "$OS Dependencies check"

  case "$OS" in
    "LINUX") installLinuxDeps ;;
  esac

  printSectionEnd
}
