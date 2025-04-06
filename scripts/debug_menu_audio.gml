/// debug_menu_audio(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
        case MENU_INIT:
            debug_add_option(debug_option_audio_sfx);
            debug_add_option(debug_option_audio_bgm);
            break;
        
        case MENU_START:
            game_config_reset_audio();
            break;
        
        default:
            return false;
}

return true;