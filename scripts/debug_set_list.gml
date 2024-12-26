/// debug_set_list(index)
// Clears and then executes the new list.

// Menu index:
menu_index = argument0;

// Menu list:
ds_list_clear(menu_list);
script_execute(menu_index);
