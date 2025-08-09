variable "docker_host_ssh" {
  description = "SSH connection string for the Docker host (user@ip:port)"
  type        = string
  default     = "iman@192.168.2.142:22"  
}

variable "ssh_private_key_path" {
  description = "Path to the SSH private key for authentication"
  type        = string
  default     = "~/.ssh/id_ed25519"  # priv SSH key path
}

variable "nginx_container_name" {
  description = "Name of the Nginx container"
  type        = string
  default     = "nginx-web"
}

variable "nginx_external_port" {
  description = "Host port mapped to Nginx container"
  type        = number
  default     = 8080
}

variable "docker_network_name" {
  description = "Name of the Docker bridge network"
  type        = string
  default     = "nginx_network"
}
