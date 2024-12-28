#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Reticle Initialization

event_inherited();

// Set index:
timeline_set(ctl_reticle);

if (game_config_get("misc_reticle") == 2)
{
    timeline_set(ctl_reticle_colors);
}

// Homing handle:
homing_handle = noone;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

event_inherited();

// Homing handle:
homing_handle = player_handle.homing_handle;

if (!instance_exists(homing_handle))
{
    instance_destroy();
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Reticle

var draw_x, draw_y;

draw_x = floor(homing_handle.x);
draw_y = floor(homing_handle.y);

if (sprite_exists(sprite_index))
{
    draw_sprite(sprite_index, image_index, draw_x, draw_y);
}
