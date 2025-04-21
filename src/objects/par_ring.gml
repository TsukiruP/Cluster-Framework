#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Ring Initialization

event_inherited();
reaction_index = player_reaction_ring;
super = false;
rate = 8;
dropped = false;
hitbox_set_hurtbox(8, 8, 7, 7, 0, 0);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Super Ring

if (super)
{
    sprite_index = spr_ring_super;
    rate = 6;
}
else
{
    sprite_index = spr_ring;
    rate = 8;
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

image_index = time_sync(game_get_time(), rate / (1 + (dropped)), sprite_get_number(sprite_index));
