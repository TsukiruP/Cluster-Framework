/// collision_point_list(x, y, obj, prec, notme, list, ordered)
// Populates the given DS list with the IDs of instances of the given object colliding within the given point.
// It optionally orders them by distance from the point and returns the number of instances found to be in collision.

var xx, yy, obj, prec, notme, list, ordered, size;
xx      = argument0;
yy      = argument1;
obj     = argument2;
prec    = argument3;
notme   = argument4;
list    = argument5;
ordered = argument6;
size    = ds_list_size(list);

// Check for ordering:
if (ordered)
{
    // Setup priority:
    var priority;
    priority = ds_priority_create();

    // Evaluate:
    with (obj)
    {
        if (!notme || id != other.id)
        {
            // Continue if there's no collision:
            if (!collision_point(xx, yy, id, prec, false)) continue;
            
            // Add to priority:
            ds_priority_add(priority, id, point_distance(xx, yy, id.x, id.y));
        }
    }
    
    // Add to list from priority:
    while (!ds_priority_empty(priority))
    {
        ds_list_add(list, ds_priority_delete_min(priority));
    }
    ds_priority_destroy(priority);
}
else
{
    // Evaluate:
    with (obj)
    {
        if (!notme || id != other.id)
        {
            // Continue if there's no collision:
            if (!collision_point(xx, yy, id, prec, false)) continue;

            // Add to list:
            ds_list_add(list, id);
        }
    }
}

// Return the number of collisions:
return ds_list_size(list) - size;
