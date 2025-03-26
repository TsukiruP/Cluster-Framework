/// debug_option_audio_bgm(return, [execute])
/// @param {int} return
/// @param {bool} [execute]
/// @returns {any}

var _return; _return = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var config_key; config_key = "audio_bgm";

switch (_return)
{
    // Text:
    case 0:
        return "BGM Volume:";

    // Value:
    case 1:
        return string(game_get_config(config_key));

    // Update:
    case 3:
        if (in_range(game_get_config(config_key) + menu_x_direction, 0, 100))
        {
            if (_execute)
            {
                game_set_config(config_key, clamp(game_get_config(config_key) + menu_x_direction, 0, 100));
                sound_kind_volume(1, game_get_config(config_key) / 100);
                sound_kind_volume(3, game_get_config(config_key) / 100);
            }
            
            return true;
        }

        return false;

    // Undefined:
    default:
        return undefined;
}