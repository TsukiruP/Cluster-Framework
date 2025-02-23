/// player_state_jump(phase)
/* A jump to the sky turns to a rider kick.
Similar to air but includes a variable jump and different animation. */

switch (argument0)
{
    case STATE_START:
        var leap_force, g_speed;

        leap_force = pick(jump_bound, jump_force, 7.5, 6 + bound_count);
        g_speed = x_speed;

        x_speed = (dcos(relative_angle) * g_speed) - (leap_force * dsin(relative_angle));
        y_speed = -(dsin(relative_angle) * g_speed) - (leap_force * dcos(relative_angle));
        player_reset_air();
        player_animation_jump();
        break;

    case STATE_STEP:
        if (input_x_direction != 0)
        {
            image_xscale = input_x_direction;

            if (abs(x_speed) < top_speed || sign(x_speed) != input_x_direction)
            {
                x_speed += (acceleration * 2) * input_x_direction;
                if (abs(x_speed) > top_speed && sign(x_speed) == input_x_direction) x_speed = top_speed * input_x_direction;
            }
        }

        if (!player_movement_air()) return false;
        if (player_routine_land()) return true;
        if (player_routine_skill()) return true;

        if (jump_cap)
        {
            var input_held;

            input_held = pick(jump_aux, player_get_input(INP_JUMP, CHECK_HELD), player_get_input(INP_AUX, CHECK_HELD));
            if (y_speed < jump_release && !input_held) y_speed = jump_release;
        }

        if (abs(x_speed) > air_friction_threshold && y_speed > -4 && y_speed < 0) x_speed *= air_friction;
        y_speed += gravity_force;

        player_animation_jump();
        break;

    case STATE_FINISH:
        jump_cap = true;
        jump_aux = false;
        jump_uncurl = UNCURL_JUMP;

        if (state_current != player_state_bound)
        {
            jump_bound = BOUND_NONE;

            with (shield_inst)
            {
                if (sequence_index == sequence_shield_bubble_bound) shield_reset = true;
            }
        }
        break;
}
