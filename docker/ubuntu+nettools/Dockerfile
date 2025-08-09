# Use the official Ubuntu base image
FROM ubuntu:latest

# Update the package lists and install necessary tools
RUN apt update && \
    apt install -y iputils-ping iproute2 inetutils-traceroute && \
    rm -rf /var/lib/apt/lists/*  # Clean up to reduce image size

# Set a default command to run when the container starts
CMD ["bash"]
