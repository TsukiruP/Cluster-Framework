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

// Hurtbox:
set_hurtbox(16, 8, 15, 15);

// Reaction:
reaction_index = -1;

// Spike variables:
spike_orientation = ORIEN_VERTICAL;
spike_flip        = false;
spike_angle       = ANGLE_UP;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field spike_orientation: enum(0, 1)
//field spike_flip: bool

/*preview
    var spike_orientation, spike_flip;

    image_xscale      = 1;
    image_yscale      = 1;
    spike_orientation = Field("spike_orientation", 0);
    spike_flip        = Field("spike_flip", 0);

    switch (spike_orientation) {
        // Horizontal:
        case 1:
            sprite_index = Sprite("spr_spike_horizontal", 0);

            if (spike_flip == true) {
                image_xscale = -1;
            }
            break;

        // Vertical:
        default:
            sprite_index = Sprite("spr_spike_vertical", 0);

            if (spike_flip == true) {
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
switch (spike_orientation) {
    // Horizontal:
    case ORIEN_HORIZONTAL:
        sprite_index = spr_spike_horizontal;
        spike_angle  = ANGLE_RIGHT;
        set_hurtbox(16, 16, 8, 15);

        if (spike_flip == true) {
            image_xscale = -1;
            spike_angle  = ANGLE_LEFT;
        }
        break;

    // Vertical:
    default:
        sprite_index = spr_spike_vertical;
        spike_angle  = ANGLE_UP;
        set_hurtbox(16, 8, 15, 15);

        if (spike_flip == true) {
            image_yscale = -1;
            spike_angle  = ANGLE_DOWN;
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
