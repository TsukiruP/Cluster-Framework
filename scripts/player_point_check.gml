/// player_point_check(radius_x, radius_y, [semi_solid])

// Exit if collision is disabled:
if (collision_allow == false) {
    exit;
}

// Set up arguments:
var radius_x, radius_y, semi_solid;

radius_x = argument[0];
radius_y = argument[1];

// Set semi solid:
if (argument_count > 2) semi_solid = argument[2];
else semi_solid = false;

if (collision_point(floor(x) + radius_x * y_direction + radius_y * x_direction, floor(y) + radius_y * y_direction + radius_x * -x_direction, par_terrain, true, true)) {
    var terrain_collisions, terrain_count, i;

    // Get values of the terrain:
    terrain_collisions = ds_list_create();
    terrain_count      = collision_point_list(floor(x) + radius_x * y_direction + radius_y * x_direction, floor(y) + radius_y * y_direction + radius_x * -x_direction, par_terrain, true, true, terrain_collisions, false);

    for (i = 0; i < terrain_count; i += 1) {
        var terrain_instance;

        terrain_instance = ds_list_find_value(terrain_collisions, i);

        if (terrain_instance.collision == true) {
            if ((terrain_instance.type == SOLID_FULL && (terrain_instance.layer == -1 || terrain_instance.layer == layer)) ||
                (terrain_instance.type == SOLID_SEMI && terrain_instance.platform_check = true && platform_check == true && semi_solid == true)) {
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
