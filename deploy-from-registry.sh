#!/bin/bash
curl -X POST \
http://localhost:7070/spawn \
-H 'admin-spawn-token:billbalantine' \
-H 'Content-Type: application/json; charset=utf-8' \
--data-binary @- << EOF
{
    "wasm-file":"./tmp/hello-world.wasm", 
    "wasm-function":"handle",
    "wasm-url": "http://registry:6060/registry/pull/hello-world.wasm",
    "discovery-endpoint":"http://faas:7070/discovery", 
    "service-name": "hello-world",
    "admin-discovery-token":"bobmorane",
    "admin-spawn-token":"billbalantine",
    "service-name": "hello-world"
}
EOF

curl -X POST \
http://localhost:7070/spawn \
-H 'admin-spawn-token:billbalantine' \
-H 'Content-Type: application/json; charset=utf-8' \
--data-binary @- << EOF
{
    "wasm-file":"./tmp/small-cow.wasm", 
    "wasm-function":"handle",
    "wasm-url": "http://registry:6060/registry/pull/small-cow.wasm",
    "discovery-endpoint":"http://faas:7070/discovery", 
    "service-name": "small-cow",
    "admin-discovery-token":"bobmorane",
    "admin-spawn-token":"billbalantine"
}
EOF

curl -X POST \
http://localhost:7070/spawn \
-H 'admin-spawn-token:billbalantine' \
-H 'Content-Type: application/json; charset=utf-8' \
--data-binary @- << EOF
{
    "wasm-file":"./tmp/small_ant.wasm", 
    "wasm-function":"handle",
    "wasm-url": "http://registry:6060/registry/pull/small_ant.wasm",
    "discovery-endpoint":"http://faas:7070/discovery", 
    "service-name": "small-ant",
    "admin-discovery-token":"bobmorane",
    "admin-spawn-token":"billbalantine"
}
EOF
