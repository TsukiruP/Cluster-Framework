#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Terrain Initialization

// Image speed:
image_speed = 0;

// Terrain variables:
collision      =  true;
type           =  SOLID_FULL;
layer          = -1;
platform_check =  true;

// Collision data
collision_layer = 0; // No collision happens with the player on layer mismatch
surface_angle = -1; // Set this to > -1 to hard-code this solid's angle, otherwise it will be calculated based on its shape
shape = -1; // SHAPE_RECTANGLE, SHAPE_SLANT, SHAPE_CONCAVE or SHAPE_CONVEX; ignored if surface angle > -1; if left as -1, this solid's angle will be calculated via sensor extension

// Flags
semisolid = false; // Only the bottom half of the player's mask will collide, and only if their top half isn't also colliding
can_crush = false; // If the player is embedded inside this solid, they will die
