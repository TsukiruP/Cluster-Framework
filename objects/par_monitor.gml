#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Monitor Initialization

// Image speed:
image_speed = 0;

// Character handle:
character_handle = noone;

// Item data variables:
item_data = ITEM_BONUS;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Give Item

if(character_handle != noone) {
    with(character_handle) character_get_item(other.item_data);
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Replace Items

//[PLACEHOLDER]
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Monitor

// Monitor icon:
draw_sprite(spr_monitor_icons, item_data, x, y);

// Monitor box:
draw_sprite(spr_monitor, 1, x, y);
