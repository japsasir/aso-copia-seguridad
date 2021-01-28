#!/bin/bash

# Este script realiza una copia de seguridad de los directorios home de los usuarios nombrados. Está pensado para ser usado con el gestor de tareas 'Cron'

## Deshabilitar temporalmente los usuarios ##

# En primer lugar, deshabilitamos el login de los usuarios mientras se realiza la copia de seguridad. Usa la plantilla para añadir más usuarios.
# passwd -l $usuario
passwd -l user1
passwd -l user2
passwd -l user3
passwd -l user4

## Realizar copia de seguridad de los directorios ##

# Ahora creamos la copia de seguridad. En el nombre de la copia especificaremos la fecha de creación de manera dinámica, además del nombre del usuario. 
# Como ves, se almacenan en /backup, teniendo cada usuario su carpeta personal.
#tar -zcvpf /[Ruta_copia_seguridad]/[nombre_copia_seguridad] /[Ruta_directorio_datos]
tar -zcvpf /backup/user1-$(date +%d-%m-%Y).tar.gz /home/user1
tar -zcvpf /backup/user1-$(date +%d-%m-%Y).tar.gz /home/user2
tar -zcvpf /backup/user1-$(date +%d-%m-%Y).tar.gz /home/user3
tar -zcvpf /backup/user1-$(date +%d-%m-%Y).tar.gz /home/user4

## Restaurar el login para los usuarios ##

# Una vez realizada la copia, podemos devolver a los usuarios la capacidad de hacer login de nuevo
# passwd -u $usuario
passwd -u user1
passwd -u user2
passwd -u user3
passwd -u user4

## Reiniciar el sistema ##

# Como paso final del mantenimiento, reiniciaremos el sistema.
reboot 