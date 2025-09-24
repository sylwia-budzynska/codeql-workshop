#!/bin/bash

# Assumes the gh CLI is present in the default Codespaces image.
gh extensions install github/gh-codeql
gh codeql version # first command starts the download of the CodeQL CLI
# Make codeql visible to VSCode by using https://github.com/github/gh-codeql#codeql-stub, since VS Code expects an executable called codeql instead of gh codeql
gh codeql install-stub ~/.local/bin/


# Install CodeQL (bypassing SAML enforcement)
# gh extension install github/gh-codeql

# URL=https://github.com/github/codeql-cli-binaries/releases
# LATEST_VERSION=$(curl -L -s -H 'Accept: application/json' $URL/latest | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
# ZIP=$(mktemp codeql.XXXX.zip)

# echo Installing CodeQL version $LATEST_VERSION
# curl -fSqL -o $ZIP $URL/download/$LATEST_VERSION/codeql-linux64.zip
# unzip -q $ZIP -d /workspaces/ && rm $ZIP
# mkdir -p /home/vscode/.local/bin/
# # Set up a symlink to make CodeQL available in PATH
# # ln -s /workspaces/codeql/codeql /home/vscode/.local/bin/codeql

# echo Installed CodeQL version $LATEST_VERSION

# # Download submodules (if any)
# git submodule init && git submodule update --recursive --depth 1
