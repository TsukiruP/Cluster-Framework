/// debug_set_menu(index)
/* Clears and then executes the new list. */

menu_index = argument0;
ds_list_clear(menu_list);
script_execute(menu_index);
