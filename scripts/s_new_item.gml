// arg0: int cuantos items crear
// arg1: bool balanceado 50/50 en viejo mundo
// ret: id de ultimo item creado

var m = instance_nearest(room_width * 0.25, room_height / 2, o_mundo);
var d, tot, bad;
var aux;
repeat argument0 {
    d = irandom(360);
    aux = instance_create(m.x + lengthdir_x(250, d),
        m.y + lengthdir_y(250, d), o_item);
    aux.direction = point_direction(x, y, m.x, m.y) + random_range(-45, 45);
    if argument1 {
        tot = 0;
        bad = 0;
        with o_item {
            if !mundo.esnuevo {
                tot++;
                if frac(tipo / 2) != 0 {
                    bad++;
                }
            }
        }
        if bad / tot > 0.5 {
            while frac(aux.tipo / 2) != 0 {
                aux.tipo = irandom(sprite_get_number(d_item) - 1);
            }
        }
        else {
            while frac(aux.tipo / 2) == 0 {
                aux.tipo = irandom(sprite_get_number(d_item) - 1);
            }
        }
    }
}
return aux;

