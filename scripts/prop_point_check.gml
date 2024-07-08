/// prop_point_check(x, y, [semi_solid])

// Set semi solid:
if (argument_count > 2) semi_solid = argument[2];
else semi_solid = false;

if (collision_point(argument[0], argument[1], par_terrain, true, true)) {
    var terrain_collisions, terrain_count, i;

    // Get values of the terrain:
    terrain_collisions = ds_list_create();
    terrain_count      = collision_point_list(argument[0], argument[1], par_terrain, true, true, terrain_collisions, false);

    for (i = 0; i < terrain_count; i += 1) {
        var terrain_instance;

        terrain_instance = ds_list_find_value(terrain_collisions, i);

        if (terrain_instance.collision == true) {
            if (terrain_instance.type == SOLID_FULL || (terrain_instance.type == SOLID_SEMI && semi_solid == true)) {
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
