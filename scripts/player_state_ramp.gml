/// player_state_ramp(phase)
/// @desc Variant of air with a different animation.
/// @param {int} phase
/// @returns {bool}

var _phase; _phase = argument0;

switch (_phase)
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
        y_speed += gravity_force;

        player_animation_ramp();
        break;

    case STATE_FINISH:
        break;
}
