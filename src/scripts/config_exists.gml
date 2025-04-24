/// config_exists()
/// @desc Returns whether a config file exists.

with (ctrl_config) return file_exists(config_directory + "config.cfg");
