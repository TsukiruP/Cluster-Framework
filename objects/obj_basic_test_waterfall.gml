#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Waterfall Initialization

event_inherited();
depth = -10;
reaction_index = player_reaction_waterfall;
splash = false;
hurtbox_set(16, 16, 16, 16);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

image_index = time_sync(game_get_time(), 6, sprite_get_number(sprite_index));
splash = (collision_point(x, bbox_bottom + 1, obj_water_mask, false, false) != noone)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Waterfall

draw_self();
if (splash) draw_sprite(spr_splash_6, time_sync(game_get_time(), 2, sprite_get_number(spr_splash_6)), x, y + 16);
event_inherited();
