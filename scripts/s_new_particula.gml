// arg0: posicion x
// arg1: posicion y
// arg2: bool crece
// arg3: bool esrojo
// ret: id de particula creada o noone

var aux = noone;
if argument2 or !collision_point(argument0, argument1, o_particula, true, false) {
    with o_particula {
        if !activo {
            aux = id;
            activo = true;
            chispa = m_chispa_s;
            direction = random(360);
            x = argument0;
            y = argument1;
            mundo = instance_nearest(x, y, o_mundo);
            break;
        }
    }
    if aux == noone {
        aux = instance_create(argument0, argument1, o_particula);
    }
    aux.crece = argument2;
    aux.esrojo = argument3;
}
return aux;

