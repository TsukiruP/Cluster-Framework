/// player_routine_land()
// Shorthand so that the player lands using their land animation.

if (on_ground == true)
{
    // Land:
    if (x_speed == 0)
    {
        // Set animation:
        player_set_animation("land");
        return player_set_state(player_state_idle);
    }

    // Run:
    return player_set_state(player_state_run);
}

// No landing:
return false;
