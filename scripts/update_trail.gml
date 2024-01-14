/// update_trail(x, y, al)

ds_list_add(trail_x, argument0);
ds_list_add(trail_y, argument1);
ds_list_add(trail_al, argument2);

if (ds_list_size(trail_x) > trail_length) {
    ds_list_delete(trail_x, 0);
    ds_list_delete(trail_y, 0);
    ds_list_delete(trail_al, 0);
}
