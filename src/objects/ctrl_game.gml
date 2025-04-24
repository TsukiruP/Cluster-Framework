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
game_set_debug(debug_mode);
game_set_time(0);
game_set_speed(1);
game_checkpoint_set(true);
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Controller Initialization

instance_create_single(0, 0, ctrl_config);
instance_create_single(0, 0, ctrl_save);
instance_create_single(0, 0, ctrl_screen);
instance_create_single(0, 0, ctrl_audio);
instance_create_single(0, 0, ctrl_input);
instance_create_single(0, 0, ctrl_text);
instance_create_single(0, 0, ctrl_animation);
instance_create_single(0, 0, ctrl_debug);
instance_create(0, 0, mnu_boot);
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Time

if (game_ispaused(mnu_pause)) exit;

game_set_time(roundto_step(game_time + game_speed, game_speed));
#define Other_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Cleanup

ds_grid_destroy(room_grid);
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Reset Time

game_set_time(0);
game_set_speed(1);
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Debug

if (!game_get_debug()) exit;

var font_height; font_height = font_get_height(global.font_system);
var game_string; game_string = GAME_NAME + " " + string_format(GAME_VERSION, 1, 2);

draw_set2(fa_right, fa_bottom);
draw_text(view_xview[view_current] + screen_get_width() - font_height / 2, view_yview[view_current] + screen_get_height(), game_string + "#" + date_datetime_string(date_current_datetime()));
draw_reset();
