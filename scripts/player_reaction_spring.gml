/// player_reaction_spring(obj, collision)
// Bounce Pad! Wait, no...

var reaction_handle, collision;

reaction_handle = argument0;
collision       = argument1;

// Activate spring:
if (collision & COLL_HURT_RADIUS) {
    var is_dash_ring;

    // Dash ring:
    is_dash_ring = (reaction_handle.object_index == obj_dash_ring);

    // React:
    if (spring_alarm == 0 || spring_current != reaction_handle) {
        if (!(on_ground == true && (reaction_handle.spring_angle == ANGLE_LEFT || reaction_handle.spring_angle == ANGLE_RIGHT)) || is_dash_ring == true) {
            // Set state:
            player_set_state(player_state_air, true);
            y = reaction_handle.y;

            // Reset skills:
            player_reset_skill();
        } else {
            input_lock_alarm = 16;
        }

        x = reaction_handle.x;

        // Set spring:
        spring_angle    = reaction_handle.spring_angle;
        spring_strength = reaction_handle.spring_strength;

        // Set speed:
        x_speed = spring_strength *  dcos(spring_angle);
        y_speed = spring_strength * -dsin(spring_angle);

        // Set direction:
        if (dcos(spring_angle) != 0) {
            image_xscale = sign(dcos(spring_angle));
        }

        // Register:
        spring_alarm   = spring_strength + 15;
        spring_current = reaction_handle;

        // Score:
        if (is_dash_ring == true) {
            if (reaction_handle.rainbow_score == true) {
                global.game_score += 1000;

                with (reaction_handle) {
                    rainbow_score = false;
                }
            }
        }

        // Activate:
        with (reaction_handle) {
            spring_active = true;
        }

        // Play sound:
        if (reaction_handle.spring_sfx == 0) {
            switch (reaction_handle.object_index) {
                // Dash ring:
                case obj_dash_ring:
                    break;

                // Spring:
                default:
                    sound_play_single("snd_spring");
            }

            // SFX alarm:
            reaction_handle.spring_sfx = 8;
        }
    }
}
