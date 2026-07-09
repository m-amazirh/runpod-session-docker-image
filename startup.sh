#!/bin/bash
set -e

echo "=== GPU Session Startup ==="
echo "Model: ${MODEL_REPO}"
echo "Context Length: ${CTX_LEN}"
echo "API Key: ${API_KEY:********}"

echo "Starting llama.cpp server with direct HuggingFace download..."
exec /usr/local/bin/llama-server \
    -hf "${MODEL_REPO}" \
    -c "${CTX_LEN}" \
    -ngl 99 \
    --host 0.0.0.0 \
    --port 8080 \
    --api-key "${API_KEY}"
