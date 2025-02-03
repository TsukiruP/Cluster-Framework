#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Item Box Initialization

event_inherited();
reaction_index = player_reaction_item_box;
item_index = ITEM_BONUS;
hitbox_set_hurtbox(13, 16, 12, 16);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Replace

// Shields:
switch (game_get_config("gameplay_shields"))
{
    // Adventure/Advance:
    case 1:
        if (item_index == ITEM_FIRE || item_index == ITEM_BUBBLE) item_index = ITEM_BASIC;
        if (item_index == ITEM_LIGHTNING) item_index = ITEM_MAGNETIC;
        break;

    // Oops, all basic!:
    case 2:
        if (item_index >= ITEM_MAGNETIC && item_index <= ITEM_LIGHTNING) item_index = ITEM_BASIC;
        break;
}

// Debuffs:
if (!game_get_config("gameplay_debuffs"))
{
    if (item_index == ITEM_SLOW || item_index == ITEM_PANIC || item_index == ITEM_SWAP) item_index = ITEM_MINE;
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field item_index: enum(ITEM_BONUS, ITEM_SUPER_BONUS, ITEM_RANDOM_BONUS, ITEM_BASIC, ITEM_MAGNETIC, ITEM_BUBBLE, ITEM_FIRE, ITEM_LIGHTNING, ITEM_INVIN, ITEM_SPEED, ITEM_MINE, ITEM_SLOW, ITEM_PANIC, ITEM_SWAP)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Item Box

draw_sprite_ext(spr_item_icon, item_index, x, y, 1, 1, image_angle, c_white, 1);
draw_sprite_ext(spr_item_box, 1, x, y, 1, 1, image_angle, c_white, 1);
