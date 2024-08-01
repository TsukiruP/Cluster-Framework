#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Prop Initialization

// Main size variables:
main_left     = 0;
main_right    = 0;
main_top      = 0;
main_bottom   = 0;

main_offset_x = 0;
main_offset_y = 0;

// Hitbox variables:
hitbox_left     = 0;
hitbox_right    = 0;
hitbox_top      = 0;
hitbox_bottom   = 0;

hitbox_offset_x = 0;
hitbox_offset_y = 0;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Size

// Exit if not in debug mode:
if (global.game_debug == false) {
    exit;
}

// Main:
draw_set_color(c_red);

draw_rectangle(x - main_left + main_offset_x, y - main_top + main_offset_y, x + main_right + main_offset_x, y + main_bottom + main_offset_y, true);

// Hitbox:
draw_set_color(c_lime);

draw_rectangle(x - hitbox_left + hitbox_offset_x, y - hitbox_top + hitbox_offset_y, x + hitbox_right + hitbox_offset_x, y + hitbox_bottom + hitbox_offset_y, true);
