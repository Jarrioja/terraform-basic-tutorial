# Terraform con DigitalOcean
Este repositorio contiene código para desplegar una instancia de DigitalOcean utilizando Terraform y configurarla para ejecutar un servidor web NGINX.

### Requisitos previos
* Terraform instalado en tu máquina local.
* Una cuenta de DigitalOcean con un token de acceso.

### Configuración

Clona este repositorio en tu máquina local:
```bash
git clone <URL_del_repositorio>
cd <nombre_del_repositorio>
```
Generación de clave SSH
```bash
ssh-keygen -t rsa -b 4096 -C "tu_email@example.com" -f keys/terraform
```
Esto generará una clave SSH en el archivo keys/terraform dentro de este repositorio. Asegúrate de no compartir esta clave y de mantenerla segura. Luego, asegúrate de que el archivo de clave pública (keys/terraform.pub) sea la que se desea utilizar para agregarla a tu cuenta de DigitalOcean.



Antes de desplegar la infraestructura, necesitas configurar tus variables de entorno. Copia el archivo terraform.tfvars.example a terraform.tfvars y proporciona los valores necesarios.

```bash
cp terraform.tfvars.example terraform.tfvars
```
Completa el archivo terraform.tfvars con tu token de DigitalOcean.

### Despliegue
Inicializa Terraform para descargar los proveedores necesarios:
```bash
terraform init
```
Revisa los cambios que se realizarán con terraform plan:
``` bash
terraform plan
```
Aplica los cambios con terraform apply:
```bash
terraform apply
```
Una vez completado el despliegue, verás la dirección IP pública de tu instancia de DigitalOcean.

### Acceso a la instancia
Puedes acceder a la instancia de DigitalOcean utilizando SSH. Utiliza la clave SSH proporcionada en el archivo keys/terraform, y la dirección IP de la instancia.

```bash
ssh -i keys/terraform root@<ip_de_la_instancia>
```
### Limpieza
Una vez que hayas terminado de usar la instancia, puedes eliminarla ejecutando:

```bash
terraform destroy
```
Esto eliminará todos los recursos creados por Terraform.

¡Disfruta explorando Terraform con DigitalOcean!

Este README proporciona una guía básica para comenzar con tu repositorio de Terraform. Si necesitas más detalles sobre alguna parte específica, no dudes en pedirlos o editar este archivo según tus necesidades.