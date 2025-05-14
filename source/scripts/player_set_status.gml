/// player_set_status(status, [val])
/// @desc Sets the player's status.
/// @param {int} status
/// @param {any} [val]
/// @returns {void}

var _status; _status = argument[0];
var _val; if (argument_count > 1) _val = argument[1]; else _val = 0;

switch (_status)
{
    case STATUS_SHIELD:
        if (status_shield == _val) exit;
        
        if (_val > SHIELD_NONE)
        {
            status_shield = _val;
            status_shield_allow = true;
            audio_play_sfx(pick(_val - SHIELD_BASIC, "snd_shield_basic", "snd_shield_basic", "snd_shield_bubble", "snd_shield_fire", "snd_shield_lightning"));
        }
        else status_shield = 0;
        break;
    
    case STATUS_INVIN:
        status_invin = _val;
        
        if (_val == INVIN_BUFF)
        {
            status_invin_alarm = 1380;
            audio_play_jng("jng_invin");
        }
        break;
    
    case STATUS_SPEED:
        status_speed = _val;
        
        switch (_val)
        {
            case SPEED_UP:
                status_speed_alarm = 900;
                audio_play_jng("jng_speed");
                break;
            
            case SPEED_SLOW:
                status_speed_alarm = 1200;
                if (!input_cpu) audio_stop_jng("jng_speed");
                break;
            
            default:
                status_speed_alarm = 0;
        }
        break;
    
    case STATUS_PANIC:
        status_panic_alarm = _val;
        break;
    
    case STATUS_SWAP:
        break;
}
