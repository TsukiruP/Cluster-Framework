/// debug_option_player(index, [execute], [player])
/// @param {int} index
/// @param {bool} [execute]
/// @param {int} [player]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;
var _player; if (argument_count > 2) _player = argument[2]; else _player = 0;

switch (_index)
{
    case OPTION_TEXT:
        return "Player " + string(_player) + ":";

    case OPTION_VALUE:
        if (save_get_character(_player) < CHAR_SONIC) return "None";
        else return pick(save_get_character(_player), "Sonic", "Miles", "Knuckles", "Amy", "Classic");

    case OPTION_CHANGE:
        if (_execute)
        {
            var min_index; min_index = pick(_player == 0, -1, CHAR_SONIC);
            var char_index; char_index = save_get_character(_player) + menu_x_direction;

            while (char_index == CHAR_KNUX || char_index == CHAR_AMY) char_index += menu_x_direction;
            char_index = wrap(char_index, min_index, CHAR_CLASSIC);

            save_set_character(_player, char_index);
        }

        return true;

    case OPTION_SELECT:
        if (_execute)
        {
            switch (save_get_character(_player))
            {
                case -1:
                    text_set_body("No character will spawn for this player.");
                    break;

                case CHAR_SONIC:
                    text_set_body("The fastest thing alive, Sonic the Hedgehog. Provides the most customization out of any character.",
                    "You can also enable the Super Peel Out and Homing Attack to your liking.",
                    "His Tag Action is Sonic Accelerator, propelling the leader at max speed and putting them into Boost Mode.");
                    break;

                case CHAR_MILES:
                    text_set_body("The twin-tailed genius, Miles ''Tails'' Prower. Provides some customization, including access to the Insta-Shield.",
                    "When flying, hold " + string_input(INP_DOWN) + " and press " + string_input(INP_JUMP) + " to drop down. Press " + string_input(INP_JUMP) + " afterwards to resume flying.",
                    "If he is controlled by the CPU player, the leader can get them to fly by holding " + string_input(INP_UP) + " and pressing " + string_input(INP_JUMP) + ".",
                    "His ground Tag Action is Leap Jump, launching the leader diagonally upwards.",
                    "His aerial Tag Action is propeller catch, automatically putting himself into flight and carrying the leader.",
                    "Propeller Catch can also be triggered by making contact with Miles while he's flying or swimming.");
                    break;

                case CHAR_CLASSIC:
                    text_set_body("The blast from the past, Classic Sonic. Provides NO customization, instead having his Jump and Aux Skills fixed to the Drop Dash and Insta-Shield respectively.",
                    "Press Super for a surprise from the Heavenly Path.",
                    "Shares Sonic Accelerator with Sonic, but cannot perform Trick Actions or Tag Actions.");
                    break;

                default:
                    text_set_body("This character has no text set.");
            }
        }

        return true;

    case OPTION_CONFIRM:
        switch (save_get_character(_player))
        {
            case CHAR_SONIC:
                if (_execute) debug_set_next(debug_menu_sonic);
                return true;

            case CHAR_MILES:
                if (_execute) debug_set_next(debug_menu_miles);
                return true;

            default:
                return false;
        }
        break;

    default:
        return undefined;
}
