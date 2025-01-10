#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Waterfall Initialization

event_inherited();

depth = -10;

hurtbox_set(16, 16, 16, 16);
reaction_index = player_reaction_waterfall;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

image_index = sync_rate(game_get_time(), 6, sprite_get_number(sprite_index));
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Waterfall

draw_self();

if (game_get_room_water() == y + 16)
{
    draw_sprite(spr_splash_6, sync_rate(game_get_time(), 2, sprite_get_number(spr_splash_6)), x, y + 16);
}

event_inherited();
