/// debug_set_next(list)
// Sets the menu list and adds to the history stack.

var history_list;

// History list:
history_list = ds_list_create();

ds_list_add(history_list, menu_index);
ds_list_add(history_list, menu_cursor);
ds_list_add(history_list, menu_option);
ds_list_add(history_list, menu_scroll);

// History stack:
ds_stack_push(history_stack, history_list);

// Set list:
debug_set_list(argument0);
