#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Item Box Initialization

event_inherited();

// Image speed:
image_speed = 0;

// Hurtbox:
set_hurtbox(13, 16, 12, 16);

// Reaction:
reaction_index = player_reaction_item_box;

// Player handle:
player_handle = noone;

// Item id:
item_id = ITEM_BONUS;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Give Item

if (instance_exists(player_handle)) {
    with (player_handle) {
        player_get_item(other.item_id);
    }
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Replace Items

// Shields:
switch (global.gameplay_shields) {
    // Adventure/Advance:
    case 1:
        if (item_id == ITEM_FIRE || item_id == ITEM_BUBBLE) {
            item_id = ITEM_BASIC;
        }

        if (item_id == ITEM_LIGHTNING) {
            item_id = ITEM_MAGNETIC;
        }
        break;

    // Oops, all basic!:
    case 2:
        if (item_id >= ITEM_MAGNETIC && item_id <= ITEM_LIGHTNING) {
            item_id = ITEM_BASIC;
        }
        break;
}

// Debuffs:
if (global.gameplay_debuffs == false) {
    if (item_id == ITEM_SLOW || item_id == ITEM_PANIC || item_id == ITEM_SWAP) {
        item_id = ITEM_MINE;
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Item Box

// Item icon:
draw_sprite(spr_item_icon, item_id, x, y);

// Item box:
draw_sprite(spr_item_box, 1, x, y);

// Collision:
event_inherited();
