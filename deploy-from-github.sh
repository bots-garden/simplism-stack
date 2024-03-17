#!/bin/bash

ORGANISATION="simplism-registry"
PROJECT="say-hello"
WASM_FILE="say_hello.wasm"
VERSION="0.0.0"

curl -X POST \
http://localhost:7070/spawn \
-H 'admin-spawn-token:billbalantine' \
-H 'Content-Type: application/json; charset=utf-8' \
--data-binary @- << EOF
{
    "wasm-file":"${WASM_FILE}", 
    "wasm-url":"https://github.com/${ORGANISATION}/${PROJECT}/releases/download/v${VERSION}/${WASM_FILE}",
    "wasm-function":"handle", 
    "discovery-endpoint":"http://faas:7070/discovery", 
    "admin-discovery-token":"bobmorane",
    "admin-spawn-token":"billbalantine",
    "information": "✋ I'm the say_hello service",
    "service-name": "say-hello"
}
EOF
