/// player_handle_help()
// Press the jump button to jump!

var help_handle;

// Nearest help:
help_handle = instance_nearest(x, y, par_help);

if (help_handle == noone) exit;

// Activate help:
if (ground == true && g_speed == 0 && input_cpu == false && player_collision_prop(help_handle, SIDE_MAIN) != 0) {
    // Hint box:

    // Call help:
    if (player_input[INP_UP, CHECK_PRESSED]) {
        with (help_handle) {
            player_handle = other.id;
        }

        // Set animation:
        action_state = ACTION_DEFAULT;
        g_speed      = 0;
        help_wanted  = true;

        switch (help_handle.object_index) {
            // Omochao:
            case obj_omochao:
                player_set_animation("omochao");
                break;
        }
    }
}

// Reset help:
else {
    help_wanted               = false;
    help_handle.player_handle = noone;
}
