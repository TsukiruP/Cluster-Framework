/// debug_option_screen_mode(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var config_key; config_key = "screen_mode";

switch (_index)
{
    case OPTION_TEXT:
        return "Mode:";

    case OPTION_VALUE:
        return pick(config_get(config_key), "Default", "3DS", "Misc.");
    
    case OPTION_SELECT:
        if (_execute)
        {
            switch (config_get(config_key))
            {
                case 0:
                    text_set_body("Screen resolution is based around the default, 480x270.");
                    break;
                
                case 1:
                    text_set_body("Screen resolution is based around the 3DS.");
                    break;
                
                default:
                    text_set_body("Screen resolution isn't based on anything specific.");
                    break;
            }
        }
        
        return true;

    case OPTION_CHANGE:
        if (_execute)
        {
            config_set(config_key, wrap(config_get(config_key) + menu_x_direction, 0, 2));
            config_set("screen_ratio", 0);
        }

        return true;

    default:
        return undefined;
}