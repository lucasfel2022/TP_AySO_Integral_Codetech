#!/bin/bash

# Verificar si se proporcionó una URL
if [ -z "$1" ]; then
  echo "Error: Debes proporcionar una URL."
  exit 1
fi

# Obtener la URL del primer argumento
url="$1"

# Usar curl para verificar la URL
curl -s -o /dev/null -w "%{http_code}\n" "$url"

# Obtener el código de respuesta HTTP
http_code=$?

# Mostrar el resultado
if [ "$http_code" -eq 200 ]; then
  echo "La URL '$url' está disponible."
else
  echo "La URL '$url' no está disponible."
fi
