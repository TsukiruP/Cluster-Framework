/// instance_nearest_dir_x(x, y, obj, dir, dist, [n])
// Returns the nearest object in a direction.

var x_int, y_int, obj, dir, n, inst, inst_dir;

x_int = argument0;
y_int = argument1;
obj = argument2;
dir = argument3;
dist = argument4;
n = 1;

if (argument_count >= 6)
{
    n = argument[5];
}

// Evaluate all objects:
repeat (instance_number(obj))
{
    inst = instance_nth_nearest(x_int, y_int, obj, n);

    // Abort:
    if (distance_to_object(inst) > dist || !instance_exists(inst))
    {
        break;
    }

    inst_dir = dcos(round(direction_to_object(inst) / ANGLE_LEFT) * ANGLE_LEFT);

    // Return:
    if (inst_dir == dir)
    {
        return inst;
    }

    n += 1;
}

// Failure:
return noone;
