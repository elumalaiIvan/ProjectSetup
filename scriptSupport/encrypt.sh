#!/bin/bash
set -e
openssl enc -aes-256-cbc -salt -in loginSecrets.sh -out sample.enc

echo "encrypted"
