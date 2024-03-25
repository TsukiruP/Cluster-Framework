/// player_handle_water_surface()
// Couldn't think of a joke. Multiplies the physics when entering or existing water.

// Don't bother if in the middle of respawning:
if (action_state == ACTION_RESPAWN) exit;

if (instance_exists(obj_water_surface)) {
    // Entering the water:
    if (y > obj_water_surface.y && yprevious < obj_water_surface.y) {
        x_speed *= 0.50;
        y_speed *= 0.25;

        // Splash:

    }

    // Exiting the water:
    else if (y < obj_water_surface.y && yprevious > obj_water_surface.y) {
        y_speed *= 2;
    }
}
