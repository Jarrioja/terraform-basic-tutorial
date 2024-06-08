#!/bin/bash

# Configurar frontend no interactivo para evitar preguntas interactivas durante la instalación
export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y nginx
