/// game_keyboard_default()
// Sets keyboard list to default keys.

// Clear list:
if (!ds_list_empty(keyboard_list))
{
    ds_list_clear(keyboard_list);
}

// Direction keys:
ds_list_add(keyboard_list, vk_up);
ds_list_add(keyboard_list, vk_down);
ds_list_add(keyboard_list, vk_left);
ds_list_add(keyboard_list, vk_right);

// Gameplay keys:
ds_list_add(keyboard_list, ord("A")); // Jump
ds_list_add(keyboard_list, ord("S")); // Aux
ds_list_add(keyboard_list, ord("W")); // Swap
ds_list_add(keyboard_list, ord("Q")); // Super
ds_list_add(keyboard_list, ord("D")); // Tag
ds_list_add(keyboard_list, vk_shift); // Alt

// Menu keys:
ds_list_add(keyboard_list, vk_enter); // Start
ds_list_add(keyboard_list, 220); // Select
ds_list_add(keyboard_list, ord("A")); // Confirm
ds_list_add(keyboard_list, ord("S")); // Cancel
ds_list_add(keyboard_list, vk_backspace); // Log
ds_list_add(keyboard_list, ord("W")); // Hide
