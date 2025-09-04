/// debug_option_gameplay_shields(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

var config_key; config_key = "gameplay_shields";

switch (_index)
{
    case OPTION_TEXT:
        return "Shields:";

    case OPTION_VALUE:
        return pick(config_get(config_key), "All", "Basic/Magnetic", "Basic");
    
    case OPTION_SELECT:
        if (_execute)
        {
            switch (config_get(config_key))
            {
                case 0:
                    text_set_body("Allows all Shields to appear during gameplay.");
                    break;
                
                case 1:
                    text_set_body("Replaces all Lightning Shields with Magnetic Shields, and all other Sheilds with Basic Shields.");
                    break;
                
                case 2:
                    text_set_body("Replaces all Shields with Basic Shields.");
                    break;
            }
        }
        
        return true;

    case OPTION_CHANGE:
        if (_execute) config_set(config_key, wrap(config_get(config_key) + menu_x_direction, 0, 2));
        return true;

    default:
        return undefined;
}