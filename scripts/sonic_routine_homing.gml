/// sonic_routine_homing()
/* The bounce up that occurs from landing a homing attack. */

if (state_current == sonic_state_homing)
{
    x_speed = 0;
    y_speed = -jump_force;
    player_set_state(player_state_jump, false);
    animation_skip = true;
    player_set_animation("spin");
}
