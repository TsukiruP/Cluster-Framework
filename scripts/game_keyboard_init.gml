/// game_keyboard_init()
// Initializes the keyboard list and writes it.

// Initialize:
keyboard_list = ds_list_create();
game_keyboard_default();

return ds_list_write(keyboard_list);
