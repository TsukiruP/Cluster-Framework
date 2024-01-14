/// player_collision_semisolids()

// Reset platform check:
platform_check = true;

// Disable platform collision:
if (mode != 0 || (ground == false && y_speed <= 0)) {
    platform_cheeck = false;
}

// Also disable if colliding from the top:
var collision_test;

collision_test = player_collision_object(SIDE_MAIN, par_terrain);

if (collision_test != noone) {
    if (collision_test.type == SOLID_SEMI) {
        if (player_collision_object(SIDE_TOP_EXT, collision_test)) collision_test.platform_check = false;
        else collision_test.platform_check = true;
    }
}
