#!/bin/bash
echo %% Instalando REAL/VNC para acceso remoto gráfico. %%
sudo apt update
sudo apt install realvnc-vnc-server realvnc-vnc-viewer

echo %% Enabling VNC Server at the command line.  %%
echo
echo %% Selecciona en la configuración ACTIVAR VNC. %%
echo
echo %% Descarga https://www.realvnc.com/en/raspberrypi/ %%
echo
pause
sudo raspi-config
