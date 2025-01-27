#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Bubble Initialization

event_inherited();
depth = -10;
image_speed = 0;
reaction_index = player_reaction_bubble;
size = 0;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

switch (size)
{
    case 1:
        image_index = time_sync(game_get_time(), 12, 3) + 1;
        break;

    case 2:
        image_index = time_sync(game_get_time(), 16, 3) + 4;
        break;

    default:
        image_index = 0;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement

if (game_ispaused(mnu_pause)) exit;

y -= 0.5;

if (collision_point(x, y, obj_water_mask, false, false) == noone) instance_destroy();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Bubble

draw_self_floored();
