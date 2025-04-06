/// debug_menu_character(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
        case MENU_INIT:
            debug_add_option(debug_option_player0);
            debug_add_option(debug_option_player1);
            debug_add_option(debug_option_swap);
            debug_add_option(debug_option_tag);
            debug_add_option(debug_option_boost);
            break;
        
        default:
            return false;
}

return true;