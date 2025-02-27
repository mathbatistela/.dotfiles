#!/usr/bin/env bash

OS="unkown"

case "$OSTYPE" in
  solaris*) OS="LINUX" ;;
  darwin*)  OS="MACOS" ;;
  linux*)   OS="LINUX" ;;
  bsd*)     OS="LINUX" ;;
  msys*)    OS="WINDOWS" ;;
  cygwin*)  OS="WINDOWS" ;;
  *)        OS="unknown" ;;
esac

is_windows () {
  [ "$OS" == "WINDOWS" ]
}

is_macos () {
  [ "$OS" == "MACOS" ]
}

is_linux () {
  [ "$OS" == "LINUX" ]
}

validateOs() {
  printSection "Validating OS"

  if ! is_linux; then
    printError "This script only supports Linux."
    printSectionEnd
    return
  fi

  printSuccess "$OS"
  printSectionEnd
}
