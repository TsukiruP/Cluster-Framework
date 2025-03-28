/// debug_option_audio_bgm(index, [event])
/// @param {int} index
/// @param {bool} [event]
/// @returns {any}

var _index; _index = argument[0];
var _event; if (argument_count > 1) _event = argument[1]; else _event = true;

var config_key; config_key = "audio_bgm";

switch (_index)
{
    // Text:
    case 0:
        return "BGM Volume:";

    // Value:
    case 1:
        return string(game_config_get(config_key));

    // Change:
    case 3:
        if (in_range(game_config_get(config_key) + menu_x_direction, 0, 100))
        {
            if (_event)
            {
                game_config_set(config_key, clamp(game_config_get(config_key) + menu_x_direction, 0, 100));
                sound_kind_volume(1, game_config_get(config_key) / 100);
                sound_kind_volume(3, game_config_get(config_key) / 100);
            }

            return true;
        }

        return false;

    // Undefined:
    default:
        return undefined;
}
