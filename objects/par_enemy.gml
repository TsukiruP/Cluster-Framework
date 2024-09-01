#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Enemy Initialization

event_inherited();

// Reaction:
reaction_index = player_reaction_enemy;

// Enemy variables:
enemy_class  = ENE_BASIC;
enemy_health = 3;
enemy_invin  = 0;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Invincibility

if (enemy_invin > 0) {
    enemy_invin -= 1;
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
/*
if (badnik_super == true && badnik_health > 0 && badnik_health < 3 && badnik_invin > 0) {
    draw_sprite(spr_badnik_health, badnik_health - 1, floor(x), floor(y) - 40);
}
*/

// Collision:
event_inherited();
