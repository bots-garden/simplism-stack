# Simplism-Stack

Simplism Stack is the on-premises edition of faas.nuage-mal.in

## Start

```bash
docker compose up -d
```

## Stop in a clean way

```bash
docker compose down
```

## Publish wasm files to the registry

```bash
curl http://localhost:6060/registry/push \
-H 'admin-registry-token:misterming' \
-F 'file=@wasm-samples/hello-world.wasm'
# 🎉 Successfully Uploaded File

curl http://localhost:6060/registry/push \
-H 'admin-registry-token:misterming' \
-F 'file=@wasm-samples/small-cow.wasm'
# 🎉 Successfully Uploaded File

curl http://localhost:6060/registry/push \
-H 'admin-registry-token:misterming' \
-F 'file=@wasm-samples/small_ant.wasm'
# 🎉 Successfully Uploaded File
```

> upload a file with another name
```bash
curl http://localhost:6060/registry/push \
-H 'admin-registry-token:misterming' \
-F 'file=@wasm-samples/hello-world.wasm;filename=hello-world.bis.wasm'
```

## Get the list of the file into the registry

```bash
curl http://localhost:6060/registry/discover \
-H 'private-registry-token:missylangylang' \
-H 'content-type:text/plain; charset=UTF-8'
```

## Deploy from GitHub

```bash
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
```

## Deploy from the registry

```bash
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
}
EOF
```

```bash
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
```

```bash
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
```

## Get the list of the services

```bash
curl http://localhost:7070/discovery \
-H 'admin-discovery-token:bobmorane' \
-H 'content-type:text/plain; charset=UTF-8'
```

## Call services

```bash
curl http://localhost:7070/service/say-hello -d 'Bob'
```

```bash
curl http://localhost:7070/service/hello-world -d 'Bob'
```

```bash
curl http://localhost:7070/service/small-cow -d '👋 Bob 🐮'
```

```bash
curl http://localhost:7070/service/small-ant -d '👋 Bob 🤭'
```

