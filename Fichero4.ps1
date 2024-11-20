#1. Muestre por pantalla los procesos del sistema.
function showProcesos{
    Write-Output "Procesos en ejecucion: $(Get-Process| Out-String)"
}

#2. Pida por pantalla el nombre de un proceso y  Detenerlo. Realiza una espera hasta que se haya detenido por completo el proceso anterior.
function stopProceso{
    $nombre= Read-Host "Nombre del proceso para denerlo"
    $proceso = Get-Process -Name $nombre -ErrorAction Stop
    Stop-Process -InputObject $proceso -Force
    Write-Output "Esperando a que el proceso $nombre se detenga..."
        for ($i = 0; $i -lt $segundos; $i++) {
            if (-not (Get-Process -Name $nombreProceso -ErrorAction SilentlyContinue)) {
                Write-Output "El proceso $nombreProceso se detuvo antes del límite de tiempo."
                return
            }
            Start-Sleep -Seconds 1
        }
    Write-Output "El proceso $nombre se ha detenido por completo."
}

#3. Pedir el nombre de un procesos y espera durante unos segundos (pedidos por pantalla) que se detenga el proceso indicado.
function stopProcesoDelay{
    $nombre= Read-Host "Nombre del proceso para denerlo"
    $segundos= Read-Host "Cuantos segundos espero a que el proceso se apague"
    $proceso = Get-Process -Name $nombre -ErrorAction Stop
    Stop-Process -InputObject $proceso -Force
    Write-Output "Esperando a que el proceso $nombre se detenga..."
        for ($i = 0; $i -lt $segundos; $i++) {
            if (-not (Get-Process -Name $nombre -ErrorAction SilentlyContinue)) {
                Write-Output "El proceso $nombre se detuvo antes del límite de tiempo."
                return
            }
            Start-Sleep -Seconds 1
        }
    Write-Output "El proceso $nombre se ha detenido por completo."
}

#4. Inicia el Notepad.exe proceso. Maximiza la ventana y la conserva hasta que se finalice el proceso.
function startNote{
    $notepad = Start-Process -FilePath "notepad.exe" -PassThru
    Write-Output "Notepad iniciado con PID $($notepad.Id)."
    while ($notepad.HasExited -eq $false) {
        Start-Sleep -Seconds 1
    }
    Write-Output "Notepad se ha cerrado."
}

#5. Inicia PowerShell mediante la opción Ejecutar como administrador
function startPSAdmin{
    Start-Process -FilePath "powershell.exe" -Verb RunAs
    Write-Output "PowerShell iniciado como administrador."
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