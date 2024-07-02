/// player_water_splash()
//

if (instance_exists(obj_water_surface)) {
    if (water_surface == true) {
        // Create step/run splash:
        if (ground == true && abs(g_speed) > 0) {
            if (water_splash_alarm > 0) {
                water_splash_alarm -= 1;

                if (water_splash_alarm == 0) {
                    if (abs(g_speed) >= 4.50) {
                        effect_create(ctl_splash_run, floor(x), obj_water_surface.y, depth, animation_direction);
                        water_splash_alarm = 7;
                    } else {
                        effect_create(ctl_splash_step, floor(x), obj_water_surface.y, depth, animation_direction);
                        water_splash_alarm = 14;
                    }
                }
            }
        }

        // Create jump splash:
        if (ground == false && sign(y_speed) == -1) {
            effect_create(ctl_splash_run, floor(x), obj_water_surface.y, depth, animation_direction);
        }
    } else {
        water_splash_alarm = 14;
    }

    // Water surface:
    if (floor(y) + main_bottom + 1 == obj_water_surface.y) {
        water_surface = true;
    } else {
        water_surface = false;
    }
}
