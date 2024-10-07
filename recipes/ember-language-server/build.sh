#!/usr/bin/env bash

set -o xtrace -o nounset -o pipefail -o errexit

# Create package archive and install globally
mv package.json package.json.bak
jq 'del(.scripts.prepare)' package.json.bak > package.json
npm pack --ignore-scripts
npm install -ddd \
    --global \
    --build-from-source \
    ${SRC_DIR}/ember-tooling-${PKG_NAME}-${PKG_VERSION}.tgz

# Create license report for dependencies
mv package.json package.json.bak
jq 'del(.resolutions)' package.json.bak > package.json
pnpm install
pnpm-licenses generate-disclaimer --prod --output-file=third-party-licenses.txt

tee ${PREFIX}/bin/${PKG_NAME}.cmd << EOF
call %CONDA_PREFIX%\bin\node %PREFIX%\bin\ember-language-server %*
EOF
