terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "ssh://${var.docker_host_ssh}"  # Uses SSH connection

  # Optional: If your SSH key requires a passphrase, use `ssh_agent = true`
  ssh_opts = [
    "-i", var.ssh_private_key_path,
    "-o", "StrictHostKeyChecking=no",
    "-o", "UserKnownHostsFile=/dev/null"
  ]
}
resource "docker_network" "nginx_bridge" {
  name   = var.docker_network_name
  driver = "bridge"
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  name  = var.nginx_container_name
  image = docker_image.nginx.image_id
  ports {
    internal = 80
    external = var.nginx_external_port
  }
  networks_advanced {
    name = docker_network.nginx_bridge.name
  }
}

