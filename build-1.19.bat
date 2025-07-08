@echo off
REM Script para compilar Minecraft Nodes para la versión 1.19.4

echo Compilando Minecraft Nodes para la versión 1.19.4...
echo.

echo Limpiando builds anteriores...
call gradlew clean

echo.
echo Compilando módulo nodes para 1.19...
cd nodes
call gradlew clean build shadowJar -P1.19
if %ERRORLEVEL% neq 0 (
    echo Error al compilar el módulo nodes
    pause
    exit /b 1
)

echo.
echo Compilando módulo ports para 1.19...
cd ..\ports
call gradlew clean build shadowJar -P1.19
if %ERRORLEVEL% neq 0 (
    echo Error al compilar el módulo ports
    pause
    exit /b 1
)

cd ..
echo.
echo ================================
echo Compilación completada exitosamente!
echo.
echo Archivos generados:
echo - nodes\build\libs\nodes-1.19-SNAPSHOT-0.0.10.jar
echo - ports\build\libs\nodes-ports-1.19-0.0.9.jar
echo ================================
echo.

pause
