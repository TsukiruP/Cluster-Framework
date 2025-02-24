#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Stage Initialization

time_allow = false;
pause_allow = true;

stage_score = 0;
stage_time = 0;
stage_rings = 0;

player_list = ds_list_create();

instance_create(0, 0, ctrl_hud);
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Time

if (game_ispaused() || !time_allow) exit;

stage_time += game_get_speed();
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Pause

if (!instance_exists(stage_get_player(0))) exit;

if (!game_ispaused(ctrl_text) && pause_allow && !instance_exists(mnu_pause) && input_get_check(INP_START, CHECK_PRESSED)) instance_create(0, 0, mnu_pause);
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Cull Instances

if (instance_exists(ctrl_camera))
{
    instance_deactivate_object(par_culled);
    instance_activate_region(view_xview[view_current] - 64, view_yview[view_current] - 64, view_wview[view_current] + 128, view_hview[view_current] + 128, true);

    with (obj_player)
    {
        if (!in_view()) instance_activate_region(x - 64, y - 64, 128, 128, true);
    }
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Cleanup

ds_list_destroy(player_list);
