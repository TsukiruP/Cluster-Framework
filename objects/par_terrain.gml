#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Terrain Initialization

event_inherited();

// Collision variables:
collision_layer =  0; // No collision happens with the player on layer mismatch
surface_angle   = -1; // Set this to > -1 to hard-code this solid's angle, otherwise it will be calculated based on its shape
shape           = -1; // SHAPE_RECTANGLE, SHAPE_SLANT, SHAPE_CONCAVE or SHAPE_CONVEX; ignored if surface angle > -1; if left as -1, this solid's angle will be calculated via sensor extension
mask            =  true;

// Flags:
semi_solid = false; // Only the bottom half of the player's mask will collide, and only if their top half isn't also colliding
can_crush  = false; // If the player is embedded inside this solid, they will die
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

// Mask:
if (mask == true) {
    draw_self();
}

// Collision:
event_inherited();
