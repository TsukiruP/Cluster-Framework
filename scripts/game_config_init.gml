/// game_config_init()
// Initializes config.

var i;

// Input lists:
keyboard_list = ds_list_create();

for (i = 0; i < game_get_player_count(); i += 1)
{
    gamepad_list[i] = ds_list_create();
}

// Initialize:
config_directory = "data\saves\"
config_map = ds_map_create();
game_config_default();
