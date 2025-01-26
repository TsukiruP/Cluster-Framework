#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spike Initialization

event_inherited();
depth = -10;
reaction_index = player_reaction_spike;
mask = false;
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
//field flip: false

/*preview
var orientation, flip;

orientation = Field("orientation", 0);
flip = Field("flip", 0);

image_xscale = 1;
image_yscale = 1;

switch (orientation)
{
    case 1:
        sprite_index = Sprite("spr_spike_horizontal", 0);
        if (flip) image_xscale = -1;
        break;

    default:
        sprite_index = Sprite("spr_spike_vertical", 0);
        if (flip) image_yscale = -1;
}
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spike Initialization

switch (orientation)
{
    case ORIEN_HORIZONTAL:
        sprite_index = spr_spike_horizontal;
        hurtbox_set(16, 16, 8, 15);
        angle = ANGLE_RIGHT;

        if (flip)
        {
            image_xscale = -1;
            angle = ANGLE_LEFT;
        }
        break;

    default:
        sprite_index = spr_spike_vertical;
        hurtbox_set(16, 8, 15, 15);
        angle = ANGLE_UP;

        if (flip)
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

draw_self();
event_inherited();
