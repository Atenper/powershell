#1. Listado de puertos UDP abiertos. 
function showPuertos{
    Get-NetUDPEndpoint
}

#2. Deshabilitar elementos del adaptador de red.
function disableAdaptador{
    $nombre= Read-Host "Dame el nombre del adaptador"
    Disable-NetAdapter -Name "$nombre" 
}

#3. Ver los bytes enviados y recibidos por la interfaz wifi
function showStatistics{
    Get-NetAdapterStatistics -Name "Ethernet"
}

#4. Obtener dirección IP del adaptador wifi.
function wifiIP{
    Write-Output "La ip del adaptador Ethernet es"
    Get-NetIPAddress -InterfaceAlias "Ethernet" | Select-Object IPAddress
}

#5. Ver la tabla de enrutamiento de IPv4.
function showTable{
    Get-NetRoute -AddressFamily IPv4
}

#6. Realizar un apagado programado de otra máquina.
function stopComputer{
    $nombre= Read-Host "Nombre del ordenador que se va ha apagar"
    Stop-Computer -ComputerName "$nombre" -Force
}
#7. Crear una barra de progreso
function progressBar{
    $progress = 0
    $durationInSeconds = 10
    $interval = $durationInSeconds * 1000 / 100  # Intervalo en milisegundos para cada porcentaje
    
    while ($progress -lt 100) {
        $progress++
        Write-Progress -PercentComplete $progress -Status "Procesando" -Activity "$progress de 100"
        Start-Sleep -Milliseconds $interval
    }
    Write-Host "Proceso completado."    

}
#salir
function salir{
Write-Output "Saliendo"
exit
}
#Menu
function menu{
    Write-Output "Elige la opción:
    1. Listado de puertos UDP abiertos. 
    2. Deshabilitar elementos del adaptador de red.
    3. Ver los bytes enviados y recibidos por la interfaz wifi
    4. Obtener dirección IP del adaptador wifi.
    5. Ver la tabla de enrutamiento de IPv4.
    6. Realizar un apagado programado de otra máquina.
    7. Crea un barra de progreso.
    8. Salir
    "
    $option= Read-Host "Opcion"
    switch ($option){
        1{showPuertos}
        2{disableAdaptador}
        3{showStatistics}
        4{wifiIP}
        5{showTable}
        6{stopComputer}
        7{}
        8{salir}
        default{Write-Output "Error numero fuera del rango del menu, pulse 8 para salir"}
    }
}

#Main
do{
    Menu
}while ($option -ne 8)