/// sonic_routine_homing()
// The bounce up that occurs from doing a homing attack.

if (state_current == sonic_state_homing)
{
    // Set speed:
    x_speed = 0;
    y_speed = -jump_force;

    // Set state:
    player_set_state(player_state_jump, false);

    // Set animation:
    animation_skip = true;
    player_set_animation("spin");
}
