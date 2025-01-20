#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Room Initialization

room_grid = ds_grid_create(9, 0);
game_room_add(rm_debug, TRANS_FADE, "bgm_debug", obj_sky_sanctuary_parallax, "Sky Sanctuary");
game_room_add(rm_basic_test_1, TRANS_CARD, "bgm_basic_test_1", -1, "Basic Test", 1, 864, START_STANDBY);
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Game Initialization

var i;

randomize();

game_debug = debug_mode;
game_speed = 1;
game_time = 0;

checkpoint_x = -1;
checkpoint_y = -1;
checkpoint_time = -1;

game_init_config();
game_init_save();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Controller Initialization

instance_create_single(0, 0, ctrl_screen);
instance_create_single(0, 0, ctrl_audio);
instance_create_single(0, 0, ctrl_input);
instance_create_single(0, 0, ctrl_text);
instance_create_single(0, 0, ctrl_animation);
transition_create(rm_debug);
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

if (!instance_exists(ctrl_transition)) game_set_save("time", game_get_save("time") + 1);
game_time += game_speed;
#define Other_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Cleanup

var i;

ds_list_destroy(game_get_config("input_keyboard"));

for (i = 0; i < PLAYER_COUNT; i += 1)
{
    ds_list_destroy(game_get_config("input_gamepad" + string(i)));
}

ds_map_destroy(config_map);
ds_map_destroy(save_map);
ds_grid_destroy(room_grid);
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Reset Time

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
draw_sprite(spr_sonic_run_4, time_sync(indicator_time, 4, sprite_get_number(spr_sonic_run_4)), view_xview[view_current] + screen_get_width() - 27, view_yview[view_current] + screen_get_height() - 25);
d3d_set_fog(false, c_black, 0, 0);
