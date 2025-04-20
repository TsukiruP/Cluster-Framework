/// game_get_interface_color()
/// @desc Returns a color based on interface config.
/// @returns {color}

return make_color_rgb(game_config_get("interface_red"), game_config_get("interface_green"), game_config_get("interface_blue"));
