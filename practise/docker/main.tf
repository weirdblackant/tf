resource "docker_image" "sonar" {
  name         = "sonarqube:lts"
  keep_locally = false
}

resource "docker_container" "sonar1" {
  image = docker_image.sonar.image_id
  name  = "sonarc1"
  ports {
    internal = 9000
    external = 9000
  }
}
