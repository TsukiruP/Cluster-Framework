/// player_handle_water_surface()
// Couldn't think of a joke. Multiplies the physics when entering or existing water.
/*
if (instance_exists(obj_water_surface)) {
    // Entering the water:
    if (y > obj_water_surface.y && yprevious < obj_water_surface.y) {
        x_speed *= 0.50;
        y_speed *= 0.25;

        // Create splash:
        if (y_speed >= 2.50) {
            effect_create(ctl_splash_large, floor(x), obj_water_surface.y, depth);
        } else {
            effect_create(ctl_splash_small, floor(x), obj_water_surface.y, depth);
        }
        
        // Play sound:
        sound_play_single("snd_splash");
    }

    // Exiting the water:
    else if (y < obj_water_surface.y && yprevious > obj_water_surface.y) {
        y_speed = max(y_speed * 2, -16);
        
        // Create splash:
        if (abs(y_speed) >= 6) {
            effect_create(ctl_splash_large, floor(x), obj_water_surface.y, depth);
        } else {
            effect_create(ctl_splash_small, floor(x), obj_water_surface.y, depth);
        }
        
        // Play sound:
        sound_play_single("snd_splash");
    }
}
