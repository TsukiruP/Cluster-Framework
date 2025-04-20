/// debug_menu_input(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
        case MENU_INIT:
            debug_add_option(debug_option_keyboard);
            debug_add_option(debug_option_gamepad);
            debug_add_option(debug_option_input_background);
            return true;

        case MENU_START:
            if (_execute)
            {
                game_config_reset_input_background();
                return true;
            }
            else return "Reset";
        
        case MENU_FUNCTION:
            if (_execute)
            {
                game_config_write();
                return true;
            }
            else return "Save";

        default:
            return undefined;
}
