/// debug_menu_advance(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
        case MENU_INIT:
            debug_add_option(debug_option_advance_turn);
            debug_add_option(debug_option_advance_brake);
            debug_add_option(debug_option_advance_hurt);
            debug_add_option(debug_option_advance_flicker);
            return true;

        case MENU_START:
            if (_execute)
            {
                config_reset_advance();
                return true;
            }
            else return "Reset";

        case MENU_FUNCTION:
            if (_execute)
            {
                config_write();
                return true;
            }
            else return "Save";

        default:
            return undefined;
}