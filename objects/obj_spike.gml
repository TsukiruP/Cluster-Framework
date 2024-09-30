#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spike Initialization

event_inherited();

// Mask:
mask = false;

// Reaction:
reaction_index = player_reaction_spike;

// Spike variables:
orientation = ORIEN_VERTICAL;
flip = false;
angle = ANGLE_UP;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field orientation: enum(0, 1)
//field flip: bool

/*preview
    var orientation, flip;

    image_xscale = 1;
    image_yscale = 1;
    orientation = Field("orientation", 0);
    flip = Field("flip", 0);

    switch (orientation)
    {
        // Horizontal:
        case 1:
            sprite_index = Sprite("spr_spike_horizontal", 0);

            if (flip == true)
            {
                image_xscale = -1;
            }
            break;

        // Vertical:
        default:
            sprite_index = Sprite("spr_spike_vertical", 0);

            if (flip == true)
            {
                image_yscale = -1;
            }
    }
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spike Initialization

// Spike orientation:
switch (orientation)
{
    // Horizontal:
    case ORIEN_HORIZONTAL:
        sprite_index = spr_spike_horizontal;
        angle = ANGLE_RIGHT;
        set_hurtbox(16, 16, 8, 15);

        if (flip == true)
        {
            image_xscale = -1;
            angle = ANGLE_LEFT;
        }
        break;

    // Vertical:
    default:
        sprite_index = spr_spike_vertical;
        angle = ANGLE_UP;
        set_hurtbox(16, 8, 15, 15);

        if (flip == true)
        {
            image_yscale = -1;
            angle = ANGLE_DOWN;
        }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Spike

// Spike:
draw_self();

// Collision:
event_inherited();
