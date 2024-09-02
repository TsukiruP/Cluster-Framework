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
if (enemy_class == ENE_SUPER && enemy_health > 0 && enemy_health < 3 && enemy_invin > 0) {
    draw_sprite(spr_enemy_health, enemy_health - 1, floor(x), floor(y) - 40);
}

// Collision:
event_inherited();
