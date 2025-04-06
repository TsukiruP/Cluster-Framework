/// debug_menu_top(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
        case MENU_INIT:
            debug_add_option(debug_option_character);
            debug_add_option(debug_option_transition);
            debug_add_option(debug_option_data);
            debug_add_option(debug_option_text);
            debug_add_option(debug_option_config);
            debug_add_option(debug_option_credits);
            debug_add_option(debug_option_exit);
            break;
        
        default:
            return false;
}

return true;