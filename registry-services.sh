#!/bin/bash
curl http://localhost:6060/registry/discover \
-H 'private-registry-token:missylangylang' \
-H 'content-type:text/plain; charset=UTF-8'
