#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Debuff Initialization

event_inherited();

// Depth:
depth = -11;

// Set index:
timeline_set(ctl_splash_5);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

event_inherited();

// Exit if the stage is paused:
if (game_ispaused(mnu_pause))
{
    exit;
}

// Destroy:
if (player_handle.waterfall_draw != true)
{
    instance_destroy();
}

// Reset:
player_handle.waterfall_draw = false;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Debuff

var player_rotation, sine, csine, draw_x, draw_y;

// Rotation:
player_rotation = player_handle.mask_rotation;
sine = dsin(player_handle.mask_rotation);
csine = dcos(player_handle.mask_rotation);

draw_x = x - sine * 16;
draw_y = y - csine * 16;

if (sprite_exists(sprite_index))
{
    draw_sprite_ext(sprite_index, image_index, draw_x, draw_y, 1, 1, player_rotation, c_white, 1);
}
