#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Item Box Initialization

event_inherited();
hurtbox_set(13, 16, 12, 16);
reaction_index = player_reaction_item_box;
player_handle = noone;
item_id = ITEM_BONUS;
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

//field item_id: enum(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13)

/*preview
    var item_id, item_icon, item_box;

    item_id = Field("item_id", 0);
    item_icon = Sprite("spr_item_icon", item_id);
    item_box = Sprite("spr_item_box", 1);

    draw_sprite(item_icon, 0, x, y);
    draw_sprite(item_box, 0, x, y);
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Item Box

draw_sprite_ext(spr_item_icon, item_id, x, y, 1, 1, image_angle, c_white, 1);
draw_sprite_ext(spr_item_box, 1, x, y, 1, 1, image_angle, c_white, 1);
event_inherited();
