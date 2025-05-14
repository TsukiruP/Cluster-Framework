/// player_state_trick_bound(phase)
/// @desc Sonic and Amy's Bound trick.
/// @param {int} phase
/// @returns {bool}

var _phase; _phase = argument0;

switch (_phase)
{
    case STATE_START:
        x_speed = 0;
        y_speed = 0;
        boost_mode = false;
        player_animation_trick();
        break;

    case STATE_STEP:
        if (!player_movement_air()) return false;
        
        if (trick_windup)
        {
            if (animation_trigger)
            {
                y_speed = 2;
                trick_windup = false;
            }
            
            if (player_routine_land()) return true;
        }
        else
        {
            if (on_ground)
            {
                jump_cap = false;
                jump_bound = BOUND_TRICK;
                jump_uncurl = UNCURL_BOUND;
                audio_play_sfx("snd_bound_land", true);
                return player_set_state(player_state_jump);
            }
            
            player_air_friction();
            player_gravity_force();
            
            if (character_index == CHAR_SONIC) sonic_bound_create();
        }
        
        player_animation_trick();
        break;

    case STATE_FINISH:
        break;
}
