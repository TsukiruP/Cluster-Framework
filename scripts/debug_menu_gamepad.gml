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
            debug_add_option(debug_option_gamepad_focus);
            debug_add_option(debug_option_input_reset);
            break;
        
        default:
            return false;
}

return true;