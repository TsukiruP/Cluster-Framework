/// game_get_interface_color()
/// @desc Returns a color based on interface config.
/// @returns {color}

return make_color_rgb(game_get_config("interface_red"), game_get_config("interface_green"), game_get_config("interface_blue"));
