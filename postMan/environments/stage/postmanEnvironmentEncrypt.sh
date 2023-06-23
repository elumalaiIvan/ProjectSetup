#!/bin/bash
set -e
openssl enc -aes-256-cbc -salt -in environment -out post.enc

echo "encrypted"
