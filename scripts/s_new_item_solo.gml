// ret: id del item creado

var aux = s_new_item(1, true);
var d;
var pp = o_player.id;
with aux {
    while point_distance(x, y, pp.x, pp.y) < 250 {
        d = irandom(360);
        x = mundo.x + lengthdir_x(250, d);
        y = mundo.y + lengthdir_y(250, d);
    }
    direction = point_direction(x, y, mundo.x, mundo.y) + random_range(-45, 45);
}
return aux;

