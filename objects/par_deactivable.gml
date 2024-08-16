#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Deactivable Initialization

// Image speed:
image_speed = 0;

// Hurtbox:
set_hurtbox();

// Hitbox:
set_hitbox();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Collision

// Exit if not in debug mode:
if (global.game_debug == false) {
    exit;
}

var x_int, y_int;

x_int = floor(x) + hurtbox_offset_x;
y_int = floor(y) + hurtbox_offset_y;

// Hurtbox:
if !(hurtbox_left == 0 && hurtbox_top == 0 && hurtbox_right == 0 && hurtbox_bottom == 0) {
    draw_rectangle_color(x_int - hurtbox_left, y_int - hurtbox_top, x_int + hurtbox_right, y_int + hurtbox_bottom, c_red, c_red, c_red, c_red, true);
}
