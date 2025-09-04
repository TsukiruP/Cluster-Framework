/// debug_option_screen_ratio(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var config_key; config_key = "screen_ratio";

switch (_index)
{
    case OPTION_TEXT:
        return "Ratio:";

    case OPTION_VALUE:
        switch (config_get("screen_mode"))
        {
            // Misc:
            case 2:
                return "7:4";

            // Default:
            default:
                return pick(config_get(config_key), "16:9", "4:3", "5:3");
        }
    
    case OPTION_SELECT:
        if (_execute) text_set_body("Sets the screen ratio. Screen modes may differ in what ratios they provide.");
        return true;

    case OPTION_CHANGE:
        if (_execute)
        {
            var ratio_max; ratio_max = pick(config_get("screen_mode"), 1, 2, 0);

            config_set(config_key, wrap(config_get(config_key) + menu_x_direction, 0, ratio_max));
        }

        return true;

    default:
        return undefined;
}