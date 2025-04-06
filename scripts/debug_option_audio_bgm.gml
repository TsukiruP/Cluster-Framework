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
        return string(game_config_get(config_key));

    case OPTION_CHANGE:
        if (in_range(game_config_get(config_key) + menu_x_direction, 0, 100))
        {
            if (_execute)
            {
                game_config_set(config_key, clamp(game_config_get(config_key) + menu_x_direction, 0, 100));
                sound_kind_volume(1, game_config_get(config_key) / 100);
                sound_kind_volume(3, game_config_get(config_key) / 100);
            }

            return true;
        }

        return false;

    default:
        return undefined;
}
