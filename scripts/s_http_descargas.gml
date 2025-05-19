//poner esto al iniciar el juego

if os_is_network_connected() {
    ini_open("config.ini");
    if !ini_key_exists("config", "instalado") {
        ini_write_string("config", "instalado", "1");
        http_get("http://www.omarsauriogames.ml/mysql_omarsauriogames.php?ff=si&game=selewo&version=?&jugadores=?&puntajes=?&descargas=?&ac=?");
    }
    ini_close();
}

