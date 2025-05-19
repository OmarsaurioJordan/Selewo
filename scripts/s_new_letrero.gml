// arg0: posicion x
// arg1: posicion y
// arg2: texto
// arg3: bool esbueno
// ret: id de letrero creado

var aux = noone;
with o_letrero {
    if !activo {
        aux = id;
        activo = true;
        vida = m_letrero_s;
        x = argument0;
        y = argument1;
        break;
    }
}
if aux == noone {
    aux = instance_create(argument0, argument1, o_letrero);
}
aux.texto = argument2;
aux.esbueno = argument3;
return aux;

