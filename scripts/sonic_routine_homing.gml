/// sonic_routine_homing()
/// @desc Performs a jump after landing a homing attack.
/// @returns {void}

if (state_current == sonic_state_homing)
{
    x_speed = 0;
    y_speed = -jump_force;
    player_set_state(player_state_jump, false);
    player_reset_skill();
    animation_skip = true;
    player_set_animation("spin_flight");
}
