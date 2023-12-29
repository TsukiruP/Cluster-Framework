/// collision_point_list(x, y, obj, prec, notme, list, ordered)
// Populates the given DS list with the IDs of instances of the given object colliding at the given point.
// It optionally orders them by distance and returns the number of instances found to be in collision.
var xx, yy, obj, prec, notme, list, ordered, size;
xx      = argument0;
yy      = argument1;
obj     = argument2;
prec    = argument3;
notme   = argument4;
list    = argument5;
ordered = argument6;
size    = ds_list_size(list);

if (ordered)
{
    var priority, i;
    priority = ds_priority_create();

    for (i = 0; i < instance_number(obj); i += 1)
    {
        var ins, coltest;
        ins     = instance_find(obj, i);
        coltest = collision_point(xx, yy, ins, prec, notme);
        if (coltest != noone)
        {
            ds_priority_add(priority, coltest, point_distance(xx, yy, coltest.x, coltest.y));
        }
    }

    while (!ds_priority_empty(priority))
    {
        ds_list_add(list, ds_priority_delete_min(priority));
    }
    ds_priority_destroy(priority);
}
else
{
    for (i = 0; i < instance_number(obj); i += 1)
    {
        var ins, coltest;
        ins     = instance_find(obj, i);
        coltest = collision_point(xx, yy, ins, prec, notme);
        if (coltest != noone)
        {
            ds_list_add(list, coltest);
        }
    }
}
return ds_list_size(list) - size;
