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

// Size:
main_left     = 13;
main_right    = 12;
main_top      = 16;
main_bottom   = 16;

// Player handle:
player_handle = noone;

// Item data:
item_data = ITEM_BONUS;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Give Item

if (player_handle != noone) {
    with (player_handle) player_get_item(other.item_data);
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Replace Items

// Elemental shields:
if (global.gameplay_elemental == false) {
    if (item_data == ITEM_FIRE || item_data == ITEM_BUBBLE) item_data = ITEM_BASIC;
    if (item_data == ITEM_LIGHTNING) item_data = ITEM_MAGNETIC;
}

// Debuffs:
if (global.gameplay_debuffs == false) {
    if (item_data == ITEM_SLOW || item_data == ITEM_PANIC || item_data == ITEM_SWAP) item_data = ITEM_MINE;
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Item Box

// Item icon:
draw_sprite(spr_items, item_data, x, y);

// Item box:
draw_sprite(spr_item_box, 1, x, y);

// Size:
event_inherited();
