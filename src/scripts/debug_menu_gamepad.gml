/// debug_menu_gamepad(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
        case MENU_INIT:
            debug_add_option(debug_option_gamepad_player);
            debug_add_option(debug_option_gamepad_index);
            debug_add_option(debug_option_input_jump);
            debug_add_option(debug_option_input_aux);
            debug_add_option(debug_option_input_swap);
            debug_add_option(debug_option_input_super);
            debug_add_option(debug_option_input_tag);
            debug_add_option(debug_option_input_alt);
            debug_add_option(debug_option_gamepad_deadzone);
            debug_add_option(debug_option_gamepad_confirm);
            debug_add_option(debug_option_gamepad_style);
            return true;

        case MENU_START:
            if (_execute)
            {
                config_reset_gamepad(rebind_device - DEV_GAMEPAD0);
                return true;
            }
            else return "Reset";

        case MENU_FUNCTION:
            if (_execute)
            {
                config_write_gamepad();
                config_write();
                return true;
            }
            else return "Save";

        default:
            return undefined;
}
