/// instance_nearest_dir_x(x, y, obj, dir)
// Returns the nearest object in a direction.

var x_int, y_int, obj, dir;

x_int = argument0;
y_int = argument1;
obj = argument2;
dir = argument3;

// Evaluate all objects:
repeat (instance_number(obj))
{
    var inst, inst_dir;

    inst = instance_nearest(x_int, y_int, obj); //instance_nth_nearest(x_int, y_int, obj, 1);

    // Abort:
    if (!inst)
    {
        break;
    }

    inst_dir = dcos(round(direction_to_object(inst) / ANGLE_LEFT) * ANGLE_LEFT);

    // Return:
    if (inst_dir == dir)
    {
        return inst;
    }
}

// Failure:
return noone;
