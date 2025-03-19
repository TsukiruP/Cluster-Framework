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
life_time = 0;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Time

if (game_ispaused(mnu_pause)) exit;

life_time += game_get_speed();
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

x = sine_wave_range(life_time, 128, xstart - 8 * image_xscale, xstart + 8 * image_xscale);
y -= 0.5 * game_get_speed();

if (!position_meeting(x, y, obj_water_mask)) instance_destroy();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Bubble

draw_self_floored();
