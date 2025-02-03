/// instance_nearest_dir_y(x, y, obj, dir, dist, [n])
/* Returns the nearest object in a direction. */

var x_int, y_int, obj, dir, n, inst, inst_dir;

x_int = argument0;
y_int = argument1;
obj = argument2;
dir = argument3;
dist = argument4;
n = 1;
if (argument_count > 5) n = argument[5];

repeat (instance_number(obj))
{
    inst = instance_nth_nearest(x_int, y_int, obj, n);

    if (distance_to_object(inst) > dist || !instance_exists(inst)) break;

    inst_dir = dsin(round(direction_to_object(inst) / ANGLE_UP) * ANGLE_UP);
    if (inst_dir == dir) return inst;
    n += 1;
}

return noone;
