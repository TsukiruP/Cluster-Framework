/// debug_set_next(index)
/* Sets the menu list and adds to the history stack. */

var history_list;

history_list = ds_list_create();
ds_list_add_many(history_list, menu_index, menu_cursor, menu_option, menu_scroll);
ds_stack_push(history_stack, history_list);

debug_set_menu(argument0);
menu_cursor = 0;
menu_option = 0;
menu_scroll = 0;
