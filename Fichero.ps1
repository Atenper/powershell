#1. Muestre los usuarios del sistema
function showUsers{
    Write-Output "Usuarios del sistema: $(Get-LocalUser|Select-Object -Property Name | Out-String)"
}

#2. Pida por pantalla un usuario y contraseña y lo de de alta en el sistema
function addUser{
    $nombre= Read-Host "Dame el nombre del usuario"
    $contra= Read-Host "Dame la contraseña del usuario" -AsSecureString
    new-localUser $nombre -password $contra
    Write-Output "Usuario creado con exito"
}

#3. Mostrar los procesos que se estan ejecutando en el sistema
function showProcess{
Write-Output "Procesos en ejecucion: $(Get-Process| Out-String)"
}

#4. Eliminar un usuario del sistema
function deleteUser{
    $nombre= Read-Host "Dame el nombre del usuario a borrar"
    Remove-LocalUser -Name $nombre
    Write-Output "Usuario eliminado con exito"
}

#5. Muestra el historial del sistema
function showHistory{
Write-Output "Historial de comandos ejecutados: $(Get-History| Out-String)"
}

#6. Mostrar la informacion de nuestro equipo, redirecciona la salida del comando a un fichero, llamado "pc_info.txt"
function pcInfo{
    get-computerInfo > "./pc_info.txt"
    Write-Output "Informacion copiada con exito en el archivo pc_info.txt"
}
function salir{
Write-Output "Saliendo"
exit
}
#Menu
function menu{
    Write-Output "Elige la opción:
    1. Muestre los usuarios del sistema
    2. Pida por pantalla un usuario y contraseña y lo de de alta en el sistema
    3. Mostrar los procesos que se estan ejecutando en el sistema
    4. Eliminar un usuario del sistema
    5. Muestra el historial del sistema
    6. Mostrar la informacion de nuestro equipo, redirecciona la salida del comando a un fichero, llamado pc_info.txt
    7. Salir
    "
    $option= Read-Host "Opcion"
    switch ($option){
        1{showUsers}
        2{addUser}
        3{showProcess}
        4{deleteUser}
        5{showHistory}
        6{pcInfo}
        7{salir}
        default{Write-Output "Error numero fuera del rango del menu, pulse 7 para salir"}
    }
}

#Main
do{
    Menu
    Clear-Host
}while ($option -ne 7)