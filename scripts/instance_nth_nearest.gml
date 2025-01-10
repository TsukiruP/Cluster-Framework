/// instance_nth_nearest(x, y, obj, n)
/* Returns the nth nearest instance. */

var x_int, y_int, obj, n, list, nearest;

x_int = argument0;
y_int = argument1;
obj = argument2;
n = argument3;

n = min(max(1, n), instance_number(obj));
list = ds_priority_create();
nearest = noone;

// Evaluate all objects:
with (obj)
{
    ds_priority_add(list, id, distance_to_point(x_int, y_int));
}

// Clear priority list:
repeat(n)
{
    nearest = ds_priority_delete_min(list);
}

ds_priority_destroy(list);
return nearest;
