/// collision_rectangle_list(x1, y1, x2, y2, obj, prec, notme, list, ordered)
// Populates the given DS list with the IDs of instances of the given object colliding within the given rectangle.
// It optionally orders them by distance from the center of the rectangle and returns the number of instances found to be in collision.

var x1, y1, x2, y2, obj, prec, notme, list, ordered, size;
x1      = argument0;
y1      = argument1;
x2      = argument2;
y2      = argument3;
obj     = argument4;
prec    = argument5;
notme   = argument6;
list    = argument7;
ordered = argument8;
size    = ds_list_size(list);

// Check for ordering:
if (ordered)
{
    // Setup priority and rectangle center:
    var priority, cx, cy;
    priority = ds_priority_create();
    cx       = mean(x1, x2);
    cy       = mean(y1, y2);

    // Evaluate:
    with (obj)
    {
        if (!notme || id != other.id)
        {
            // Continue if there's no collision:
            if (!collision_rectangle(x1, y1, x2, y2, id, prec, false)) continue;
            
            // Add to priority:
            ds_priority_add(priority, id, point_distance(cx, cy, id.x, id.y));
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
            if (!collision_rectangle(x1, y1, x2, y2, id, prec, false)) continue;

            // Add to list:
            ds_list_add(list, id);
        }
    }
}

// Return the number of collisions:
return ds_list_size(list) - size;
