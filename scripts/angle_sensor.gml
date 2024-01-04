/// angle_sensor(x, y)

// Exit if collision is disabled:
if(collision_allow == false) exit;

if(collision_point(floor(argument0), floor(argument1), par_terrain, true, true)) {
    var terrain_collisions, terrain_count, i;

    // Get the values of the object we're colliding with:
    terrain_collisions = ds_list_create();
    terrain_count      = collision_point_list(floor(argument0), floor(argument1), par_terrain, true, true, terrain_collisions, false);
    
    for(i = 0; i < terrain_count; i += 1) {
        var terrain_ins;
        
        terrain_instance = ds_list_find_value(terrain_collisions, i);
        
        if(terrain_instance.collision == true) {
            if((terrain_instance.type == SOLID_FULL && (terrain_instance.layer == -1 || terrain_instance.layer == layer)) ||
                (terrain_instance.type == SOLID_SEMI && terrain_instance.platform_check = true && platform_check == true)) {
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
