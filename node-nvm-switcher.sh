#!/usr/bin/env bash
# node-nvm-switcher.sh
#   Shell script to easily switch between node/npm versions globally. Leverages nvm/npm commands.
#
# Author: Chris deWolf
# Repository: https://github.com/ChrisdeWolf/node-nvm-switcher.git
# License: MIT https://github.com/ChrisdeWolf/node-nvm-switcher/blob/master/LICENSE
#

readonly SCRIPT_NAME="$(basename "$0")"

print_usage() {
    echo "Usage: $SCRIPT_NAME [OPTIONS]"
    echo "Options:"
    echo "  -v, --version VERSION   Specify the node version to switch to"
    echo "  -h, --help              Display this help message"
    exit 1
}

# Check if there are no arguments
if [[ $# -eq 0 ]]; then
    print_usage
fi

# Parse command line options
while [[ $# -gt 0 ]]; do
    case "$1" in
        -v|--version)
            if [[ -z "$2" ]]; then
                echo "Error: No version specified."
                exit 1
            fi
            VERSION="$2"
            shift 2
            ;;
        -h|--help)
            print_usage
            ;;
        *)
            echo "Error: Unknown option '$1'."
            print_usage
            ;;
    esac
done

# Check if VERSION is set
if [[ -z "$VERSION" ]]; then
    echo "Error: No version specified."
    exit 1
fi

# Initialize nvm if not already initialized
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  

# Install and use the specified node version
nvm install "$VERSION"
nvm use "$VERSION"
nvm alias default "v$VERSION"

# Install the corresponding npm version
NPM_VERSION=$(npm --version)
npm install -g "npm@$NPM_VERSION"

echo
echo "Node/NPM versions have been updated... open a new shell for changes to reflect"

