/// game_get_interface_color()
/// @desc Returns a color based on interface config.
/// @returns {color}

return make_color_rgb(config_get("interface_red"), config_get("interface_green"), config_get("interface_blue"));
