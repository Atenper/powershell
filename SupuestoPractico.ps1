#1. Liste los usuarios inactivos del sistema.
function listUsers{
    Get-ADuser -Filter * -Property Enabled
}
#2. Liste las cuentas de usuarios bloqueados.

#3. Muestra las aplicaciones instaladas en nuestra máquina.

#4. Mostrar una barra de progreso antes de mostrar la información de nuestra máquina.

#5. Apagar otra máquina remotamente.

#salir
function salir{
    Write-host "Saliendo..."
    exit
}
#Menu
function menu{
 Write-Output("Elije que opcion quieres:
    1. Liste los usuarios inactivos del sistema.
    2. Liste las cuentas de usuarios bloqueados.
    3. Muestra las aplicaciones instaladas en nuestra máquina.
    4. Mostrar una barra de progreso antes de mostrar la información de nuestra máquina.
    5. Apagar otra máquina remotamente.
    6. Salir
 ")
    $option = Read-Host "Opcion"
    switch($option){
        1{listUsers}
        2{}
        3{}
        4{}
        5{}
        6{salir}
    }
}

#main
do{
    menu
}while($option -ne 6)