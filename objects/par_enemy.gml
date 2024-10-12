#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Enemy Initialization

event_inherited();

// Element:
hitbox_element = ELEM_NONE;

// Reaction:
reaction_index = player_reaction_enemy;

// Enemy variables:
class = ENE_BASIC;
vitality = 3;
invin_alarm = 0;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Invincibility

if (invin_alarm > 0)
{
    invin_alarm -= 1;
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Enemy

// Enemy:
draw_self_floored();

// Health:
if (class == ENE_SUPER && vitality > 0 && vitality < 3 && invin_alarm > 0)
{
    draw_sprite(spr_enemy_vitality, vitality - 1, floor(x), floor(y) - 40);
}

// Collision:
event_inherited();
