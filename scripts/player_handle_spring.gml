/// player_handle_spring()
// Bounce Pad! Wait, that's not right.

var spring_handle, spring_ancestry;
/*
// Nearest spring:
spring_handle = instance_nearest(x, y, par_spring);

// Exit if there's no nearest handle:
if (spring_handle == noone) {
    exit;
}

// Activate spring:
if (player_collision_prop(spring_handle, SIDE_MAIN)) {
    // Spring ancestry:
    spring_ancestry = object_is_ancestor(spring_handle.object_index, par_dash_ring);

    // Activate:
    with (spring_handle) {
        if (spring_active == false) {
            spring_active = true;
        }
    }

    // Set spring variables:
    spring_strength = spring_handle.spring_strength;
    spring_angle    = spring_handle.spring_angle;

    // Set physics:
    g_speed = spring_strength *  dcos(spring_angle);
    x_speed = spring_strength *  dcos(spring_angle);
    y_speed = spring_strength * -dsin(spring_angle);

    // Move:
    if (spring_alarm == 0 || spring_current != spring_handle) {
        // Set positon:
        x = spring_handle.x;

        if (!(ground == true && (spring_angle == ANGLE_LEFT || spring_angle == ANGLE_RIGHT)) || spring_ancestry == true) {
            // Set position:
            y = spring_handle.y;

            // Set ground:
            ground = false;

            // Set state:
            player_set_state(player_state_air);
        } else {
            input_lock_alarm = 16;
        }

        // Set direction:
        if (dcos(spring_angle) != 0) {
            image_xscale = sign(dcos(spring_angle));
        }

        spring_alarm   = spring_strength + 15;
        spring_current = spring_handle;
    }

    // Add to score:
    if (spring_ancestry == true) {
        if (spring_handle.rainbow_ring == true) {
            with (spring_handle) {
                if (rainbow_score == true) {
                    global.game_score += 1000;
                    rainbow_score      = false;
                }
            }
        }
    }

    // Play sound:
    if (spring_handle.spring_sfx == 0) {
        switch (object_get_parent(spring_handle.object_index)) {
            case par_dash_ring:
                break;

            // Spring:
            default:
                sound_play_single("snd_spring");
        }

        spring_handle.spring_sfx = 8;
    }
}
