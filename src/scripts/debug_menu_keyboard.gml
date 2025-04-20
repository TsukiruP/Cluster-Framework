/// debug_menu_keyboard(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
        case MENU_INIT:
            debug_add_option(debug_option_input_up);
            debug_add_option(debug_option_input_down);
            debug_add_option(debug_option_input_left);
            debug_add_option(debug_option_input_right);
            debug_add_option(debug_option_input_jump);
            debug_add_option(debug_option_input_aux);
            debug_add_option(debug_option_input_swap);
            debug_add_option(debug_option_input_super);
            debug_add_option(debug_option_input_tag);
            debug_add_option(debug_option_input_alt);
            debug_add_option(debug_option_input_start);
            debug_add_option(debug_option_input_select);
            debug_add_option(debug_option_input_confirm);
            debug_add_option(debug_option_input_cancel);
            debug_add_option(debug_option_input_log);
            debug_add_option(debug_option_input_hide);
            return true;
        
        case MENU_START:
            if (_execute)
            {
                game_config_reset_key();
                return true;
            }
            else return "Reset";
        
        case MENU_FUNCTION:
            if (_execute)
            {
                game_config_write_key();
                game_config_write();
                return true;
            }
            else return "Save";
        
        default:
            return undefined;
}
