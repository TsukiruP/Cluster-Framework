#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Deactivatable Initialization

// Image speed:
image_speed = 0;

// Hurtbox:
set_hurtbox();

// Hitbox:
set_hitbox();

// Reaction:
reaction_index = -1;
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

// Hurtbox:
draw_collision(hurtbox_left, hurtbox_top, hurtbox_right, hurtbox_bottom, hurtbox_offset_x, hurtbox_offset_y, image_xscale, gravity_angle(), c_maroon);

// Hitbox:
draw_collision(hitbox_left, hitbox_top, hitbox_right, hitbox_bottom, hitbox_offset_x, hitbox_offset_y, image_xscale, gravity_angle(), c_green);
