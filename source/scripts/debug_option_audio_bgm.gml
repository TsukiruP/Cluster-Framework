/// debug_option_audio_bgm(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var config_key; config_key = "audio_bgm";

switch (_index)
{
    case OPTION_TEXT:
        return "BGM Volume:";

    case OPTION_VALUE:
        return string(config_get(config_key));
    
    case OPTION_SELECT:
        if (_execute) text_set_body("Sets the volume of background music and jingles.");
        return true;

    case OPTION_CHANGE:
        if (in_range(config_get(config_key) + menu_x_direction, 0, 100))
        {
            if (_execute)
            {
                config_set(config_key, clamp(config_get(config_key) + menu_x_direction, 0, 100));
                audio_reset_volume();
            }

            return true;
        }

        return false;

    default:
        return undefined;
}