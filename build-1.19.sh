#!/bin/bash
# Script para compilar Minecraft Nodes para la versión 1.19.4

echo "Compilando Minecraft Nodes para la versión 1.19.4..."
echo

echo "Limpiando builds anteriores..."
./gradlew clean

echo
echo "Compilando módulo nodes para 1.19..."
cd nodes
./gradlew clean build shadowJar -P1.19
if [ $? -ne 0 ]; then
    echo "Error al compilar el módulo nodes"
    exit 1
fi

echo
echo "Compilando módulo ports para 1.19..."
cd ../ports
./gradlew clean build shadowJar -P1.19
if [ $? -ne 0 ]; then
    echo "Error al compilar el módulo ports"
    exit 1
fi

cd ..
echo
echo "================================"
echo "Compilación completada exitosamente!"
echo
echo "Archivos generados:"
echo "- nodes/build/libs/nodes-1.19-SNAPSHOT-0.0.10.jar"
echo "- ports/build/libs/nodes-ports-1.19-0.0.9.jar"
echo "================================"
echo
