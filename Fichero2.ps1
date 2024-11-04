#1.Muestra las propiedades básicas del adaptador de red. (Get-Ne...)
function getRed {
    Get-NetAdapter;
}
#2. Muestra configuración de la dirección IP, tanto IPv4 como IPv6 y las interfaces de red respectivas. (Get-NetIp...)

#3. Ejecuta comando Get-NetIPConfiguration, indicando que realiza.

#4. Ejecuta comando Get-NetConnectionProfile

#5. Muestra la ruta que usan los paquetes en el proceso de envío y recepción

#6. Muestra la información detallada de cada adaptador indicando su estado, velocidad e identificador VLAN si posee alguno

#7. Ejecuta tracert.

#8. Comprueba el estado de los puertos abiertos del equipo

#9. Ejecutar NSLOKKUP. ¿Qué realiza este comando?

#10. Comprueba el estado actual de la red (Get-NetTC....)

#11. La ruta que usan los paquetes de nuestra red en el proceso de envío y recepción. (Get-NetRoute)

#12. Obtener información detallada de cada adaptador indicando su estado, velocidad, etc.(Get-NetAdapter | ft Name)

#13. Realizar un test de los puertos de nuestro sistema.

#14. Obtener la dirección MAC de nuestra interfaz de red. Investiga la posibilidad de cambiar la misma

#salir
function salir{
Write-Output "Saliendo"
exit
}
#Menu
function menu{
    Write-Output "Elige la opción:
    1. Muestra las propiedades básicas del adaptador de red. (Get-Ne...)
    2. Muestra configuración de la dirección IP, tanto IPv4 como IPv6 y las interfaces de red respectivas. (Get-NetIp...)
    3. Ejecuta comando Get-NetIPConfiguration, indicando que realiza.
    4. Ejecuta comando Get-NetConnectionProfile
    5. Muestra la ruta que usan los paquetes en el proceso de envío y recepción
    6. Muestra la información detallada de cada adaptador indicando su estado, velocidad e identificador VLAN si posee alguno
    7. Ejecuta tracert.
    8. Comprueba el estado de los puertos abiertos del equipo
    9. Ejecutar NSLOKKUP. ¿Qué realiza este comando?
    10. Comprueba el estado actual de la red (Get-NetTC....)
    11. La ruta que usan los paquetes de nuestra red en el proceso de envío y recepción. (Get-NetRoute)
    12. Obtener información detallada de cada adaptador indicando su estado, velocidad, etc.(Get-NetAdapter | ft Name)
    13. Realizar un test de los puertos de nuestro sistema.
    14. Obtener la dirección MAC de nuestra interfaz de red. Investiga la posibilidad de cambiar la misma
    15. Salir
    "
    $option= Read-Host "Opcion"
    switch ($option){
        1{getRed}
        2{}
        3{}
        4{}
        5{}
        6{}
        7{}
        8{}
        9{}
        10{}
        11{}
        12{}
        13{}
        14{}
        15{salir}
        default{Write-Output "Error numero fuera del rango del menu, pulse 7 para salir"}
    }
}

#Main
do{
    Menu
}while ($option -ne 7)