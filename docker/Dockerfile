# Use the official Ubuntu base image
FROM ubuntu:latest

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install required tools
RUN apt-get update && \
    apt-get install -y iputils-ping iproute2 inetutils-traceroute && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set default command to bash
CMD ["/bin/bash"]

