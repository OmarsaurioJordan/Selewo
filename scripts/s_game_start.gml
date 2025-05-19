intro = false;
enjuego = true;
reloj = m_juego_s;
puntos = 0;
total = 0;

with o_item {
    instance_destroy();
}
s_new_item(m_inicial_items, true);
with o_player {
    x = mundo.x;
    y = mundo.y;
    direction = random(360);
}

audio_play_sound(a_change, 100, false);

with o_letrero {
    instance_destroy();
}

