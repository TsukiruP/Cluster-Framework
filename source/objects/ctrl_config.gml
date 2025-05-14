#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Config Initialization

config_directory = "data\saves\"
config_map = ds_map_create();
keyboard_list = ds_list_create();
gamepad_list = ds_list_create();
config_init_gamepad();
config_reset();
config_read();
#define Other_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Cleanup

ds_map_destroy(config_map);
ds_list_destroy(keyboard_list);

for ({var i; i = 0}; i < ds_list_size(gamepad_list); i += 1)
{
    ds_list_destroy(ds_map_get(ds_list_find_value(gamepad_list, i), "input_list"));
    ds_map_destroy(ds_list_find_value(gamepad_list, i));
}

ds_list_destroy(gamepad_list);
