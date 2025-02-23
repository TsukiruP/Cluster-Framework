/// debug_set_menu(menu)
/// @desc Sets the menu list.
/// @param {script} menu
/// @returns {void}

var _menu; _menu = argument0;

menu_index = _menu;
ds_list_clear(menu_list);
script_execute(menu_index);