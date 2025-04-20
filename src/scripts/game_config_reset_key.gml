/// game_config_reset_key()
/// @desc Resets the keyboard list.
/// @returns {void}

with (ctrl_game)
{
    ds_list_clear(keyboard_list);
    ds_list_add(keyboard_list, vk_up);
    ds_list_add(keyboard_list, vk_down);
    ds_list_add(keyboard_list, vk_left);
    ds_list_add(keyboard_list, vk_right);
    ds_list_add(keyboard_list, ord("A")); // Jump
    ds_list_add(keyboard_list, ord("S")); // Aux
    ds_list_add(keyboard_list, ord("W")); // Swap
    ds_list_add(keyboard_list, ord("Q")); // Super
    ds_list_add(keyboard_list, ord("D")); // Tag
    ds_list_add(keyboard_list, vk_shift); // Alt
    ds_list_add(keyboard_list, vk_enter); // Start
    ds_list_add(keyboard_list, vk_space); // Select
    ds_list_add(keyboard_list, ord("A")); // Confirm
    ds_list_add(keyboard_list, ord("S")); // Cancel
    ds_list_add(keyboard_list, vk_backspace); // Function
    ds_list_add(keyboard_list, ord("W")); // Hide
}
