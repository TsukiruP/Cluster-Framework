/// player_routine_land()

if (on_ground == true) {
    // Splash:
    if (on_surface == true) {
    }

    if (x_speed == 0) {
        player_set_animation("land");
        return player_set_state(player_state_idle);
    } else {
        return player_set_state(player_state_run);
    }
}

// No landing:
return false;
