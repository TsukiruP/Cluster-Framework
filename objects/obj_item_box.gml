#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Item Box Initialization

event_inherited();
reaction_index = player_reaction_item_box;
player_handle = noone;
item_id = ITEM_BONUS;
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
        if (item_id == ITEM_FIRE || item_id == ITEM_BUBBLE) item_id = ITEM_BASIC;
        if (item_id == ITEM_LIGHTNING) item_id = ITEM_MAGNETIC;
        break;

    // Oops, all basic!:
    case 2:
        if (item_id >= ITEM_MAGNETIC && item_id <= ITEM_LIGHTNING) item_id = ITEM_BASIC;
        break;
}

// Debuffs:
if (!game_get_config("gameplay_debuffs"))
{
    if (item_id == ITEM_SLOW || item_id == ITEM_PANIC || item_id == ITEM_SWAP) item_id = ITEM_MINE;
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field item_id: enum(ITEM_BONUS, ITEM_SUPER_BONUS, ITEM_RANDOM_BONUS, ITEM_BASIC, ITEM_MAGNETIC, ITEM_BUBBLE, ITEM_FIRE, ITEM_LIGHTNING, ITEM_INVIN, ITEM_SPEED, ITEM_MINE, ITEM_SLOW, ITEM_PANIC, ITEM_SWAP)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Item Box

draw_sprite_ext(spr_item_icon, item_id, x, y, 1, 1, image_angle, c_white, 1);
draw_sprite_ext(spr_item_box, 1, x, y, 1, 1, image_angle, c_white, 1);
