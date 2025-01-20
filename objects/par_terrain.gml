#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Terrain Initialization

event_inherited();

// Collision:
layer = -1; // No collision happens with the player on layer mismatch
surface_angle = -1; // Set this to > -1 to hard-code this solid's angle, otherwise it will be calculated based on its shape
shape = SHAPE_RECTANGLE; // SHAPE_RECTANGLE, SHAPE_SLANT, SHAPE_CONCAVE or SHAPE_CONVEX; ignored if surface angle > -1; if left as -1, this solid's angle will be calculated via sensor extension
mask =  true;

// Flags:
semisolid = false; // Only the bottom half of the player's mask will collide, and only if their top half isn't also colliding
can_crush = false; // If the player is embedded inside this solid, they will die
can_push = false; // The player can push this solid if they're moving against it
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field layer: enum(-1, 0, 1)
//field semisolid: false

/*preview
    var layer, semisolid;

    layer = Field("layer", 0);
    semisolid = Field("semisolid", 0);
    image_blend = c_white;
    image_alpha = 1;

    if (FieldDefined("layer"))
    {
        switch (layer)
        {
            case 0:
                image_blend = c_blue;
                break;

            case 1:
                image_blend = c_red;
                break;
        }
    }

    if (semisolid)
    {
        image_alpha = 0.5;
    }
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Terrain

if ((game_get_debug() && mask) || !mask)
{
    draw_self();
}

event_inherited();
