/// game_init_save()
/// @desc Initializes save data.
/// @returns {void}

save_directory = "data\saves\"
save_encryption = "";
save_index = -1;
save_count = 9;
save_map = ds_map_create();
character_list = ds_list_create();
sonic_map = ds_map_create();
game_reset_save();
