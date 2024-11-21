/// game_keyboard_default()
// Sets keyboard inputs to default keys.

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
ds_list_add(keyboard_list, ord("A"));
ds_list_add(keyboard_list, ord("S"));
ds_list_add(keyboard_list, ord("W"));
ds_list_add(keyboard_list, ord("Q"));
ds_list_add(keyboard_list, ord("D"));
ds_list_add(keyboard_list, ord("E"));

// Menu keys:
ds_list_add(keyboard_list, vk_enter);
ds_list_add(keyboard_list, vk_shift);
ds_list_add(keyboard_list, ord("A"));
ds_list_add(keyboard_list, ord("S"));
ds_list_add(keyboard_list, ord("W"));
