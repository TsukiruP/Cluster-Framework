/// player_set_status(status, value)
/* Sets the player's status. */

switch (argument0)
{
    case STATUS_SHIELD:
        if (status_shield == argument1) exit;
        
        if (argument1 > SHIELD_NONE)
        {
            status_shield = argument1;
            status_shield_allow = true;
            audio_play_sfx(pick(argument1 - SHIELD_BASIC, "snd_shield_basic", "snd_shield_basic", "snd_shield_bubble", "snd_shield_fire", "snd_shield_lightning"));
        }
        else status_shield = 0;
        break;
    
    case STATUS_INVIN:
        status_invin = argument1;
        
        if (argument1 == INVIN_BUFF)
        {
            status_invin_alarm = 1380;
            audio_play_jng("jng_invin");
        }
        break;
    
    case STATUS_SPEED:
        status_speed = argument1;
        
        switch (argument1)
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
        status_panic_alarm = argument1;
        break;
    
    case STATUS_SWAP:
        break;
}
