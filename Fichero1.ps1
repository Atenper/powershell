#1. Muestra la version de PowerShell de tu equipo
function showPSVersion{
    Write-Output "Version de PowerShell en el sistema: $(Get-Host|Out-String)"
}

#2. Obtener informacion sobre el bosque de AD DS 
function showForest{
    Write-Output "Informacion sobre el bosque: $(Get-ADForest|Out-String)"
}

#3. Obtener informmacion sobre el dominio de AD DS
function showDomain{
    Write-Output "Informacion sobre el dominio: $(Get-ADDomain | Out-string)"
}

#4. Indica para que usaria el comando Get-ADuser jioller
function userInfo{
    Write-Output "El comando Get-ADuser nos da informacion sobre el usuario que el pidamos"
    $user= Read-Host "Dame el nombre del usuario del que quieres consultar la informacion"
    Write-Output "El resultado del comando Get-ADUser: $(Get-ADUser $user -Properties *| Out-String)"
}

#5. Dar de alta a un usuario
function addUser{
    $user= Read-Host "Escribe el nombre del usuario"
    $pass= Read-Host "Escribe el nombre del contraseña" -AsSecureString
    New-ADUser -Name $user -AccountPassword $pass
    Write-Output "Usuario creado con exito"
}

function salir{
Write-Output "Saliendo"
exit
}
#Menu
function menu{
    
    Write-Host "Elige la opción:
    1. Muestra la version de PowerShell de tu equipo
    2. Obtener informacion sobre el bosque de AD DS 
    3. Obtener informacion sobre el dominio de AD DS
    4. Indica para que usaria el comando Get-ADuser jioller
    5. Dar de alta a un usuario
    6. Salir
    " -BackgroundColor Black -ForegroundColor DarkCyan
    $option= Read-Host "Opcion" 
    switch ($option){
        1{showPSVersion}
        2{showForest}
        3{showDomain}
        4{userInfo}
        5{addUser}
        6{salir}
        default{Write-Output "Error numero fuera del rango del menu, pulse 6 para salir"}
    }
}

#Main
do{
    Menu
}while ($option -ne 6)