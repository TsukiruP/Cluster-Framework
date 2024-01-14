/// line_check(radius_x, radius_y, [semi_solid])

// Exit if collision is disabled:
if (collision_allow == false) exit;

// Set up arguments:
var radius_x, radius_y, semi_solid;

radius_x = argument[0];
radius_y = argument[1];

// Set semi solid:
if (argument_count > 2) semi_solid = argument[2];
else semi_solid = false;

// Set up x and y:
var x1, y1, x2, y2;

switch (mode) {
    case 0:
        x1 = radius_x;
        y1 = 0;
        x2 = radius_x;
        y2 = radius_y;
        break;

    case 1:
        x1 =  0;
        y1 = -radius_x;
        x2 =  radius_y;
        y2 = -radius_x;
        break;

    case 2:
        x1 =  radius_x;
        y1 =  0;
        x2 =  radius_x;
        y2 = -radius_y - 1;
        break;

    case 3:
        x1 =  0;
        y1 =  radius_x;
        x2 = -radius_y - 1;
        y2 =  radius_x;
        break;
}

if (collision_line(floor(x) + x1, floor(y) + y1, floor(x) + x2, floor(y) + y2, par_terrain, true, true)) {
    // Get the values of the object we're colliding with:
    var terrain_collisions, terrain_count, i;
    terrain_collisions = ds_list_create();
    terrain_count      = collision_line_list(floor(x) + x1, floor(y) + y1, floor(x) + x2, floor(y) + y2, par_terrain, true, true, terrain_collisions, false);
    
    for (i = 0; i < terrain_count; i += 1) {
        var terrain_instance;
        
        terrain_instance = ds_list_find_value(terrain_collisions, i);
        
        if (terrain_instance.collision == true) {
            if ((terrain_instance.type == SOLID_FULL && (terrain_instance.layer == -1 || terrain_instance.layer == layer)) ||
                (terrain_instance.type == SOLID_SEMI && terrain_instance.platform_check == true && platform_check == true && semi_solid == true)) {
                ds_list_destroy(terrain_collisions);
                return true;
            }
        }
    }
    // Destroy terrain list:
    ds_list_destroy(terrain_collisions);
}

// If we've reached this point, return false:
return false;
