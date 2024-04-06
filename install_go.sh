#!/bin/bash

add_to_path() {
  # Prompt for shell type
  read -p "Enter your shell type (zsh/bash): " shell_type

  # Check user input and proceed accordingly
  case "$shell_type" in
    "zsh")
      echo 'export PATH="$PATH:/usr/local/go/bin"' >> ~/.zshrc
      echo 'export GOROOT="/usr/local/go"' >> ~/.zshrc
      echo 'export GOPATH="$HOME/go"' >> ~/.zshrc
      ;;
    "bash")
      echo 'export PATH="$PATH:/usr/local/go/bin"' >> ~/.bashrc
      echo 'export GOROOT="/usr/local/go"' >> ~/.bashrc
      echo 'export GOPATH="$HOME/go"' >> ~/.bashrc
      ;;
    *)
      echo "Unsupported shell. Please manually add these configurations to your shell configuration file."
      return
      ;;
  esac
}

latest_go_version=$(curl -s https://golang.org/VERSION?m=text)
if wget -q "https://dl.google.com/go/$latest_go_version.linux-amd64.tar.gz"; then
  sudo tar -C /usr/local -xzf "$latest_go_version.linux-amd64.tar.gz"
  rm "$latest_go_version.linux-amd64.tar.gz"
  add_to_path
  
  # Color codes
  RED='\033[0;31m'
  GREEN='\033[0;32m'
  NC='\033[0m' # No Color
  clear
  
  # ASCII art
  echo -e "${GREEN}"
  echo "                                                                                                   "
  echo "                                                                                                   "
  echo "                                            +++++++++                   +++++++                     "
  echo "                                       ++++++++++++++++++         ++++++++++++++++++                "
  echo "                                     ++++++++++++++++++++++     +++++++++++++++++++++               "
  echo "                                   +++++++++++++++++++++++++  +++++++++++++++++++++++++             "
  echo "                 +++++++++++++++  ++++++++++++   +++++++++++ ++++++++++++   ++++++++++++            "
  echo "                                 ++++++++++         +++     +++++++++          ++++++++++           "
  echo "           +++++++++++++++++++  +++++++++      +++++++++++++++++++++            +++++++++           "
  echo "                                +++++++++    ++++++++++++++++++++++              ++++++++           "
  echo "                    +++++++++   ++++++++    +++++++++++++++++++++++             +++++++++           "
  echo "                                +++++++++   +++++++++++++++++++++++             ++++++++            "
  echo "                                ++++++++++         +++++++++++++++++          ++++++++++            "
  echo "                                ++++++++++++    +++++++++++++++++++++++    ++++++++++++             "
  echo "                                 +++++++++++++++++++++++++  +++++++++++++++++++++++++               "
  echo "                                   +++++++++++++++++++++      ++++++++++++++++++++++                "
  echo "                                     +++++++++++++++++         ++++++++++++++++++                   "
  echo "                                        ++++++++++                 ++++++++++                       "
  echo "                                                                                                   "
  echo "                                                                                                   "
  echo -e "${NC}"
  
  echo -e "${GREEN}Go has been successfully installed and configured.${NC}"
else
  echo -e "${RED}[!!] There was an error downloading the latest Go release.${NC}"
fi
