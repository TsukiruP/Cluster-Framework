/// debug_menu_gameplay(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
        case MENU_INIT:
            debug_add_option(debug_option_gameplay_shields);
            debug_add_option(debug_option_gameplay_debuffs);
            debug_add_option(debug_option_gameplay_bonuses);
            break;
        
        default:
            return false;
}

return true;