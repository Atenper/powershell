#1.Muestra las propiedades basicas del adaptador de red. (Get-Ne...)
function getRed {
    Get-NetAdapter;
}
#2. Muestra configuracion de la direccion IP, tanto IPv4 como IPv6 y las interfaces de red respectivas. (Get-NetIp...)
function getIP{
    Get-NetIPAddress;
}
#3. Ejecuta comando Get-NetIPConfiguration, indicando que realiza.
function getIPConfig{
    Get-NetIPConfiguration;
    write-host "Este comando muestra informacion sobre la configuracion IP de cada interfaz de red";
}

#4. Ejecuta comando Get-NetConnectionProfile
function getIPCP{
    Get-NetConnectionProfile;
}


#5. Muestra la ruta que usan los paquetes en el proceso de envio y recepcion
function testConnect{
    $ruta=Read-Host "Dame la ruta quieres comprobar";
    test-connection $ruta -traceroute;
}

#6. Muestra la informacion detallada de cada adaptador indicando su estado, velocidad e identificador VLAN si posee alguno
function getAdapter{
    Get-NetAdapter | Format-Table Name,Status,LinkSpeed,MacAddress
}

#7. Ejecuta tracert.
function getTrace{
    $ruta=Read-Host "Dame una direccion ip o nombre de dominio";
    tracert $ruta;
}

#8. Comprueba el estado de los puertos abiertos del equipo
function tryPort{
    Get-NetTCPConnection;
}
#9. Ejecutar NSLOKKUP. ¿Que realiza este comando?
function getNS{
    $ruta=Read-Host "Dame una direccion ip o nombre de dominio";
    nslookup $ruta;
}

#10. Comprueba el estado actual de la red (Get-NetTC....)
function tryRed{
    Get-netTCPSetting;
}
#11. La ruta que usan los paquetes de nuestra red en el proceso de envi­o y recepcion. (Get-NetRoute)
function getRuta{
    Get-netroute;
}
#12. Obtener informacion detallada de cada adaptador indicando su estado, velocidad, etc.(Get-NetAdapter | ft Name)
function getAdapter2{
    Get-NetAdapter | Format-Table Name,Status,LinkSpeed,MacAddress
}

#13. Realizar un test de los puertos de nuestro sistema.

#14. Obtener la direccion MAC de nuestra interfaz de red. Investiga la posibilidad de cambiar la misma


#salir
function salir{
Write-Output "Saliendo"
exit
}
#Menu
function menu{
    Write-Host "Elige la opcion:
    1. Muestra las propiedades basicas del adaptador de red. (Get-Ne...)
    2. Muestra configuracion de la direccion IP, tanto IPv4 como IPv6 y las interfaces de red respectivas. (Get-NetIp...)
    3. Ejecuta comando Get-NetIPConfiguration, indicando que realiza.
    4. Ejecuta comando Get-NetConnectionProfile
    5. Muestra la ruta que usan los paquetes en el proceso de envi­o y recepcion
    6. Muestra la informacion detallada de cada adaptador indicando su estado, velocidad e identificador VLAN si posee alguno
    7. Ejecuta tracert.
    8. Comprueba el estado de los puertos abiertos del equipo
    9. Ejecutar NSLOKKUP. ¿Que realiza este comando?
    10. Comprueba el estado actual de la red (Get-NetTC....)
    11. La ruta que usan los paquetes de nuestra red en el proceso de envi­o y recepcion. (Get-NetRoute)
    12. Obtener informacion detallada de cada adaptador indicando su estado, velocidad, etc.(Get-NetAdapter | ft Name)
    13. Realizar un test de los puertos de nuestro sistema.
    14. Obtener la direccion MAC de nuestra interfaz de red. Investiga la posibilidad de cambiar la misma
    15. Salir
    " -Background Black -Foreground Cyan
    $option= Read-Host "Opcion"
    switch ($option){
        1{getRed}
        2{getIP}
        3{getIPConfig}
        4{getIPCP}
        5{testConnect}
        6{getAdapter}
        7{getTrace}
        8{tryPort}
        9{getNS}
        10{tryRed}
        11{getRuta}
        12{getAdapter2}
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