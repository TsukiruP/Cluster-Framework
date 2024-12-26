/// debug_set_previous()
// Pops from the history stack to read from it.

if (!ds_stack_empty(history_stack))
{
    var history_list;

    history_list = ds_stack_pop(history_stack);

    menu_index = ds_list_find_value(history_list, 0);
    menu_cursor = ds_list_find_value(history_list, 1);
    menu_option = ds_list_find_value(history_list, 2);
    menu_scroll = ds_list_find_value(history_list, 3);

    // Set list:
    debug_set_list(menu_index);

    // Destroy list:
    ds_list_destroy(history_list);
}
