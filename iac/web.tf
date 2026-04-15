# 1. Construir la imagen de la WEB
resource "docker_image" "img_web" {
  name = "lab/web"
  build {
    context = "../src/web"
  }
}

# 2. Construir la imagen de la API
resource "docker_image" "img_api" {
  name = "lab/api"
  build {
    context = "../src/api"
  }
}

# 3. Crear el contenedor WEB
resource "docker_container" "web" {
  name  = "web 01"
  image = docker_image.img_web.image_id
  ports {
    internal = 80
    external = var.web_port[terraform.workspace]
  }
}

# 4. Crear el contenedor API
resource "docker_container" "api" {
  name  = "api-${terraform.workspace}-01"
  image = docker_image.img_api.image_id
  ports {
    internal = 3000
    external = var.api_port[terraform.workspace]
  }
}
## 5 . Agregar base de datos
# 1. Definir la imagen oficial de MySQL
resource "docker_image" "img_mysql" {
  name = "mysql:8.0"
}

# 2. Definir el contenedor de la base de datos
resource "docker_container" "db" {
  name  = "db-${terraform.workspace}-01"
  image = docker_image.img_mysql.image_id
  # Variables de entorno necesarias para MySQL
  env = [
    "MYSQL_ROOT_PASSWORD= contraseña123",
    "MYSQL_DATABASE=base de datos lab"
  ]
  # Mapeo del puerto 3306
  ports {
    internal = 3306
    external = 3306
  }
}