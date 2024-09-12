# Use the base image specified in devcontainer.json
FROM mcr.microsoft.com/devcontainers/python:1-3.12-bullseye

# Install additional dependencies
RUN apt-get update && \
    apt-get install -y \
    ffmpeg \
    libsm6 \
    libxext6 \
    && rm -rf /var/lib/apt/lists/*
