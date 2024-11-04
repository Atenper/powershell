function altaMasiva{
    $path= Read-Host "Dame la direccion del archivo CSV"
    $listadeusuarios=Import-Csv -Path $path
    echo $listadeusuarios
    foreach($i in $listadeusuarios){
        echo $i.pass
        $userpassword=ConvertTo-SecureString $i.pass -AsPlainText -Force
        New-LocalUser $i.user -Password $userpassword
    }
}

function bajaMasiva{
    $path= Read-Host "Dame la direccion del archivo CSV"
    $listadeusuarios=Import-Csv -Path $path
    foreach($i in $listadeusuarios){
        echo $i.pass
        $userpassword=ConvertTo-SecureString $i.pass -AsPlainText -Force
        Remove-LocalUser $i.user -Password $userpassword
    }
}


function salir{
Write-Output "Saliendo"
exit
}
#Menu
function menu{
    
    Write-Host "Elige la opción:
    1. Alta masiva de usuarios, solicitando el nombre del fichero de carga por pantalla.
    2. Borrado masivo de usuarios.
    3. Cambio de contraseña de usuarios. Se solicitara el usuario por pantalla.
    4. Salir
    " -BackgroundColor Black -ForegroundColor DarkCyan
    $option= Read-Host "Opcion" 
    switch ($option){
        1{altaMasiva}
        2{bajaMasiva}
        3{editPass}
        4{salir}
        default{Write-Output "Error numero fuera del rango del menu, pulse 6 para salir"}
    }
}

#Main
do{
    Menu
}while ($option -ne 4)