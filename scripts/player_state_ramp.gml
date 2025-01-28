/// player_state_ramp(phase)
/* Falling with style.
Very similar to the airborne state, except you can't do anything from this.  */

switch (argument0)
{
    case STATE_START:
        player_reset_air();
        player_reset_skill();
        player_animation_ramp();
        break;

    case STATE_STEP:
        if (abs(x_speed) < top_speed)
        {
            x_speed += (acceleration * 2) * image_xscale;
            if (abs(x_speed) > top_speed && sign(x_speed) == image_xscale) x_speed = top_speed * image_xscale;
        }
        
        if (!player_movement_air()) return false;
        if (player_routine_land()) return true;

        if (abs(x_speed) > air_friction_threshold && y_speed > -4 && y_speed < 0) x_speed *= air_friction;
        if (y_allow) y_speed += gravity_force;

        player_animation_ramp();
        break;

    case STATE_FINISH:
        break;
}
