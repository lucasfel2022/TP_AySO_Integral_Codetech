#!/bin/bash

# Verificar si se proporcionó un nombre de usuario
if [ -z "$1" ]; then
  echo "Error: Debes proporcionar un nombre de usuario."
  exit 1
fi

# Obtener el nombre de usuario del primer argumento
username="$1"

# Verificar si se proporcionó un grupo
if [ -z "$2" ]; then
  echo "Error: Debes proporcionar un grupo."
  exit 1
fi

# Obtener el grupo del segundo argumento
group="$2"

# Solicitar la contraseña del usuario existente
read -s -p "Introduce la contraseña del usuario existente: " password

# Crear el usuario
useradd -m -s /bin/bash -G "$group" "$username"

# Establecer la contraseña del nuevo usuario
echo "$password" | passwd --stdin "$username"

# Mostrar un mensaje de éxito
echo "Usuario '$username' creado correctamente en el grupo '$group'."
