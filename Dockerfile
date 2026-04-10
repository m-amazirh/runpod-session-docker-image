FROM nvidia/cuda:12.4.0-runtime-ubuntu22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip3 install --no-cache-dir huggingface-hub

# Download latest llama.cpp server with CUDA support
RUN curl -L https://github.com/ggerganov/llama.cpp/releases/latest/download/llama-server-linux-x64-cuda -o /usr/local/bin/llama-server && \
    chmod +x /usr/local/bin/llama-server

# Create models directory
RUN mkdir -p /models

# Copy startup script
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

# Expose port
EXPOSE 8080

# Set entrypoint
ENTRYPOINT ["/startup.sh"]
