/// player_handle_omochao()
//
/*
var omochao_handle;

// Nearest Omochao:
omochao_handle = instance_nearest(x, y, obj_omochao);

if (omochao_handle == noone) exit;

// Pick up Omochao:
if (player_collision_prop(SIDE_MAIN, omochao_handle) != 0 && player_input[INP_UP, CHECK_PRESSED]) {
    if (input_cpu == false) {
        // Activate Omochao:
        with (omochao_handle) {
            player_handle = other.id;
        }

        // Set animation:
        action_state = ACTION_DEFAULT;
        g_speed      = 0;
        player_set_animation("omochao");
    }
}
