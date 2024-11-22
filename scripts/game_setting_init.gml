/// game_setting_init()
// Initializes settings.

var i;

// Input lists:
keyboard_list = ds_list_create();

for (i = 0; i < global.player_count; i += 1)
{
    gamepad_list[i] = ds_list_create();
}

// Initialize:
setting_directory = "data\saves\"
setting_map = ds_map_create();
game_setting_default();
