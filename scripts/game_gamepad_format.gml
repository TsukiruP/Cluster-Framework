/// game_gamepad_format(id)
// Sets a gamepad list to default buttons.

var gamepad_list;

// Gamepad list:
if (is_undefined(game_get_config("input_gamepad" + string(argument0))))
{
    game_set_config("input_gamepad" + string(argument0), ds_list_create());
}

gamepad_list = game_get_config("input_gamepad" + string(argument0));

// Clear list:
ds_list_clear(gamepad_list);

// Direction buttons:
ds_list_add(gamepad_list, PAD_UP);
ds_list_add(gamepad_list, PAD_DOWN);
ds_list_add(gamepad_list, PAD_LEFT);
ds_list_add(gamepad_list, PAD_RIGHT);

// Gameplay buttons:
ds_list_add(gamepad_list, PAD_FACE1); // Jump
ds_list_add(gamepad_list, PAD_FACE3); // Aux
ds_list_add(gamepad_list, PAD_FACE4); // Swap
ds_list_add(gamepad_list, PAD_FACE2); // Super
ds_list_add(gamepad_list, PAD_BUMPERR); // Tag
ds_list_add(gamepad_list, PAD_BUMPERL); // Alt

// Menu buttons:
ds_list_add(gamepad_list, PAD_START); // Start
ds_list_add(gamepad_list, PAD_SELECT); // Select
ds_list_add(gamepad_list, PAD_FACE1); // Confirm
ds_list_add(gamepad_list, PAD_FACE2); // Cancel
ds_list_add(gamepad_list, PAD_FACE3); // Log
ds_list_add(gamepad_list, PAD_FACE4); // Hide
