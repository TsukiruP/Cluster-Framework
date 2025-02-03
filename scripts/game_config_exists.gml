/// game_config_exists()
/* Returns whether the config file exists. */

with (ctrl_game) return file_exists(config_directory + "config.cfg");
