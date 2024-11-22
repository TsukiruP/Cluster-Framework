/// game_gamepad_default(i)
// Sets the gamepad to default buttons.

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
ds_list_add(gamepad_list[argument0], PAD_FACE1);
ds_list_add(gamepad_list[argument0], PAD_FACE3);
ds_list_add(gamepad_list[argument0], PAD_FACE4);
ds_list_add(gamepad_list[argument0], PAD_FACE2);
ds_list_add(gamepad_list[argument0], PAD_BUMPERR);
ds_list_add(gamepad_list[argument0], PAD_BUMPERL);

// Menu buttons:
ds_list_add(gamepad_list[argument0], PAD_START);
ds_list_add(gamepad_list[argument0], PAD_SELECT);
ds_list_add(gamepad_list[argument0], PAD_FACE1);
ds_list_add(gamepad_list[argument0], PAD_FACE2);
ds_list_add(gamepad_list[argument0], PAD_FACE4);
