#!/bin/bash
# Function to add Go-related environment variables to shell configuration
add_to_path() {
  # Prompt for shell type
  shell_type=$SHELL
  # Check user input and proceed accordingly
  case "$shell_type" in
    "/usr/bin/zsh")
      echo 'export PATH="$PATH:/usr/local/go/bin"' >> ~/.zshrc
      echo 'export GOROOT="/usr/local/go"' >> ~/.zshrc
      echo 'export GOPATH="$HOME/go"' >> ~/.zshrc
      ;;
    "/usr/bin/bash")
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

# Function to install and set up Go
install_go() {
  # Get the latest Go version
  latest_go_version=$(curl -s 'https://go.dev/VERSION?m=text')
  
  if wget -q "https://dl.google.com/go/${latest_go_version}.linux-amd64.tar.gz"; then
    # Extract the downloaded Go release to /usr/local
    sudo tar -C /usr/local -xzf "${latest_go_version}.linux-amd64.tar.gz"
    rm "${latest_go_version}.linux-amd64.tar.gz" # Remove the downloaded tar.gz file after extraction
    # Add Go-related environment variables to the shell configuration
    add_to_path
    
    # Clear the terminal before displaying output
    clear
    # Color codes
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    NC='\033[0m' # No Color
    # ASCII art of the Go logo
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
    
    # Success message
    echo -e "${GREEN}Go has been successfully installed and configured.${NC}"
  else
    # Error message if download fails
    echo -e "${RED}[!!] There was an error downloading the latest Go release.${NC}"
  fi
}

# Check for options
if [ "$1" == "--setup" ]; then
  install_go
else
  echo "Usage: $0 [--setup] to install and setup Go."
fi
