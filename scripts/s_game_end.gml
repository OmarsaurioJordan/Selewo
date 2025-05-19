enjuego = false;
reloj = m_reposo_s;

with o_item {
    if !mundo.esnuevo {
        instance_destroy();
    }
}

with o_control {
    if nombre == "" {
        break;
    }
    if loc_puntos < puntos {
        loc_nombre = nombre;
        loc_puntos = puntos;
        loc_total = total;
        audio_play_sound(a_win, 100, false);
    }
    if glo_puntos < puntos {
        s_http_enviapuntos(nombre, puntos, total);
    }
}

audio_play_sound(a_change, 100, false);

