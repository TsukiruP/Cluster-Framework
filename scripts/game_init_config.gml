/// game_init_config()
// Initializes config.

// Initialize:
config_directory = "data\saves\"
config_map = ds_map_create();
game_reset_config();
game_read_config();
