/// player_handle_badnik()
//
/*
var badnik_handle;

// Nearest badnik:
badnik_handle = instance_nearest(x, y, par_badnik);

// Exit if there's no nearest handle:
if (badnik_handle == noone) {
    exit;
}

// Destroy badnik:
if ((player_collision_prop(badnik_handle, SIDE_MAIN) && status_invin == INVIN_BUFF) || player_collision_prop(badnik_handle, SIDE_MAIN, 2)) {
    // Check invincibility:
    if (badnik_handle.badnik_invin == 0) {
        // Super badnik bounce:
        if (badnik_handle.badnik_super == true) {
            // Set speed:
            g_speed *= -0.5;
            x_speed *= -0.5;
            y_speed *= -0.5;
        }
        
        // Decrease badnik health:
        badnik_handle.badnik_health -= 1;
        
        if (badnik_handle.badnik_health == 0 || status_invin == INVIN_BUFF) {
            // Bounce:
            if (badnik_handle.badnik_super == false) {
                // Subtract:
                if (y > badnik_handle.y || sign(y_speed) == -1) {
                    y_speed -= 1;
                }
                
                // Rebound:
                else if (y < badnik_handle.y && sign(y_speed) == 1) {
                    y_speed *= -1;
                }
            }
            
            // Total score:
            global.game_score += 100 + (400 * (badnik_handle.badnik_super == true));
            
            // Destroy:
            with (badnik_handle) {
                effect_create(ctl_explosion_badnik, x, y);
                instance_destroy();
            }
            
            // Play sound:
            sound_play("snd_destroy");
        }
        
        // Badnik invincibility:
        else if (badnik_handle.badnik_super == true) {
            with (badnik_handle) {
                badnik_invin = 32;
            }
        }
    }
}

// Get hurt:
else if ((player_collision_prop(badnik_handle, SIDE_MAIN, 0, true) || player_collision_prop(badnik_handle, SIDE_MAIN, 1, true)) && status_shield - SHIELD_MAGNETIC != badnik_handle.hitbox_element) {
    player_set_damage(badnik_handle);
}
