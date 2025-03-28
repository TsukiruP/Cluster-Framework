#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Room Initialization

room_grid = ds_grid_create(9, 0);
game_room_add(rm_initialize);
game_room_add(rm_debug, TRANS_FADE, "bgm_debug", obj_sky_sanctuary_parallax, "Sky Sanctuary");
game_room_add(rm_basic_test_1, TRANS_CARD, "bgm_basic_test_1", obj_basic_test_parallax, "Basic Test", 1, 624, START_STANDBY);
game_room_add(rm_basic_test_2, TRANS_CARD, "bgm_basic_test_1", obj_basic_test_parallax, "Basic Test", 2, 864, START_STANDBY);
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Game Initialization

randomize();
game_time = 0;
game_debug_set(debug_mode);
game_set_speed(1);
game_checkpoint_set(true);
game_config_init();
game_save_init();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Controller Initialization

instance_create_single(0, 0, ctrl_debug);
instance_create_single(0, 0, ctrl_screen);
instance_create_single(0, 0, ctrl_audio);
instance_create_single(0, 0, ctrl_input);
instance_create_single(0, 0, ctrl_text);
instance_create_single(0, 0, ctrl_animation);
instance_create(0, 0, mnu_boot);
//transition_create(rm_debug);
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Indicator Initialization

indicator_draw = false;
indicator_time = 0;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Time

if (indicator_draw)
{
    indicator_time += 1;

    if (indicator_time >= 60)
    {
        indicator_draw = false;
        indicator_time = 0;
    }
}

if (game_ispaused(mnu_pause)) exit;

if (!instance_exists(ctrl_transition)) game_save_set("time", game_save_get("time") + 1);
game_time += game_speed;
game_time = roundto_step(game_time, game_speed);
#define Other_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Cleanup

ds_grid_destroy(room_grid);
ds_map_destroy(config_map);
ds_list_destroy(keyboard_list);

for ({var i; i = 0}; i < ds_list_size(gamepad_list); i += 1)
{
    ds_list_destroy(ds_map_get(ds_list_find_value(gamepad_list, i), "input_list"));
    ds_map_destroy(ds_list_find_value(gamepad_list, i));
}

ds_list_destroy(gamepad_list);
ds_map_destroy(save_map);
ds_list_destroy(character_list);
ds_map_destroy(sonic_map);
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Reset Time

game_speed = 1;
game_time = 0;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Indicator

if (!indicator_draw) exit;

// Stars:
draw_sprite(spr_save_stars, time_sync(indicator_time, 4, sprite_get_number(spr_save_stars)), view_xview[view_current] + screen_get_width() - 27, view_yview[view_current] + screen_get_height() - 16);

// Sonic:
d3d_fog_trick(c_white);
draw_sprite(spr_sonic_run_5, time_sync(indicator_time, 4, sprite_get_number(spr_sonic_run_5)), view_xview[view_current] + screen_get_width() - 27, view_yview[view_current] + screen_get_height() - 25);
d3d_set_fog(false, c_black, 0, 0);
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Debug

if (!game_debug_get()) exit;

var font_height; font_height = font_get_height(global.font_system);
var game_string; game_string = GAME_NAME + " " + string_format(GAME_VERSION, 1, 2);

draw_set2(fa_right, fa_bottom);
draw_text(view_xview[view_current] + screen_get_width() - font_height / 2, view_yview[view_current] + screen_get_height(), game_string + "#" + date_datetime_string(date_current_datetime()));
draw_reset();
