/// player_collision(x, y, layer)
// Returns true if colliding with different types of terrain.

var solid_handle, platform_handle;

// Solid:
solid_handle = instance_place(argument0, argument1, par_solid);

if(solid_handle != noone) {
    // Set collision flags:
    if(solid_handle.collision == true) {
        if(collision_point(x, argument1, solid_handle, true, true)) {
            terrain_ceiling_allow    = solid_handle.ceiling_allow;
            terrain_launch_allow     = solid_handle.launch_allow;
            terrain_launch_angle     = solid_handle.launch_angle;
            terrain_launch_direction = solid_handle.launch_direction;
            terrain_edge_exception   = solid_handle.edge_exception;
        }

        terrain_angle_change = solid_handle.angle_change;
        terrain_edge_skip    = solid_handle.edge_skip;

        return true;
    }
}

// Platforms:
if(ground == true || platform_mode == true) {
    if(place_meeting(argument0, argument1, par_platform)) {
        platform_handle = instance_place(argument0, argument1, par_platform);

        if(platform_handle != noone) {
            // Set collision flags:
            if(platform_handle.collision == true) {
                if((angle == 0 && platform_check == false) || platform_check == true) {
                    if(collision_point(x, argument1, platform_handle, true, true)) {
                        terrain_ceiling_allow    = platform_handle.ceiling_allow;
                        terrain_launch_allow     = platform_handle.launch_allow;
                        terrain_launch_angle     = platform_handle.launch_angle;
                        terrain_launch_direction = platform_handle.launch_direction;
                        terrain_edge_exception   = platform_handle.edge_exception;
                    }

                    terrain_angle_change = platform_handle.angle_change;
                    terrain_edge_skip    = platform_handle.edge_skip;

                    if(angle == 0 && platform_check == false) platform_check = true;

                    return true;
                }
            }
        }
    }
}

// Layered terrain:
if(argument2 == 0) return place_meeting(argument0, argument1, par_layer_low);
else if(argument2 == 1) return place_meeting(argument0, argument1, par_layer_high);
