#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Stage Initialization

var i;

// Allow flags:
time_allow = false;
pause_allow = true;

// Stage variables:
stage_score = 0;
stage_time = 0;
stage_rings = 0;

for (i = 0; i < game_get_player_count(); i += 1)
{
    stage_player[i] = noone;
}

// HUD:
instance_create(0, 0, mgr_hud);
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Time

// Exit if the stage is paused:
if (game_ispaused() || time_allow == false)
{
    exit;
}

stage_time += game_get_speed();
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Pause

// Exit if there's no player 1:
if (!instance_exists(stage_get_player(0)))
{
    exit;
}

if (!game_ispaused(mgr_text) && pause_allow == true && !instance_exists(mnu_pause) && input_get_check(INP_START, CHECK_PRESSED))
{
    instance_create(0, 0, mnu_pause);
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Cull Instances

if (instance_exists(mgr_camera))
{
    // Deactivate objects:
    instance_deactivate_object(par_culled);

    // Activate region around view:
    instance_activate_region(view_xview[view_current] - 64, view_yview[view_current] - 64, view_wview[view_current] + 128, view_hview[view_current] + 128, true);

    // Activate region around players:
    with (obj_player)
    {
        if (!in_view())
        {
            instance_activate_region(x - 64, y - 64, 128, 128, true);
        }
    }
}
