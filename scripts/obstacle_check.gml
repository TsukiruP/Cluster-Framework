/// obstacle_check(x1, y1, x2, y2, [semi_solid])

// Exit if collision is disabled:
if (collision_allow == false) exit;

// Set up arguments:
var x1, y1, x2, y2;

x1 = argument[0];
y1 = argument[1];
x2 = argument[2];
y2 = argument[3];

// Set semi obstacle:
if (argument_count > 4) semi_solid = argument[4];
else semi_solid = false;

// Trigger the collision:
if (collision_rectangle(floor(x) - x1, floor(y) - y1, floor(x) + x2, floor(y) + y2, par_obstacle, true, true)) {
    // Get the values of the object we're colliding with:
    var obstacle_collisions, obstacle_count, i;
    obstacle_collisions = ds_list_create();
    obstacle_count      = collision_rectangle_list(floor(x) - x1, floor(y) - y1, floor(x) + x2, floor(y) + y2, par_obstacle, true, true, obstacle_collisions, false);
    
    for(i = 0; i < obstacle_count; i += 1) {
        var obstacle_instance;
        
        obstacle_instance = ds_list_find_value(obstacle_collisions, i);
        
        if (obstacle_instance.collision == true) {
            if (obstacle_instance.type == SOLID_FULL
            || (obstacle_instance.type == SOLID_SEMI && y < obstacle_instance.bbox_top + (y - yprevious) && y_speed >= 0 && semi_solid)) {
                ds_list_destroy(obstacle_collisions);
                return obstacle_instance;
            }
        }
    }
    // Destroy obstacle list:
    ds_list_destroy(obstacle_collisions);
}

// If we've reached this point, return false:
return false;
