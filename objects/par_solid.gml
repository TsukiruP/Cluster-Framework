#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Solid Initialization

event_inherited();

// Collision:
layer = -1; // No collision happens with the player on layer mismatch
surface_angle = -1; // Set this to > -1 to hard-code this solid's angle, otherwise it will be calculated based on its shape
shape = SHP_RECTANGLE; // SHP_RECTANGLE, SHP_RIGHT_TRIANGLE, SHP_QUARTER_PIPE, SHP_QUARTER_ELLIPSE or SHP_CUSTOM; ignored if surface angle > -1; if left as -1, this solid's angle will be calculated via sensor extension
is_mask = true;

// Flags:
semisolid = false; // Only the bottom half of the player's mask will collide, and only if their top half isn't also colliding
can_launch = false; // The player will launch off this solid when moving fast enough.
can_crush = false; // If the player is embedded inside this solid, they will die
can_push = false; // The player can push this solid if they're moving against it
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field layer: enum(0, 1)
//field semisolid: false

/*preview
image_blend = pick(FieldDefined("layer"), c_white, pick(Field("layer", 0), c_blue, c_red));
image_alpha = pick(Field("semisolid", 0), 1, 0.5);
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Solid

if ((game_get_debug_visible() && is_mask) || !is_mask) draw_self();
