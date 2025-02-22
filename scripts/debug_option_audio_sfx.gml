/// debug_option_audio_sfx(return)
/// @param {any} return
/// @returns {any}

var _return; _return = argument0;

var config_key; config_key = "audio_sfx";

switch (_return)
{
    // Text:
    case 0:
        return "SFX Volume:";

    // Value:
    case 1:
        return string(game_get_config(config_key));

    // Update:
    case 3:
        if (in_range(game_get_config(config_key) + menu_x_direction, 0, 100))
        {
            game_set_config(config_key, clamp(game_get_config(config_key) + menu_x_direction, 0, 100));
            sound_kind_volume(0, game_get_config(config_key) / 100);
            return true;
        }

        return false;

    // Undefined:
    default:
        return undefined;
}