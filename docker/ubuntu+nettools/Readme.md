# Ubuntu Network Diagnostics Container

A lightweight Ubuntu-based Docker image with essential network troubleshooting tools pre-installed.

## Features

- Based on official `ubuntu:latest` image
- Includes essential network utilities:
  - `ping` (iputils-ping)
  - `ip` command (iproute2)
  - `traceroute` (inetutils-traceroute)
- Optimized image size through proper cleanup
- Defaults to interactive bash shell

## Image Details

```dockerfile
FROM ubuntu:latest
RUN apt update && \
    apt install -y iputils-ping iproute2 inetutils-traceroute && \
    rm -rf /var/lib/apt/lists/*
CMD ["bash"]
