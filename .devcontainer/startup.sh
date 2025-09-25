# Install CodeQL (bypassing SAML enforcement)
# gh extension install github/gh-codeql

URL=https://github.com/github/codeql-cli-binaries/releases
LATEST_VERSION=$(curl -L -s -H 'Accept: application/json' $URL/latest | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
ZIP=$(mktemp codeql.XXXX.zip)

echo Installing CodeQL version $LATEST_VERSION
curl -fSqL -o $ZIP $URL/download/$LATEST_VERSION/codeql-linux64.zip
unzip -q $ZIP -d /workspaces/ && rm $ZIP
# mkdir -p /home/vscode/.local/bin/
# Set up a symlink to make CodeQL available in PATH
# ln -s /workspaces/codeql/codeql /home/vscode/.local/bin/codeql

echo Installed CodeQL version $LATEST_VERSION

# # Download submodules 
git submodule init && git submodule update --recursive --depth 1

curl -L -O "https://github.com/sylwia-budzynska/codeql-workshop/releases/download/v1/test-app-db.zip"
curl -L -O "https://github.com/sylwia-budzynska/codeql-workshop/releases/download/v1/kohya_ss-db.zip"
