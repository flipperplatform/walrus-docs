#!/bin/bash

PRIVATE_KEY=${PRIVATE_KEY}

if [ -z "$PRIVATE_KEY" ]; then
  echo "Error: PRIVATE_KEY not found"
  exit 1
fi

sui keytool import "$PRIVATE_KEY" ed25519 --alias viv3

sui client switch --address=viv3

echo "Sui address configured successfully."

walrus-cli info

walrus-cli daemon -b "0.0.0.0:8080" 

