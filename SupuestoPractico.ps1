#1. Liste los usuarios inactivos del sistema.
function listUsers{
    Get-ADuser -Filter * -Property Enabled | Where-Object{$_.Enabled -like "false"} | ft Name,Enabled
}
#2. Liste las cuentas de usuarios bloqueados.
function listBlock{
    Get-ADuser -Filter * -Property LockedOut | Where-Object{$_.LockedOut -like "true"}|ft Name,LockedOut
}
#3. Muestra las aplicaciones instaladas en nuestra máquina.
#2. Liste las cuentas de usuarios bloqueados.
function listApps{
    Get-WmiObject -Class Win32_Product | Select-Object -Property Name
}
#4. Mostrar una barra de progreso antes de mostrar la información de nuestra máquina.

#5. Apagar otra máquina remotamente.
function Apagar{
    $option = Read-Host "Como se llama el equipo a apagar"
    Stop-Computer -ComputerName $option
}
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
        2{listBlock}
        3{listApps}
        4{}
        5{Apagar}
        6{salir}
    }
}

#main
do{
    menu
}while($option -ne 6)