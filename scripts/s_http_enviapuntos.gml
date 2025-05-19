// poner arg0,1,2 en "",0,0 para pedir puntos
// arg0: nombre de usuario
// arg1: puntos
// arg2: total

if os_is_network_connected() {
    http_get("http://www.omarsauriogames.ml/selewo.php?msj=" +
        argument0 + "|" + string(argument1) + "|" + string(argument2));
}

