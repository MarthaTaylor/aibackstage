resource "docker_image" "this" {
  name = var.image
}

resource "docker_container" "this" {
  name  = var.name
  image = docker_image.this.image_id

  ports {
    internal = var.internal_port
  }

  restart = "unless-stopped"
}