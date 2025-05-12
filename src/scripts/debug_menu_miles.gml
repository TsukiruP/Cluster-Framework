/// debug_menu_miles(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
        case MENU_INIT:
            debug_add_option(debug_option_miles_ground);
            debug_add_option(debug_option_miles_insta);
            debug_add_option(debug_option_miles_shield);
            return true;

        default:
            return undefined;
}
