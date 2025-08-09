output "nginx_url" {
  description = "URL to access Nginx"
  value       = "http://${split(":", split("@", var.docker_host_ssh)[1])[0]}:${var.nginx_external_port}"
}

