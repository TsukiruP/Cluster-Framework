/// player_collision_semisolids()

// Reset platform check:
platform_check = true;

// Disable platform collision:
if (mode != 0 || (ground == false && y_speed <= 0)) {
    platform_cheeck = false;
}

// Also disable if colliding from the top:
var terrain_handle, collision_test;

terrain_handle = instance_nearest(x, y, par_terrain);
collision_main = collision_rectangle(floor(x) - (main_left * animation_direction), floor(y) - main_top, floor(x) + (main_right * animation_direction), floor(y) + main_bottom, terrain_handle, true, true);
collision_top  = collision_rectangle(floor(x) - (main_left * animation_direction), floor(y) - main_top - 1, floor(x) + (main_right * animation_direction), floor(y), terrain_handle, true, true);


if (collision_main) {
    if (terrain_handle.type == SOLID_SEMI) {
        if (collision_top == true) terrain_handle.platform_check = false;
        else terrain_handle.platform_check = true;
    }
}
