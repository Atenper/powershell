#1. Muestre por pantalla los procesos del sistema.
function showProcesos{
    Write-Output "Procesos en ejecucion: $(Get-Process| Out-String)"
}

#2. Pida por pantalla el nombre de un proceso y  Detenerlo. Realiza una espera hasta que se haya detenido por completo el proceso anterior.
function stopProceso{

}

#3. Pedir el nombre de un procesos y espera durante unos segundos (pedidos por pantalla) que se detenga el proceso indicado.
function stopProcesoDelay{

}

#4. Inicia el Notepad.exe proceso. Maximiza la ventana y la conserva hasta que se finalice el proceso.
function startNote{

}

#5. Inicia PowerShell mediante la opción Ejecutar como administrador
function startPSAdmin{

}


function salir{
Write-Output "Saliendo"
exit
}
#Menu
function menu{
    Write-Output "Elige la opción:
    1. Muestre por pantalla los procesos del sistema.
    2. Pida por pantalla el nombre de un proceso y  Detenerlo. Realiza una espera hasta que se haya detenido por completo el proceso anterior.
    3. Pedir el nombre de un procesos y espera durante unos segundos (pedidos por pantalla) que se detenga el proceso indicado.
    4. Inicia el Notepad.exe proceso. Maximiza la ventana y la conserva hasta que se finalice el proceso.
    5. Inicia PowerShell mediante la opción Ejecutar como administrador
    6. Salir
    "
    $option= Read-Host "Opcion"
    switch ($option){
        1{showProcesos}
        2{stopProceso}
        3{stopProcesoDelay}
        4{startNote}
        5{startPSAdmin}
        6{salir}
        default{Write-Output "Error numero fuera del rango del menu, pulse 6 para salir"}
    }
}

#Main
do{
    Menu
}while ($option -ne 7)