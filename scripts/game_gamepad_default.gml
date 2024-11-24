/// game_gamepad_default(i)
// Sets a gamepad list to default buttons.

// Clear list:
if (!ds_list_empty(gamepad_list[argument0]))
{
    ds_list_clear(gamepad_list[argument0])
}

// Direction buttons:
ds_list_add(gamepad_list[argument0], PAD_UP);
ds_list_add(gamepad_list[argument0], PAD_DOWN);
ds_list_add(gamepad_list[argument0], PAD_LEFT);
ds_list_add(gamepad_list[argument0], PAD_RIGHT);

// Gameplay buttons:
ds_list_add(gamepad_list[argument0], PAD_FACE1); // Jump
ds_list_add(gamepad_list[argument0], PAD_FACE3); // Aux
ds_list_add(gamepad_list[argument0], PAD_FACE4); // Swap
ds_list_add(gamepad_list[argument0], PAD_FACE2); // Super
ds_list_add(gamepad_list[argument0], PAD_BUMPERR); // Tag
ds_list_add(gamepad_list[argument0], PAD_BUMPERL); // Alt

// Menu buttons:
ds_list_add(gamepad_list[argument0], PAD_START); // Start
ds_list_add(gamepad_list[argument0], PAD_SELECT); // Select
ds_list_add(gamepad_list[argument0], PAD_FACE1); // Confirm
ds_list_add(gamepad_list[argument0], PAD_FACE2); // Cancel
ds_list_add(gamepad_list[argument0], PAD_FACE4); // Help
