## 1. Preparación
cd iac
Luego, inicializa el directorio para descargar los proveedores necesarios:

terraform init
## 2. Gestión de Ambientes (Workspaces)
•	Para crear un ambiente nuevo:

terraform workspace new dev
•	Para cambiar a un ambiente existente:

terraform workspace select localhost
•	Para ver en qué ambiente estás parado:

terraform workspace show
## 3. Configuración de Variables
Para manejar los puertos de cada ambiente, utilizamos el archivo terraform.tfvars. Este archivo asigna valores automáticamente según el workspace seleccionado:
Terraform
## 4. Despliegue de la Base de Datos (MySQL)
Para integrar la base de datos, hemos agregado en web.tf un recurso de imagen y un contenedor oficial de MySQL 8.0.
Configuración clave:
Imagen: mysql:8.0
Puerto interno: 3306

## 5. Ejecución
Para aplicar los cambios y levantar los contenedores (Web, API y BD), ejecutamos:

terraform apply -auto-approve
## 6. Verificación
Una vez finalizado, para verificar usamos

docker ps
