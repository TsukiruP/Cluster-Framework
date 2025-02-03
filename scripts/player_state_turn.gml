/// player_state_turn(phase)
/* Turn around, every now and then I get a little bit lonely...
Flips the player's x scale and ends when the animation is finished. */

switch (argument0)
{
    case STATE_START:
        image_xscale *= -1;
        x_speed = 0;
        if (animation_current != "turn_brake") player_set_animation("turn");
        break;

    case STATE_STEP:
        if (!player_movement_ground()) return false;
        if (!on_ground) return player_set_state(player_state_air);
        
        if (relative_angle >= 90 && relative_angle <= 270) return player_set_state(player_state_air);
        else if (relative_angle >= 45 && relative_angle <= 315)
        {
            input_lock_alarm = 30;
            return player_set_state(player_state_run);
        }
        
        if (animation_trigger) return player_set_state(player_state_idle);
        if (player_routine_skill()) return true;
        if (player_routine_jump()) return true;
        break;

    case STATE_FINISH:
        break;
}
