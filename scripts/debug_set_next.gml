/// debug_set_next(menu)
/// @desc Sets the menu list and pushes the previous one to the history stack.
/// @param {script} menu
/// @returns {void}

var _menu; _menu = argument0;

var history_list; history_list = ds_list_create();

ds_list_add_many(history_list, menu_index, menu_cursor, menu_option, menu_scroll);
ds_stack_push(history_stack, history_list);
debug_set_menu(_menu);
menu_cursor = 0;
menu_option = 0;
menu_scroll = 0;